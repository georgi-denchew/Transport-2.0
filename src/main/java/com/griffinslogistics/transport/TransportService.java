/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.transport;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.entities.TruckGroup;
import com.griffinslogistics.resource.ResourceBundleBean;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.hibernate.FetchMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class TransportService implements ITransportService {

    @Autowired
    IDAO transportDAO;

    @Autowired
    ResourceBundleBean resourceBundleBean;

    @Override
    public boolean addTransport(Transport transport) {

        boolean result = false;

        Transport existing = checkDuplicateTransport(transport);

        if (existing == null) {
            result = transportDAO.update(transport);
        } else {
            String message = resourceBundleBean.get(ResourceBundleBean.ERROR_TRANSPORT_EXISTS);
            throw new UnsupportedOperationException(message);
        }

        return result;
    }

    @Override
    public List<Transport> getAll() {
        DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
        List<Transport> result = transportDAO.getAllByDetachedCriteria(criteria);
        return result;
    }

    private Transport checkDuplicateTransport(Transport transport) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
        criteria.add(Restrictions.eq("weekNumber", transport.getWeekNumber()));
        criteria.add(Restrictions.eq("year", transport.getYear()));
        criteria.add(Restrictions.eq("startDate", transport.getStartDate()));
        Transport existing = (Transport) transportDAO.getByDetachedCriteria(criteria);
        return existing;
    }

    @Override
    public Map<String, Double> totalWeightsForTransport(Long transportId) {

        Map<String, Double> result = new TreeMap<String, Double>();

        DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
        criteria.add(Restrictions.eq("id", transportId));
        criteria.setFetchMode("bookspackages", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.truckGroup", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.books", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.books.boxes", FetchMode.JOIN);
        Transport transport = (Transport) this.transportDAO.getByDetachedCriteria(criteria);

        String transportationString = String.format("Транспорт‚ %s/%s", transport.getWeekNumber(), transport.getYear());

        Set<Bookspackage> bookspackages = transport.getBookspackages();

        for (Bookspackage bookspackage : bookspackages) {

            double totalWeightForTruckGroup = 0;

            for (Book book : bookspackage.getBooks()) {
                double weightPerBook = book.getWeightPerBook();

                totalWeightForTruckGroup += book.getCount() * weightPerBook;
            }

            if (totalWeightForTruckGroup > 0) {
                double totalWeightForTransport = totalWeightForTruckGroup;

                if (result.containsKey(transportationString)) {
                    totalWeightForTransport += result.get(transportationString);
                }

                result.put(transportationString, totalWeightForTransport);

                TruckGroup truckGroup = bookspackage.getTruckGroup();

                String keyName;

                if (truckGroup != null) {
                    keyName = bookspackage.getTruckGroup().getName();
                } else {
                    keyName = resourceBundleBean.get(ResourceBundleBean.NO_TRUCK_GROUP);
                }

                if (result.containsKey(keyName)) {
                    totalWeightForTruckGroup += result.get(keyName);
                }

                result.put(keyName, totalWeightForTruckGroup);
            }
        }
        return result;
    }

    @Override
    public Transport get(Long id) {
        return (Transport) this.transportDAO.get(Transport.class, id);
    }
}

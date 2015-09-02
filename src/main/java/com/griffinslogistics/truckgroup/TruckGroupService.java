/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.truckgroup;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Box;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.entities.TruckGroup;
import com.griffinslogistics.transport.ITransportService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class TruckGroupService implements ITruckGroupService {

    private static final Logger logger = Logger.getLogger(TruckGroupService.class.getName());
    private static final String CLASS_NAME = TruckGroupService.class.getSimpleName();

    @Autowired
    IDAO dao;

    @Autowired
    ITransportService transportService;

    @Override
    public List<TruckGroup> getAllTruckGroups() {
        DetachedCriteria criteria = DetachedCriteria.forClass(TruckGroup.class);

        return (List<TruckGroup>) dao.getAllByDetachedCriteria(criteria);
    }

    @Override
    public Map<String, TruckGroupTotalsModel> getTruckGroupTotalsForTransport(Long transportId) {
        logger.log(Level.SEVERE, "{0}: getTruckGroupTotalsForTransport started", CLASS_NAME);

        Map<String, TruckGroupTotalsModel> resultModels = new HashMap<String, TruckGroupTotalsModel>();

        try {
            DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
            criteria.add(Restrictions.eq("id", transportId));
            criteria.setFetchMode("bookspackages", FetchMode.JOIN);
            criteria.setFetchMode("bookspackages.truckGroup", FetchMode.JOIN);
            criteria.setFetchMode("bookspackages.books", FetchMode.JOIN);
            criteria.setFetchMode("bookspackages.books.boxes", FetchMode.JOIN);
            Transport transport = (Transport) this.dao.getByDetachedCriteria(criteria);

            Set<Bookspackage> bookspackages = transport.getBookspackages();

            for (Bookspackage bookspackage : bookspackages) {

                double totalWeightForTruckGroup = 0;
                double totalOrderedBooksWeight = 0;

                for (Book book : bookspackage.getBooks()) {
                    double weightPerBook = book.getWeightPerBook();

                    totalOrderedBooksWeight += book.getWeight();

                    for (Box box : (Set<Box>) book.getBoxes()) {
                        totalWeightForTruckGroup += box.getBooksCount() * box.getBoxesCount() * weightPerBook;
                    }
                }

                if (totalWeightForTruckGroup > 0) {

                    TruckGroup truckGroup = bookspackage.getTruckGroup();

                    if (truckGroup != null) {

                        TruckGroupTotalsModel model;

                        if (resultModels.containsKey(truckGroup.getName())) {
                            model = resultModels.get(truckGroup.getName());
                        } else {
                            model = new TruckGroupTotalsModel(truckGroup.getId(), truckGroup.getName(), 0, 0, 0d);
                        }

                        model.setPackagesCount(model.getPackagesCount() + 1);
                        model.setArrivedWeight(model.getArrivedWeight() + (int) totalWeightForTruckGroup);
                        double newTotalPrice = model.getTotalPrice() + (totalOrderedBooksWeight * bookspackage.getPricePerKilogram().doubleValue());
                        model.setTotalPrice(newTotalPrice);

                        resultModels.put(truckGroup.getName(), model);
                    }
                }
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: getTruckGroupTotalsForTransport finished", CLASS_NAME);
        }

        return resultModels;
    }
}

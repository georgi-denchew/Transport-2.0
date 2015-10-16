/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Box;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.entities.TruckGroup;
import com.griffinslogistics.resource.ResourceBundleBean;
import com.griffinslogistics.transport.ITransportService;
import com.griffinslogistics.utils.Utilities;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
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
public class BookspackageService implements IBookspackageService {

    private static final String QUERY_TOTAL_WEIGHT_FOR_ALL_BOOKSPACKAGES = "select bookspackage.packageNumber as packageNumber, bookspackage.deliveryAddress as deliveryAddress, sum(book.weightPerBook * box.booksCount * box.boxesCount) as totalWeight, sum(box.boxesCount) as totalBoxesCount "
            + "from Book book inner join book.boxes as box "
            + "inner join book.bookspackage as bookspackage "
            + "where book.transportId = :transportId "
            + "group by book.bookspackageId";

    private static final String QUERY_TOTAL_WEIGHT_FOR_BOOKSPACKAGE = "select bookspackage.packageNumber as packageNumber, bookspackage.deliveryAddress as deliveryAddress, sum(book.weightPerBook * box.booksCount * box.boxesCount) as totalWeight, sum(box.boxesCount) as totalBoxesCount "
            + "from Book book inner join book.boxes as box "
            + "inner join book.bookspackage as bookspackage "
            + "where book.bookspackageId = :bookspackageId ";

    private static final String QUERY_BIGGEST_BOOKSPACKAGE_NUMBER_FOR_TRANSPORTATION = "select b.packageNumber from Bookspackage b where b.transportId = :transportId";

    @Autowired
    IDAO dao;

    @Autowired
    ResourceBundleBean resourceBundleBean;

    @Autowired
    ITransportService transportService;

    @Override
    public List<Bookspackage> getBookspackagesByTransportId(Long transportId) {

        DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
        criteria.add(Restrictions.eq("id", transportId));
        criteria.setFetchMode("bookspackages", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.truckGroup", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.books", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.boxes", FetchMode.JOIN);
        criteria.setFetchMode("bookspackages.books.boxes", FetchMode.JOIN);

        Transport transportationForBookspackage = (Transport) this.dao.getByDetachedCriteria(criteria);

        List<Bookspackage> bookspackages = new ArrayList(transportationForBookspackage.getBookspackages());

        for (Bookspackage bookspackage : bookspackages) {

            BookspackagePriorityEnum priorityEnum = BookspackagePriorityEnum.byValue(bookspackage.getPriority());
            bookspackage.setDisplayPriority(priorityEnum.getDisplayValue());

            int totalBooksCount = 0;
            double totalBooksWeight = 0;
            int totalOrderedBooksCount = 0;
            double totalOrderedBooksWeight = 0;
            int totalBoxesCount = 0;

            for (Book book : bookspackage.getBooks()) {

                if (book.isDiscarded()) {
                    bookspackage.setHasDiscardedBooks(true);
                }

                totalOrderedBooksCount += book.getCount();
                totalOrderedBooksWeight += book.getWeight();

                for (Box box : book.getBoxes()) {
                    int boxesCount = box.getBoxesCount();
                    int booksCount = box.getBooksCount();

                    totalBooksCount += boxesCount * booksCount;
                    totalBooksWeight += boxesCount * booksCount * book.getWeightPerBook();
                    totalBoxesCount += boxesCount;
                }
            }

            TruckGroup truckGroup = bookspackage.getTruckGroup();
            if (truckGroup != null) {
                truckGroup.getName();
            }

            totalBooksWeight = Math.round(totalBooksWeight);
            totalOrderedBooksWeight = Math.round(totalOrderedBooksWeight);
            bookspackage.setTotalBooksCount(totalBooksCount);
            bookspackage.setTotalBooksWeight(totalBooksWeight);
            bookspackage.setTotalOrderedBooksCount(totalOrderedBooksCount);
            bookspackage.setTotalOrderedBooksWeight(totalOrderedBooksWeight);
            bookspackage.setBoxesCount(totalBoxesCount);
        }

        Collections.reverse(bookspackages);
        return bookspackages;
    }

    @Override
    public String getBiggestBookspackageNumberForTransport(Long transportId) {

        String biggestBookspackageNumber = null;

        Map<String, Object> queryParameters = new HashMap<String, Object>();
        queryParameters.put("transportId", transportId);

        List<String> numberStrings = (List<String>) dao.getAllByQuery(QUERY_BIGGEST_BOOKSPACKAGE_NUMBER_FOR_TRANSPORTATION, queryParameters, null);

        int maxNumber = 0;
        for (String string : numberStrings) {
            int firstDashIndex = string.indexOf("-");

            String substring = string.substring(0, firstDashIndex);
            int currentNumber = Integer.parseInt(substring);

            if (maxNumber < currentNumber) {
                maxNumber = currentNumber;
                biggestBookspackageNumber = string;
            }
        }
        numberStrings.size();

        return biggestBookspackageNumber;
    }

    @Override
    public String generateUniqueBookspackageNumber(String biggestNumber, int year, int week) {
        return Utilities.generateUniqueBookspackageNumber(biggestNumber, year, week);
    }

    @Override
    public boolean updateBookspackage(Bookspackage bookspackage) {
        bookspackage.setLastModification(new Date());

        if (bookspackage.getBooks() != null && bookspackage.getBooks().size() > 0) {
            Book testBook = bookspackage.getBooks().iterator().next();

            if (!testBook.getDeliveryAddress().equals(bookspackage.getDeliveryAddress())) {
                for (Book book : bookspackage.getBooks()) {
                    book.setDeliveryAddress(bookspackage.getDeliveryAddress());
                }
            }
        }

        return this.dao.update(bookspackage);
    }

    @Override
    public Bookspackage get(Long id) {
        return (Bookspackage) this.dao.get(Bookspackage.class, id);
    }

    @Override
    public boolean addBookspackage(Bookspackage bookspackage) {
        Long transportId = bookspackage.getTransportId();
        String biggestNumber = this.getBiggestBookspackageNumberForTransport(transportId);
        String newNumber = this.generateUniqueBookspackageNumber(
                biggestNumber,
                bookspackage.getTransport().getYear(),
                bookspackage.getTransport().getWeekNumber());
        bookspackage.setPackageNumber(newNumber);

        bookspackage.setPricePerKilogram(new BigDecimal("1"));

        boolean result = this.updateBookspackage(bookspackage);
        return result;
    }

    @Override
    public boolean deleteBookspackage(Bookspackage bookspackage) {
        return dao.delete(bookspackage);
    }

    @Override
    public List<BookspackageCMRModel> totalBookspackageCMRModelsByTransportId(Long transportId) {
        Map<String, Object> queryParameters = new HashMap<String, Object>();
        queryParameters.put("transportId", transportId);

        List<BookspackageCMRModel> result = (List<BookspackageCMRModel>) dao.getAllByQuery(QUERY_TOTAL_WEIGHT_FOR_ALL_BOOKSPACKAGES, queryParameters, BookspackageCMRModel.class);
        return result;
    }

    @Override
    public BookspackageCMRModel bookspackageCMRModelById(Long bookspackageId) {
        Map<String, Object> queryParameters = new HashMap<String, Object>();
        queryParameters.put("bookspackageId", bookspackageId);

        BookspackageCMRModel result = (BookspackageCMRModel) dao.getByQuery(QUERY_TOTAL_WEIGHT_FOR_BOOKSPACKAGE, queryParameters, BookspackageCMRModel.class);
        return result;
    }

    @Override
    public List<Bookspackage> getBookpackagesHistory(Long id) {
        List<Object[]> revisions = dao.getRevisions(Bookspackage.class, id);

        List<Bookspackage> bookspackages = new ArrayList<Bookspackage>(revisions.size());

        for (Object[] revision : revisions) {
            Bookspackage bookspackage = (Bookspackage) revision[0];
            Hibernate.initialize(bookspackage.getTruckGroup());

            BookspackagePriorityEnum priorityEnum = BookspackagePriorityEnum.byValue(bookspackage.getPriority());
            bookspackage.setDisplayPriority(priorityEnum.getDisplayValue());

            bookspackages.add(bookspackage);
        }

        return bookspackages;
    }
}

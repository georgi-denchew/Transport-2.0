/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.bookspackage.IBookspackageService;
import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Box;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.resource.ResourceBundleBean;
import com.griffinslogistics.transport.ITransportService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class BookService implements IBookService, Serializable {

    private static final Logger logger = Logger.getLogger(BookService.class.getName());
    private static final String CLASS_NAME = BookService.class.getSimpleName();

    private static final String QUERY_BOOK_EXTENDED_MODEL_BY_TRANSPORT_ID = "select bo.bookNumber as bookNumber, bo.title as title, sum(b.booksCount * b.boxesCount) as count "
            + "from Book bo "
            + "join bo.boxes b "
            + "where bo.transportId = :transportId "
            + "group by bo.bookNumber ";

    private static final String QUERY_BOOK_BOX_MODELS_BY_PACKAGE = "select bo.bookNumber as bookNumber, bo.title as title, b.booksCount as booksCount, sum(b.boxesCount) as boxesCount "
            + "from Book bo "
            + "join bo.boxes b "
            + "where bo.bookspackageId = :bookspackageId "
            + "group by b.booksCount, bo.bookNumber "
            + "order by bo.bookNumber ";

    private static final String QUERY_BIGGEST_BOOK_NUMBER_FOR_TRANSPORT = "select max(book.bookNumber) from Book book where book.transportId = :transportId";

    @Autowired
    IDAO dao;

    @Autowired
    IBookspackageService bookspackageService;

    @Autowired
    ITransportService transportService;

    @Autowired
    ResourceBundleBean resourceBundleBean;

    @Override
    public List<Book> getBooksByBookspackageId(Long bookspackageId) {
        List<Book> result = new ArrayList<Book>();
        try {
            Bookspackage bookspackage = this.bookspackageService.get(bookspackageId);
            result.addAll(bookspackage.getBooks());

            Collections.sort(result, new Comparator<Book>() {
                @Override
                public int compare(Book o1, Book o2) {
                    return o2.getId().compareTo(o1.getId());
                }
            });

            for (Book book : result) {
                long totalBooksCount = 0;
                double totalBooksWeight = 0;

                // lazy loading
                if (book.getPrintingHouse() != null) {
                    book.getPrintingHouse().getName();
                }

                for (Box box : book.getBoxes()) {
                    int boxesCount = box.getBoxesCount();
                    int booksCount = box.getBooksCount();

                    totalBooksCount += boxesCount * booksCount;
                    totalBooksWeight += boxesCount * booksCount * book.getWeightPerBook();
                }

                book.setTotalBooksCount(totalBooksCount);
                book.setTotalBooksWeight(totalBooksWeight);
            }

        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getBooksByBookspackage finished", CLASS_NAME);
        }

        return result;
    }

    @Override
    public List<BookExtendedModel> getAllBookExtendedModelsByTransportId(Long transportId) {
        List<BookExtendedModel> result = new ArrayList<BookExtendedModel>();

        Map<String, Object> queryParameters = new HashMap<String, Object>();
        queryParameters.put("transportId", transportId);

        try {
            result = (List<BookExtendedModel>) this.dao.getAllByQuery(QUERY_BOOK_EXTENDED_MODEL_BY_TRANSPORT_ID, queryParameters, BookExtendedModel.class);
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getAllBooksByTransportation finished", CLASS_NAME);
        }

        return result;

    }

    @Override
    public List<BookBoxModel> getAllBookBoxModelsByBookspackageId(Long bookspackageId) {
        List<BookBoxModel> result = new ArrayList<BookBoxModel>();

        try {
            Map<String, Object> queryParameters = new HashMap<String, Object>();
            queryParameters.put("bookspackageId", bookspackageId);

            result = (List<BookBoxModel>) this.dao.getAllByQuery(QUERY_BOOK_BOX_MODELS_BY_PACKAGE, queryParameters, BookBoxModel.class);

            Bookspackage bookspackage = this.bookspackageService.get(bookspackageId);

            for (BookBoxModel bookBoxModel : result) {
                bookBoxModel.setClient(bookspackage.getClient());
                bookBoxModel.setDeliveryAddress(bookspackage.getDeliveryAddress());
            }
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage(), CLASS_NAME);

        } finally {
            logger.log(Level.SEVERE, "{0}: getAllBookBoxModelsByPackage finished", CLASS_NAME);
        }

        return result;
    }

    @Override
    public Map<String, List<BookBoxModel>> getAllBookBoxModelsByTransportId(Long transportId) {
        Map<String, List<BookBoxModel>> result = new HashMap<String, List<BookBoxModel>>();

        try {
            Transport transportation = this.transportService.get(transportId);

            for (Bookspackage bookspackage : transportation.getBookspackages()) {

                Map<String, Object> queryParameters = new HashMap<String, Object>();
                queryParameters.put("bookspackageId", bookspackage.getId());
                List<BookBoxModel> bookBoxModels = (List<BookBoxModel>) this.dao.getAllByQuery(QUERY_BOOK_BOX_MODELS_BY_PACKAGE, queryParameters, BookBoxModel.class);

                for (BookBoxModel bookBoxModel : bookBoxModels) {
                    bookBoxModel.setClient(bookspackage.getClient());
                    bookBoxModel.setDeliveryAddress(bookspackage.getDeliveryAddress());
                }

                if (bookBoxModels.size() > 0) {
                    result.put(bookspackage.getPackageNumber(), bookBoxModels);
                }
            }

        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: getAllBookBoxModelsByTransportation finished", CLASS_NAME);
        }

        return result;
    }

    @Override
    public List<BookModel> getBookModelsByTransportId(Long transportId) {
        logger.log(Level.SEVERE, "{0}: getBookModelsByTransportation started", CLASS_NAME);

        List<BookModel> resultList = new ArrayList<BookModel>();

        try {
            DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
            criteria.add(Restrictions.eq("transportId", transportId));
            criteria.setProjection(Projections.projectionList()
                    .add(Projections.groupProperty("bookNumber"), "bookNumber")
                    .add(Projections.property("title"), "title"))
                    .setResultTransformer(Transformers.aliasToBean(BookModel.class));

            resultList = (List<BookModel>) this.dao.getAllByDetachedCriteria(criteria);
            Collections.reverse(resultList);

        } catch (HibernateException e) {

            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getBookModelsByTransportation finished", CLASS_NAME);
        }

        return resultList;
    }

    @Override
    public boolean updateBook(Book book) {
        return this.dao.update(book);
    }

    @Override
    public Integer getBiggestBookNumberForTransportId(Long transportId) {

        logger.log(Level.SEVERE, "{0}: getBiggestBookNumberForTransportation started", CLASS_NAME);

        Integer biggestBookspackageNumber = null;

        try {
            Map<String, Object> queryParameters = new HashMap<String, Object>();
            queryParameters.put("transportId", transportId);
            biggestBookspackageNumber = (Integer) this.dao.getByQuery(QUERY_BIGGEST_BOOK_NUMBER_FOR_TRANSPORT, queryParameters, null);
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: getBiggestBookNumberForTransportation finished", CLASS_NAME);

        }

        return biggestBookspackageNumber;
    }

    @Override
    public boolean deleteBook(Book book) {
        return this.dao.delete(book);
    }

    @Override
    public List<BookLabelModel> getLabelInfoForBooks(List<Long> selectedBookIds) {

        DetachedCriteria criteria = DetachedCriteria.forClass(Book.class)
                .setFetchMode(Bookspackage.class.getName(), FetchMode.JOIN)
                .add(Restrictions.in("id", selectedBookIds));

        List<Book> books = (List<Book>) this.dao.getAllByDetachedCriteria(criteria);

        List<BookLabelModel> result = new ArrayList<BookLabelModel>();

        if (books != null && !books.isEmpty()) {
            Transport transport = (Transport) books.get(0).getTransport();

            for (Book book : books) {
                BookLabelModel model = new BookLabelModel(book.getDeliveryAddress(), book.getBookspackage().getPostalCode(),
                        book.getTitle(), book.getBookNumber(), book.getBookspackage().getClient(),
                        transport.getWeekNumber() + "/" + transport.getYear(), (long) book.getCount(), book.getBookspackage().getPackageNumber());

                result.add(model);
            }
        }

        return result;
    }

    @Override
    public List<BookLabelModel> getLabelInfoForTransportId(Long transportId) {
        List<BookLabelModel> result = new ArrayList<BookLabelModel>();
        Transport transport = transportService.get(transportId);

        for (Bookspackage bookspackage : transport.getBookspackages()) {
            for (Book book : bookspackage.getBooks()) {
                BookLabelModel model = new BookLabelModel(book.getDeliveryAddress(), bookspackage.getPostalCode(),
                        book.getTitle(), book.getBookNumber(), bookspackage.getClient(),
                        transport.getWeekNumber() + "/" + transport.getYear(), (long) book.getCount(), bookspackage.getPackageNumber());

                result.add(model);
            }
        }

        return result;
    }

    @Override
    public BookLabelModel getLabelInfoForBookId(Long bookId) {
        logger.log(Level.SEVERE, "{0}: getLabelInfoForBook started", CLASS_NAME);

        BookLabelModel result = null;

        try {
            Book book = this.get(bookId);

            Transport transport = book.getTransport();
            Bookspackage bookspackage = book.getBookspackage();
            result = new BookLabelModel(bookspackage.getDeliveryAddress(), bookspackage.getPostalCode(),
                    book.getTitle(), book.getBookNumber(), bookspackage.getClient(),
                    transport.getWeekNumber() + "/" + transport.getYear(), (long) book.getCount(), bookspackage.getPackageNumber());

        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getLabelInfoForBook finished", CLASS_NAME);
        }

        return result;
    }

    @Override
    public List<BookForTransportationModel> getBooksForTransportModelByTransportId(Long transportId) {
        logger.log(Level.SEVERE, "{0}: getBooksForTransportation started", CLASS_NAME);

        List<BookForTransportationModel> resultList = new ArrayList<BookForTransportationModel>();

        try {

            DetachedCriteria criteria = DetachedCriteria.forClass(Transport.class);
            criteria.add(Restrictions.eq("id", transportId));
            criteria.setFetchMode("books", FetchMode.JOIN);
            criteria.setFetchMode("books.boxes", FetchMode.JOIN);

            Transport transportation = (Transport) this.dao.getByDetachedCriteria(criteria);

            for (Book book : transportation.getBooks()) {
                Hibernate.initialize(book.getBoxes());

                if (book.getPrintingHouse() != null) {
                    book.getPrintingHouse().getName();
                }

                BookForTransportationModel model = BookForTransportationModel.fromBook(book);
                resultList.add(model);
            }

            Collections.reverse(resultList);
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getBooksForTransportation finished", CLASS_NAME);
        }

        return resultList;
    }

    @Override
    public List<Book> getBooksByTransportId(Long transportId) {
        Transport transport = transportService.get(transportId);
        List<Book> result = new ArrayList<>(transport.getBooks());

        return result;
    }

    @Override
    public boolean updateBookDiscardedField(Long id, boolean discarded) {
        logger.log(Level.SEVERE, "{0}: updateBookDiscardedField started", CLASS_NAME);

        boolean updateSuccessful = false;

        try {
            Book book = (Book) this.dao.get(Book.class, id);
            book.setDiscarded(discarded);
            this.dao.update(book);
            updateSuccessful = true;
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: updateBookDiscardedField finished", CLASS_NAME);
        }

        return updateSuccessful;
    }

    @Override
    public Book get(Long id) {
        return (Book) dao.get(Book.class, id);
    }

}

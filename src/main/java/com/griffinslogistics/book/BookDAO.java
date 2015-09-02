/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class BookDAO implements IBookDAO {

    private static final Logger logger = Logger.getLogger(BookDAO.class.getName());
    private static final String CLASS_NAME = BookDAO.class.getSimpleName();

    private static final String QUERY_BOOK_BOX_MODELS_BY_PACKAGE = "select bo.bookNumber as bookNumber, bo.title as title, b.booksCount as booksCount, sum(b.boxesCount) as boxesCount "
            + "from Book bo "
            + "join bo.boxes b "
            + "where bo.bookspackageId = :bookspackageId "
            + "group by b.booksCount, bo.bookNumber "
            + "order by bo.bookNumber ";

    private static final String QUERY_BOOK_EXTENDED_MODEL_BY_TRANSPORT_ID = "select bo.bookNumber as bookNumber, bo.title as title, sum(b.booksCount * b.boxesCount) as count "
            + "from Book bo "
            + "join bo.boxes b "
            + "where bo.transportId = :transportId "
            + "group by bo.bookNumber ";

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<BookExtendedModel> getAllBookExtendedModelsByTransportId(Long transportId) {
//        List<BookExtendedModel> result = new ArrayList<BookExtendedModel>();
//
//        try {
//            Query query = this.sessionFactory.getCurrentSession().createQuery(QUERY_BOOK_EXTENDED_MODEL_BY_TRANSPORT_ID);
//            query.setParameter("transportId", transportId);
//            query.setResultTransformer(Transformers.aliasToBean(BookExtendedModel.class));
//            result = (List<BookExtendedModel>) query.list();
//
//        } catch (HibernateException e) {
//            logger.log(Level.SEVERE, e.getMessage());
//        } finally {
//
//            logger.log(Level.SEVERE, "{0}: getAllBooksByTransportation finished", CLASS_NAME);
//        }
//
//        return result;
        
        return null;
    }

    @Override
    public List<BookBoxModel> getAllBookBoxModelsByBookspackageId(Long bookspackageId) {
//        List<BookBoxModel> result = new ArrayList<BookBoxModel>();
//
//        try {
//            Query query = this.sessionFactory.getCurrentSession().createQuery(QUERY_BOOK_BOX_MODELS_BY_PACKAGE);
//
//            query.setParameter("bookspackageId", bookspackageId);
//            query.setResultTransformer(Transformers.aliasToBean(BookBoxModel.class));
//            result = (List<BookBoxModel>) query.list();
//
//            Bookspackage bookspackage = (Bookspackage) this.sessionFactory.getCurrentSession().get(Bookspackage.class, bookspackageId);
//
//            for (BookBoxModel bookBoxModel : result) {
//                bookBoxModel.setClient(bookspackage.getClient());
//                bookBoxModel.setDeliveryAddress(bookspackage.getDeliveryAddress());
//            }
//        } catch (HibernateException e) {
//            logger.log(Level.SEVERE, e.getMessage(), CLASS_NAME);
//
//        } finally {
//            logger.log(Level.SEVERE, "{0}: getAllBookBoxModelsByPackage finished", CLASS_NAME);
//        }
//
//        return result;
        
        return null;
    }

    @Override
    public Map<String, List<BookBoxModel>> getAllBookBoxModelsByTransportId(Long transportId) {
//        Map<String, List<BookBoxModel>> result = new HashMap<String, List<BookBoxModel>>();
//
//        try {
//            Transport transportation = (Transport) this.sessionFactory.getCurrentSession().get(Transport.class, transportId);
//
//            for (Bookspackage bookspackage : transportation.getBookspackages()) {
//
//                Query query = this.sessionFactory.getCurrentSession().createQuery(QUERY_BOOK_BOX_MODELS_BY_PACKAGE);
//
//                query.setParameter("bookspackageId", bookspackage.getId());
//                query.setResultTransformer(Transformers.aliasToBean(BookBoxModel.class));
//                List<BookBoxModel> bookBoxModels = (List<BookBoxModel>) query.list();
//
//                for (BookBoxModel bookBoxModel : bookBoxModels) {
//                    bookBoxModel.setClient(bookspackage.getClient());
//                    bookBoxModel.setDeliveryAddress(bookspackage.getDeliveryAddress());
//                }
//
//                if (bookBoxModels.size() > 0) {
//                    result.put(bookspackage.getPackageNumber(), bookBoxModels);
//                }
//            }
//
//        } catch (HibernateException e) {
//            logger.log(Level.SEVERE, e.getMessage());
//        } finally {
//            logger.log(Level.SEVERE, "{0}: getAllBookBoxModelsByTransportation finished", CLASS_NAME);
//        }
//
//        return result;
        
        return null;
    }

    @Override
    public List<BookModel> getBookModelsByTransportId(Long transportId) {
//        logger.log(Level.SEVERE, "{0}: getBookModelsByTransportation started", CLASS_NAME);
//
//        List<BookModel> resultList = new ArrayList<BookModel>();
//
//        try {
//            Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(Book.class);
//            criteria.add(Restrictions.eq("transportId", transportId));
//            criteria.setProjection(Projections.projectionList()
//                    .add(Projections.groupProperty("bookNumber"), "bookNumber")
//                    .add(Projections.property("title"), "title"))
//                    .setResultTransformer(Transformers.aliasToBean(BookModel.class));
//
//            resultList = criteria.list();
//            Collections.reverse(resultList);
//
//        } catch (HibernateException e) {
//
//            logger.log(Level.SEVERE, e.getMessage());
//        } finally {
//
//            logger.log(Level.SEVERE, "{0}: getBookModelsByTransportation finished", CLASS_NAME);
//        }
//
//        return resultList;
        
        return null;
    }

    @Override
    public boolean update(Book book) {
        boolean updated = false;
        this.sessionFactory.getCurrentSession().saveOrUpdate(book);
        updated = true;

        return updated;
    }

    @Override
    public Integer getBiggestBookNumberForTransportId(Long transportId) {
//        logger.log(Level.SEVERE, "{0}: getBiggestBookNumberForTransportation started", CLASS_NAME);
//
//        Integer biggestBookspackageNumber = null;
//
//        try {
//            Query query = this.sessionFactory.getCurrentSession().createQuery("select max(book.bookNumber) from Book book where book.transportId = :transportId");
//            query.setParameter("transportId", transportId);
//            biggestBookspackageNumber = (Integer) query.uniqueResult();
//        } catch (HibernateException e) {
//            logger.log(Level.SEVERE, e.getMessage());
//        } finally {
//            logger.log(Level.SEVERE, "{0}: getBiggestBookNumberForTransportation finished", CLASS_NAME);
//
//        }
//
//        return biggestBookspackageNumber;
        return null;
    }

    @Override
    public boolean delete(Book book) {
        logger.log(Level.SEVERE, "{0}: deleteBook started", CLASS_NAME);

        boolean isDeleted = false;

        try {
            this.sessionFactory.getCurrentSession().delete(book);
            isDeleted = true;
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: deleteBook finished", CLASS_NAME);
        }

        return isDeleted;
    }

    @Override
    public List<Book> getAllById(List<Long> selectedBookIds) {
        return this.sessionFactory.getCurrentSession().createCriteria(Book.class)
                .setFetchMode(Bookspackage.class.getName(), FetchMode.JOIN)
                .add(Restrictions.in("id", selectedBookIds))
                .list();
    }

    @Override
    public Book get(Long bookId) {
        return (Book) this.sessionFactory.getCurrentSession().get(Book.class, bookId);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.entities.Bookspackage;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class BookspackageDAO implements IBookspackageDAO {
   
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean update(Bookspackage bookspackage) {
        boolean updated = false;
        this.sessionFactory.getCurrentSession().saveOrUpdate(bookspackage);
        updated = true;

        return updated;
    }

    @Override
    public Bookspackage get(Long id) {
        return (Bookspackage) this.sessionFactory.getCurrentSession().get(Bookspackage.class, id);
    }

    @Override
    public boolean delete(Bookspackage bookspackage) {
        boolean result = false;
        this.sessionFactory.getCurrentSession().delete(bookspackage);
        result = true;
        return result;
    }

    @Override
    public List getAllByQuery(String queryString, Map<String, Object> queryParameters, Class resultClass) {
        Query query = createQuery(queryString, queryParameters, resultClass);

        return query.list();

    }

    @Override
    public Object getByQuery(String queryString, Map<String, Object> queryParameters, Class resultClass) {
        Query query = createQuery(queryString, queryParameters, resultClass);

        return query.uniqueResult();
    }

    private Query createQuery(String queryString, Map<String, Object> queryParameters, Class resultClass) {
        Query query = this.sessionFactory.getCurrentSession().createQuery(queryString);

        // set query parameters
        if (queryParameters != null) {
            for (Map.Entry<String, Object> entrySet : queryParameters.entrySet()) {
                String key = entrySet.getKey();
                Object value = entrySet.getValue();
                query.setParameter(key, value);
            }
        }

        if (resultClass != null) {
            query.setResultTransformer(Transformers.aliasToBean(resultClass));
        }

        return query;
    }

    @Override
    public List getAllByDetachedCriteria(DetachedCriteria criteria) {
        List results = criteria.getExecutableCriteria(this.sessionFactory.getCurrentSession()).list();
        return results;
    }

    @Override
    public Object getByDetachedCriteria(DetachedCriteria criteria) {
        Object result = criteria.getExecutableCriteria(this.sessionFactory.getCurrentSession()).uniqueResult();
        return result;
    }
}

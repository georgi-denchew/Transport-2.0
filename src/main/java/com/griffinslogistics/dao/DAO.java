/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class DAO implements IDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean update(Object object) {
        boolean updated = false;
        this.sessionFactory.getCurrentSession().saveOrUpdate(object);
        updated = true;

        return updated;
    }

    @Override
    public Object get(Class aClass, Long id) {
        return this.sessionFactory.getCurrentSession().get(aClass, id);
    }

    @Override
    public boolean delete(Object object) {
        boolean result = false;
        this.sessionFactory.getCurrentSession().delete(object);
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

    @Override
    public List getRevisions(Class aClass, Long id) {
        AuditReader auditReader = AuditReaderFactory.get(this.sessionFactory.getCurrentSession());
        AuditQuery query = auditReader.createQuery()
                .forRevisionsOfEntity(aClass, false, true)
                .add(AuditEntity.property("id").eq(id))
                .addOrder(AuditEntity.revisionNumber().desc());
        List result = query.getResultList();

        return result;
    }
    
    @Override
    public List getAll(Class aClass) {
        return this.sessionFactory.getCurrentSession().createCriteria(aClass).list();
    }

}

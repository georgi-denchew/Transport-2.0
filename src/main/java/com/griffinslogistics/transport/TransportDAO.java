/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.transport;

import com.griffinslogistics.entities.Transport;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class TransportDAO implements ITransportDAO {

    private final Log logger = LogFactory.getLog(TransportDAO.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Transport> getAll() {
        List<Transport> transportations = null;

        try {
            transportations = (List<Transport>) sessionFactory.getCurrentSession().createCriteria(Transport.class).list();

        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return transportations;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean save(Transport transport) {
        boolean result = false;

        Long id = (Long) sessionFactory.getCurrentSession().save(transport);

        if (id > 0) {
            result = true;
        }

        return result;
    }

    @Override
    public Transport getByCriteria(DetachedCriteria criteria) {
        Transport result = (Transport) criteria.getExecutableCriteria(
                this.sessionFactory.getCurrentSession()).uniqueResult();

        return result;
    }

    @Override
    public Transport get(Long transportId) {
        Transport result = (Transport) this.sessionFactory.getCurrentSession().get(Transport.class, transportId);
        return result;
    }

    @Override
    public Transport get(DetachedCriteria criteria) {
        return (Transport) criteria.getExecutableCriteria(this.sessionFactory.getCurrentSession()).uniqueResult();
    }
}

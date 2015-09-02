/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.pulsiodetails;

import com.griffinslogistics.entities.Pulsiodetails;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class PulsioDetailsDAO implements IPulsioDetailsDAO {

    @Autowired
    private SessionFactory sessionFactory;
    
    private static final Logger logger = Logger.getLogger(PulsioDetailsDAO.class.getName());
    private static final String CLASS_NAME = PulsioDetailsDAO.class.getSimpleName();
    
    @Override
     public boolean validatePassword(String password) {
        logger.log(Level.SEVERE, "{0}: validatePassword started", CLASS_NAME);

        boolean result = false;

        try {
            Query query = this.sessionFactory.getCurrentSession().createQuery("select password from Pulsiodetails where password like :password");
            query.setParameter("password", password);
            String passwordResult = (String) query.uniqueResult();
            if (passwordResult != null && passwordResult.equals(password)) {
                result = true;
            }

        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: validatePassword finished", CLASS_NAME);
        }

        return result;
    }

     @Override
    public Pulsiodetails getDetails() {
        logger.log(Level.SEVERE, "{0}: getDetails started", CLASS_NAME);

        Pulsiodetails pulsiodetails = null;

        try {
            Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(Pulsiodetails.class);
            List list = criteria.list();
            pulsiodetails = (Pulsiodetails) list.get(0);
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getDetails finished", CLASS_NAME);
        }

        return pulsiodetails;
    }
    
}

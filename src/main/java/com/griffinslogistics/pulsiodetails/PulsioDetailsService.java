/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.pulsiodetails;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Pulsiodetails;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class PulsioDetailsService implements IPulsioDetailsService {

    private static final Logger logger = Logger.getLogger(PulsioDetailsService.class.getName());
    private static final String CLASS_NAME = PulsioDetailsService.class.getSimpleName();

    private static final String PASSWORD_QUERY = "select password from Pulsiodetails where password like :password";
    @Autowired
    IDAO pulsioDetailsDAO;

    @Override
    public boolean validatePassword(String password) {

        logger.log(Level.SEVERE, "{0}: validatePassword started", CLASS_NAME);

        boolean result = false;

        try {
            Map<String, Object> queryParameters = new HashMap<String, Object>();
            queryParameters.put("password", password);

            String passwordResult = (String) pulsioDetailsDAO.getByQuery(PASSWORD_QUERY, queryParameters, null);
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
            DetachedCriteria criteria = DetachedCriteria.forClass(Pulsiodetails.class);
            pulsiodetails = (Pulsiodetails) this.pulsioDetailsDAO.getByDetachedCriteria(criteria);
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {

            logger.log(Level.SEVERE, "{0}: getDetails finished", CLASS_NAME);
        }

        return pulsiodetails;
    }
}

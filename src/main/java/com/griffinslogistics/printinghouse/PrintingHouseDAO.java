/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.printinghouse;

import com.griffinslogistics.entities.PrintingHouse;
import com.griffinslogistics.exceptions.ExistingEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
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
public class PrintingHouseDAO implements IPrintingHouseDAO {

    private static final Logger logger = Logger.getLogger(PrintingHouseDAO.class.getName());
    private static final String CLASS_NAME = PrintingHouseDAO.class.getSimpleName();

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<PrintingHouse> getAll() {
        return this.sessionFactory.getCurrentSession().createCriteria(PrintingHouse.class).list();
    }

    @Override
    public boolean add(PrintingHouse printingHouse) throws ExistingEntityException {
        logger.log(Level.SEVERE, "{0}: addPrintingHouse started", CLASS_NAME);

        boolean added = false;

        try {
            Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(PrintingHouse.class);
            criteria.add(Restrictions.eq("name", printingHouse.getName()).ignoreCase());
            int foundCount = criteria.list().size();
            if (foundCount > 0) {
                throw new ExistingEntityException("Вече съществува печатница с това име.");
            }
            this.sessionFactory.getCurrentSession().saveOrUpdate(printingHouse);
            added = true;
        } catch (HibernateException e) {
            logger.log(Level.SEVERE, e.getMessage());
        } finally {
            logger.log(Level.SEVERE, "{0}: addPrintingHouse finished", CLASS_NAME);
        }

        return added;
    }

}

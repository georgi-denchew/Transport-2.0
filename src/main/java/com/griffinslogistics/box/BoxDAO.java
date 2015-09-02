/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.box;

import com.griffinslogistics.entities.Box;
import java.util.logging.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class BoxDAO implements IBoxDAO{

    private static final Logger logger = Logger.getLogger(BoxDAO.class.getName());
    private static final String CLASS_NAME = BoxDAO.class.getSimpleName();
    
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public boolean updateBox(Box box) {
       boolean result = false;
       this.sessionFactory.getCurrentSession().saveOrUpdate(box);
       result = true;
       return result;
    }

    @Override
    public boolean deleteBox(Box box) {
         boolean result = false;
       this.sessionFactory.getCurrentSession().delete(box);
       result = true;
       return result;
    }
    
}

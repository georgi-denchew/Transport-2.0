/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.truckgroup;

import com.griffinslogistics.entities.TruckGroup;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xworks.admin
 */
@Repository
public class TruckGroupDAO implements ITruckGroupDAO {

    private final Log logger = LogFactory.getLog(TruckGroupDAO.class);

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<TruckGroup> getAllTruckGroups() {
        List<TruckGroup> resultList = null;
        
        Criteria criteria = this.sessionFactory.getCurrentSession().createCriteria(TruckGroup.class);
        resultList = criteria.list();
        
        return resultList;
    }

}

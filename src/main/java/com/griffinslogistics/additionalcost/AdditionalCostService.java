/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.additionalcost;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.AdditionalCost;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.transport.ITransportService;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class AdditionalCostService implements IAdditionalCostService {

    @Autowired
    IDAO dao;
    
    @Autowired
    ITransportService transportService;
    
    
    @Override
    public boolean updateAdditionalCost(AdditionalCost additionalCost) {
        return this.dao.update(additionalCost);
    }

    @Override
    public List<AdditionalCost> getAdditionalCostsByTransportId(Long id) {
        Transport transport = transportService.get(id);
        Hibernate.initialize(transport.getAdditionalCosts());
        return  transport.getAdditionalCosts();
    }
    
}

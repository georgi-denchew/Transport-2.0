/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.additionalcost;

import com.griffinslogistics.entities.AdditionalCost;
import java.util.List;

/**
 *
 * @author xworks.admin
 */
public interface IAdditionalCostService {
    
    boolean updateAdditionalCost(AdditionalCost additionalCost);
    
    List<AdditionalCost> getAdditionalCostsByTransportId(Long id);
}

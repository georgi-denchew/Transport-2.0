/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.truckgroup;

import com.griffinslogistics.entities.TruckGroup;
import java.util.List;
import java.util.Map;

/**
 *
 * @author xworks.admin
 */
public interface ITruckGroupService {
    public List<TruckGroup> getAllTruckGroups();
    
    Map<String, TruckGroupTotalsModel> getTruckGroupTotalsForTransport(Long transportId);
}

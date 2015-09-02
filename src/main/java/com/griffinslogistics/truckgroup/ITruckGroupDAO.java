/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.truckgroup;

import com.griffinslogistics.entities.TruckGroup;
import java.util.List;

/**
 *
 * @author xworks.admin
 */
public interface ITruckGroupDAO {
     public List<TruckGroup> getAllTruckGroups();
}

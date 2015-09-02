/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.transport;

import com.griffinslogistics.entities.Transport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author xworks.admin
 */
public interface ITransportService {
    boolean addTransport(Transport transport);
    
    public Transport get(Long id);
    
    public List<Transport> getAll();
    
     Map<String, Double> totalWeightsForTransport(Long transportId);
}

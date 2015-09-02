/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.transport;

import com.griffinslogistics.entities.Transport;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;

/**
 *
 * @author xworks.admin
 */
public interface ITransportDAO {
    public List<Transport> getAll();
    
    public boolean save(Transport transport);
    
    public Transport getByCriteria(DetachedCriteria criteria);
    
    public Transport get(Long transportId);
    
    public Transport get(DetachedCriteria criteria);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.dao;

import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;

/**
 *
 * @author xworks.admin
 */
public interface IDAO {

    boolean update(Object object);

    public Object get(Class aClass, Long id);

    public boolean delete(Object object);

    public List getAllByQuery(String queryString,
            Map<String, Object> queryParameters,
            Class resultClass);

    public Object getByQuery(String queryString,
            Map<String, Object> queryParameters,
            Class resultClass);

    public List getAllByDetachedCriteria(DetachedCriteria criteria);

    public Object getByDetachedCriteria(DetachedCriteria criteria);
    
    public List getRevisions(Class aClass, Long id);

    public List getAll(Class aClass);
}

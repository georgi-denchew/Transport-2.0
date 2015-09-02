/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.entities.Bookspackage;
import java.util.List;
import java.util.Map;
import org.hibernate.criterion.DetachedCriteria;

/**
 *
 * @author xworks.admin
 */
public interface IBookspackageDAO {
    
    boolean update (Bookspackage bookspackage);

    public Bookspackage get(Long id);

    public boolean delete(Bookspackage bookspackage);

    public List getAllByQuery(String queryString,
            Map<String, Object> queryParameters,
            Class resultClass);
    
    public Object getByQuery(String queryString,
            Map<String, Object> queryParameters,
            Class resultClass);
    
    public List getAllByDetachedCriteria(DetachedCriteria criteria);
    
    public Object getByDetachedCriteria(DetachedCriteria criteria);
}

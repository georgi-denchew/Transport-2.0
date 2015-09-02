/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.box;

import com.griffinslogistics.entities.Box;

/**
 *
 * @author xworks.admin
 */
public interface IBoxDAO {

    public boolean updateBox(Box box);

    public boolean deleteBox(Box box);
    
}

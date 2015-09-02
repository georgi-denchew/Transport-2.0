/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.box;

import com.griffinslogistics.entities.Box;
import java.util.List;

/**
 *
 * @author xworks.admin
 */

public interface IBoxService {
    List<Box> getBoxesByBookId(Long bookId);
    
    boolean updateBox(Box box);
    
    boolean deleteBox(Box box);
}

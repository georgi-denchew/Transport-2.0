/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.printinghouse;

import com.griffinslogistics.entities.PrintingHouse;
import com.griffinslogistics.exceptions.ExistingEntityException;
import java.util.List;

/**
 *
 * @author xworks.admin
 */
public interface IPrintingHouseDAO {
    List<PrintingHouse> getAll();
    
    boolean add(PrintingHouse printingHouse) throws ExistingEntityException;
}

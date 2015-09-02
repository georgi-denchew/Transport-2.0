/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.printinghouse;

import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.PrintingHouse;
import com.griffinslogistics.exceptions.ExistingEntityException;
import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class PrintingHouseService implements IPrintingHouseService{
    
    @Autowired
    IDAO printingHouseDAO;

    @Override
    public List<PrintingHouse> getAll() {
        List<PrintingHouse> result = printingHouseDAO.getAll(PrintingHouse.class);
        Collections.reverse(result);
        return result;
    }

    @Override
    public boolean update(PrintingHouse printingHouse) throws ExistingEntityException {
        return printingHouseDAO.update(printingHouse);
    }
}

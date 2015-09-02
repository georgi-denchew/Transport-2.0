/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.box;

import com.griffinslogistics.book.IBookService;
import com.griffinslogistics.dao.IDAO;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Box;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xworks.admin
 */
@Service
@Transactional
public class BoxService implements IBoxService {

    @Autowired
    IDAO boxDAO;
    
    @Autowired 
    IBookService bookService;

    @Override
    public List<Box> getBoxesByBookId(Long bookId) {
        Book book = bookService.get(bookId);
        Hibernate.initialize(book.getBoxes());
        return new ArrayList<Box>(book.getBoxes());
    }

    @Override
    public boolean updateBox(Box box) {
       return boxDAO.update(box);
    }

    @Override
    public boolean deleteBox(Box box) {
       return boxDAO.delete(box);
    }
    
}

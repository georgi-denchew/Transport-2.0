/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.entities.Book;
import java.util.List;
import java.util.Map;

/**
 *
 * @author xworks.admin
 */
public interface IBookDAO {

    public List<BookExtendedModel> getAllBookExtendedModelsByTransportId(Long transportId);

    public List<BookBoxModel> getAllBookBoxModelsByBookspackageId(Long bookspackageId);

    public Map<String, List<BookBoxModel>> getAllBookBoxModelsByTransportId(Long transportId);

    public List<BookModel> getBookModelsByTransportId(Long transportId);

    public boolean update(Book book);

    public Integer getBiggestBookNumberForTransportId(Long transportId);

    public boolean delete(Book book);

    public List<Book> getAllById(List<Long> selectedBookIds);

    public Book get(Long bookId);
    
}

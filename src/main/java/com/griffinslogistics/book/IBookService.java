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
public interface IBookService {

    List<Book> getBooksByBookspackageId(Long bookspackageId);

    List<BookExtendedModel> getAllBookExtendedModelsByTransportId(Long transportId);

    List<BookBoxModel> getAllBookBoxModelsByBookspackageId(Long bookspackageId);

    Map<String, List<BookBoxModel>> getAllBookBoxModelsByTransportId(Long transportId);

    List<BookModel> getBookModelsByTransportId(Long transportId);

    Book get(Long id);
    
    boolean updateBook(Book book);

    Integer getBiggestBookNumberForTransportId(Long transportId);

    boolean deleteBook(Book book);

    List<BookLabelModel> getLabelInfoForBooks(List<Long> selectedBookIds);
    
    List<BookLabelModel> getLabelInfoForTransportId(Long transportId);
    
    BookLabelModel getLabelInfoForBookId(Long bookId);
    
    List<BookForTransportationModel> getBooksForTransportModelByTransportId(Long transportId);
    
    List<Book> getBooksByTransportId(Long transportId);
    
    boolean updateBookDiscardedField(Long id, boolean discarded);
}

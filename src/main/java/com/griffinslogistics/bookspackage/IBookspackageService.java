/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.entities.Bookspackage;
import java.util.List;

/**
 *
 * @author xworks.admin
 */
public interface IBookspackageService {
    
    List<Bookspackage> getBookspackagesByTransportId(Long transportId);
    
    String getBiggestBookspackageNumberForTransport(Long transportId);
    
    String generateUniqueBookspackageNumber (String biggestNumber, int year, int week);
    
    boolean updateBookspackage(Bookspackage bookspackage);

    public Bookspackage get(Long id);    
    
    boolean addBookspackage(Bookspackage bookspackage);
    
    boolean deleteBookspackage(Bookspackage bookspackage);
    
    List<BookspackageCMRModel> totalBookspackageCMRModelsByTransportId(Long transportId);
    
    BookspackageCMRModel bookspackageCMRModelById(Long bookspackageId);

    public List<Bookspackage> getBookpackagesHistory(Long id);
}

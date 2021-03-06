/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Box;
import java.util.Date;


/**
 *
 * @author Georgi
 */
public class BookForTransportationModel implements java.io.Serializable {

    private Long id;
    private String bookspackageNumber;
    private String printingHouseName;
    private int bookNumber;
    private String title;
    private int count;
    private double weight;
    private double weightPerBook;
    private boolean discarded;
    private String deliveryAddress;
    private String client;
    private String merchant;
    private Date deliveryDate;
    private int boxesCount;
    private String ISBN;

    public BookForTransportationModel(Long id, String bookspackageNumber, String printingHouseName,
            int bookNumber, String title, int count, double weight, double weightPerBook, boolean discarded,
            String deliveryAddress, String client, String merchant, Date deliveryDate, int boxesCount, String ISBN) {
        this.id = id;
        this.bookspackageNumber = bookspackageNumber;
        this.printingHouseName = printingHouseName;
        this.bookNumber = bookNumber;
        this.title = title;
        this.count = count;
        this.weight = weight;
        this.weightPerBook = weightPerBook;
        this.discarded = discarded;
        this.deliveryAddress = deliveryAddress;
        this.client = client;
        this.merchant = merchant;
        this.deliveryDate = deliveryDate;
        this.boxesCount = boxesCount;
        this.ISBN = ISBN;
    }

    public static BookForTransportationModel fromBook(Book book) {
        
        int boxesCount = 0;
        
        for (Box box : book.getBoxes()){
            boxesCount += box.getBoxesCount();
        }
        
        BookForTransportationModel bookForTransportationModel
                = new BookForTransportationModel(book.getId(), book.getBookspackage().getPackageNumber(),
                        book.getPrintingHouse() != null ? book.getPrintingHouse().getName() : null,
                        book.getBookNumber(), book.getTitle(), book.getCount(), book.getWeight(),
                        book.getWeightPerBook(), book.isDiscarded(), book.getDeliveryAddress(),
                        book.getBookspackage().getClient(), book.getBookspackage().getMerchant(), 
                        book.getBookspackage().getDeliveryDate(), boxesCount, book.getISBN());

        return bookForTransportationModel;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBookspackageNumber() {
        return bookspackageNumber;
    }

    public void setBookspackageNumber(String bookspackageNumber) {
        this.bookspackageNumber = bookspackageNumber;
    }

    public String getPrintingHouseName() {
        return printingHouseName;
    }

    public void setPrintingHouse(String printingHouseName) {
        this.printingHouseName = printingHouseName;
    }

    public int getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(int bookNumber) {
        this.bookNumber = bookNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getWeightPerBook() {
        return weightPerBook;
    }

    public void setWeightPerBook(double weightPerBook) {
        this.weightPerBook = weightPerBook;
    }

    public boolean isDiscarded() {
        return discarded;
    }

    public void setDiscarded(boolean discarded) {
        this.discarded = discarded;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public int getBoxesCount() {
        return boxesCount;
    }

    public void setBoxesCount(int boxesCount) {
        this.boxesCount = boxesCount;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
}

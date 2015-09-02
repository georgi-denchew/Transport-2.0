/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.griffinslogistics.book;

import java.io.Serializable;

/**
 *
 * @author Georgi
 */
public class BookModel implements Serializable{
    private int bookNumber;
    private String title;
    
    public BookModel(){
    }

    public BookModel(int bookNumber, String title) {
        this.bookNumber = bookNumber;
        this.title = title;
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
}

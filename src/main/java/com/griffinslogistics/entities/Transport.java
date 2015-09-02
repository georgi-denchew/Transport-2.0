/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author xworks.admin
 */
@Entity
@Table(name = "transport")
public class Transport implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private int weekNumber;
    
    @Column(name = "Year")
    private int year;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "transport")
    @OrderBy
    private Set<Bookspackage> bookspackages;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "transport")
    @OrderBy
    private Set<Book> books;
    
    @OneToMany(mappedBy = "transport")
    private List<AdditionalCost> additionalCosts;

    @Temporal(TemporalType.DATE)
    private Date startDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getWeekNumber() {
        return weekNumber;
    }

    public void setWeekNumber(int weekNumber) {
        this.weekNumber = weekNumber;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Set<Bookspackage> getBookspackages() {
        return bookspackages;
    }

    public void setBookspackages(Set<Bookspackage> bookspackages) {
        this.bookspackages = bookspackages;
    }

    public List<AdditionalCost> getAdditionalCosts() {
        return additionalCosts;
    }

    public void setAdditionalCosts(List<AdditionalCost> additionalCosts) {
        this.additionalCosts = additionalCosts;
    }

    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }
}

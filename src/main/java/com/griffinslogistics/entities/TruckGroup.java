/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Georgi
 */
@Entity
@Table(name = "truckgroup")
public class TruckGroup implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String name;

    @OneToMany(mappedBy = "truckGroup")
    private List<Bookspackage> bookspackages = new ArrayList<Bookspackage>();

    public TruckGroup() {
    }

    public TruckGroup(Long Id, String name, List bookspackages) {
        this.Id = Id;
        this.name = name;
        this.bookspackages = bookspackages;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Bookspackage> getBookspackages() {
        return bookspackages;
    }

    public void setBookspackages(List<Bookspackage> bookspackages) {
        this.bookspackages = bookspackages;
    }

    @Override
    public boolean equals(Object obj) {

        if (obj instanceof TruckGroup) {
            return this.getId().equals(((TruckGroup) obj).getId());

        }
        return false;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + (this.Id != null ? this.Id.hashCode() : 0);
        return hash;
    }

}

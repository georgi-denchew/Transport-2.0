/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 *
 * @author Georgi
 */
@Entity
@Table(name = "pulsiodetails")
public class Pulsiodetails implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String contact1;
    private String contact2;
    private String password;

    @Lob
    @Column(name = "Logo", nullable = false, columnDefinition = "blob")
    private byte[] logo;

    @Lob
    @Column(name = "Signature", nullable = false, columnDefinition = "blob")
    private byte[] signature;

    public Pulsiodetails() {
    }

    public Pulsiodetails(Long id, String contact1, String contact2, String password, byte[] logo, byte[] signature) {
        this.id = id;
        this.contact1 = contact1;
        this.contact2 = contact2;
        this.password = password;
        this.logo = logo;
        this.signature = signature;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContact1() {
        return contact1;
    }

    public void setContact1(String contact1) {
        this.contact1 = contact1;
    }

    public String getContact2() {
        return contact2;
    }

    public void setContact2(String contact2) {
        this.contact2 = contact2;
    }

    public byte[] getLogo() {
        return logo;
    }

    public void setLogo(byte[] logo) {
        this.logo = logo;
    }

    public byte[] getSignature() {
        return signature;
    }

    public void setSignature(byte[] signature) {
        this.signature = signature;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Box;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.entities.TruckGroup;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

/**
 *
 * @author xworks.admin
 */
public class BookspackageModel {
    
    private Long id;

    private Integer version;

    private Transport transport;
    private Long transportId;

    private TruckGroup truckGroup;
    private Long truckGroupId;
    
    private String country;
    private String postalCode;
    private String phoneNumber;
    private String email;
    private String packageNumber;
    private String merchant;
    private String client;
    private BigDecimal pricePerKilogram;
    private String priority;

    private Date deliveryDate;
    private String deliveryAddress;
    private String remarksSales;
    private String remarksLogistics;
    private String printDeliveryDay;
    private String loadingDay;

    private String state;

    private Set<Book> books;

    private Set<Box> boxes;

    private Integer totalBooksCount;
    private Integer totalOrderedBooksCount;
    private Double totalBooksWeight;
    private Double totalOrderedBooksWeight;

    private String displayPriority;
    private String displayState;
    private boolean hasDiscardedBooks;
    
    
    public BookspackageModel() {
    }

    public BookspackageModel(Transport transport, String packageNumber) {
        this.transport = transport;
        this.packageNumber = packageNumber;
    }

    public BookspackageModel(Long id, Integer version, Transport transport, TruckGroup truckGroup,
            String country, String postalCode, String phoneNumber, String email,
            String packageNumber, String merchant, String client, Date deliveryDate,
            String deliveryAddress, String remarks, String printDeliveryDay, Integer totalBooksCount, Integer totalOrderedBooksCount,
            Double totalBooksWeight, Double totalOrderedBooksWeight, String priority, String loadingDay, String state) {
        this.id = id;
        this.version = version;
        this.transport = transport;
        this.truckGroup = truckGroup;
        this.country = country;
        this.postalCode = postalCode;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.packageNumber = packageNumber;
        this.merchant = merchant;
        this.client = client;
        this.deliveryDate = deliveryDate;
        this.deliveryAddress = deliveryAddress;
        this.remarksSales = remarks;
        this.printDeliveryDay = printDeliveryDay;
        this.totalBooksCount = totalBooksCount;
        this.totalOrderedBooksCount = totalOrderedBooksCount;
        this.totalBooksWeight = totalBooksWeight;
        this.totalOrderedBooksWeight = totalOrderedBooksWeight;
        this.priority = priority;
        this.loadingDay = loadingDay;
        this.state = state;
    }

    public BookspackageModel(Transport transport, String packageNumber, String merchant,
            String client, Date deliveryDate, String deliveryAddress, String remarks, String printDeliveryDay,
            Set<Book> books, Set<Box> boxes) {
        this.transport = transport;
        this.packageNumber = packageNumber;
        this.merchant = merchant;
        this.client = client;
        this.deliveryDate = deliveryDate;
        this.deliveryAddress = deliveryAddress;
        this.remarksSales = remarks;
        this.printDeliveryDay = printDeliveryDay;
        this.books = books;
        this.boxes = boxes;
    }

//    public Bookspackage makeDeepCopy() {
//        Bookspackage bookspackage = new Bookspackage();
//
//        bookspackage.setClient(this.getClient());
//        bookspackage.setCountry(this.getCountry());
//        bookspackage.setDeliveryAddress(this.getDeliveryAddress());
//        bookspackage.setDeliveryDate(this.getDeliveryDate());
//        bookspackage.setEmail(this.getEmail());
//        bookspackage.setMerchant(this.getMerchant());
//        bookspackage.setPhoneNumber(this.getPhoneNumber());
//        bookspackage.setPostalCode(this.getPostalCode());
//        bookspackage.setPrintDeliveryDay(this.getPrintDeliveryDay());
//        bookspackage.setRemarksSales(this.getRemarksSales());
//        bookspackage.setRemarksLogistics(this.getRemarksLogistics());
//        bookspackage.setPriority(this.getPriority());
//
//        return bookspackage;
//    }

//    public boolean haveEqualProperties(Bookspackage bookspackage) {
//        boolean haveEqualProperties = true;
//
//        haveEqualProperties = haveEqualProperties && this.getClient().equals(bookspackage.getClient());
//        haveEqualProperties = haveEqualProperties && this.getCountry().equals(bookspackage.getCountry());
//        haveEqualProperties = haveEqualProperties && this.getDeliveryAddress().equals(bookspackage.getDeliveryAddress());
//        haveEqualProperties = haveEqualProperties && this.getEmail().equals(bookspackage.getEmail());
//        haveEqualProperties = haveEqualProperties && this.getMerchant().equals(bookspackage.getMerchant());
//        haveEqualProperties = haveEqualProperties && this.getPhoneNumber().equals(bookspackage.getPhoneNumber());
//        haveEqualProperties = haveEqualProperties && this.getPostalCode().equals(bookspackage.getPostalCode());
//        haveEqualProperties = haveEqualProperties && this.getRemarksSales().equals(bookspackage.getRemarksSales());
//        haveEqualProperties = haveEqualProperties && this.getRemarksLogistics().equals(bookspackage.getRemarksLogistics());
//        haveEqualProperties = haveEqualProperties && this.getPrintDeliveryDay().equals(bookspackage.getPrintDeliveryDay());
//
//        TruckGroup existingTruckGroup = this.getTruckGroup();
//        TruckGroup bookspackageTruckGroup = bookspackage.getTruckGroup();
//
//        if (existingTruckGroup != null && bookspackageTruckGroup != null) {
//            haveEqualProperties = haveEqualProperties && existingTruckGroup.getId().equals(bookspackageTruckGroup.getId());
//        } else if (existingTruckGroup == null && bookspackageTruckGroup == null) {
//            haveEqualProperties = haveEqualProperties && true;
//        } else {
//            haveEqualProperties = false;
//        }
//
//        Date existingDeliveryDate = this.getDeliveryDate();
//        Date bookspackageDeliveryDate = bookspackage.getDeliveryDate();
//
//        if (existingDeliveryDate != null && bookspackageDeliveryDate != null) {
//            haveEqualProperties = haveEqualProperties && existingDeliveryDate.equals(bookspackageDeliveryDate);
//        } else if (existingDeliveryDate == null && bookspackageDeliveryDate == null) {
//            haveEqualProperties = haveEqualProperties && true;
//        } else {
//            haveEqualProperties = false;
//        }
//
//        return haveEqualProperties;
//    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Transport getTransport() {
        return this.transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public String getPackageNumber() {
        return this.packageNumber;
    }

    public void setPackageNumber(String packageNumber) {
        this.packageNumber = packageNumber;
    }

    public String getMerchant() {
        return this.merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    public String getClient() {
        return this.client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public Date getDeliveryDate() {
        return this.deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getDeliveryAddress() {
        return this.deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getRemarksSales() {
        return this.remarksSales;
    }

    public void setRemarksSales(String remarksSales) {
        this.remarksSales = remarksSales;
    }

    public String getRemarksLogistics() {
        return remarksLogistics;
    }

    public void setRemarksLogistics(String remarksLogistics) {
        this.remarksLogistics = remarksLogistics;
    }

    public Set<Book> getBooks() {
        return this.books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }

    public Set<Box> getBoxes() {
        return this.boxes;
    }

    public void setBoxes(Set<Box> boxes) {
        this.boxes = boxes;
    }

    public Integer getTotalBooksCount() {
        return totalBooksCount;
    }

    public void setTotalBooksCount(Integer totalBooksCount) {
        this.totalBooksCount = totalBooksCount;
    }
    
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TruckGroup getTruckGroup() {
        return truckGroup;
    }

    public void setTruckGroup(TruckGroup truckGroup) {
        this.truckGroup = truckGroup;
    }

    public Integer getTotalOrderedBooksCount() {
        return totalOrderedBooksCount;
    }

    public void setTotalOrderedBooksCount(Integer totalOrderedBooksCount) {
        this.totalOrderedBooksCount = totalOrderedBooksCount;
    }

    public Double getTotalBooksWeight() {
        return totalBooksWeight;
    }

    public void setTotalBooksWeight(Double totalBooksWeight) {
        this.totalBooksWeight = totalBooksWeight;
    }

    public Double getTotalOrderedBooksWeight() {
        return totalOrderedBooksWeight;
    }

    public void setTotalOrderedBooksWeight(Double totalOrderedBooksWeight) {
        this.totalOrderedBooksWeight = totalOrderedBooksWeight;
    }
    public String getPrintDeliveryDay() {
        return printDeliveryDay;
    }

    public void setPrintDeliveryDay(String printDeliveryDay) {
        this.printDeliveryDay = printDeliveryDay;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;

//        BookspackagePriorityEnum priorityEnum = BookspackagePriorityEnum.byValue(this.priority);
//        this.setDisplayPriority(priorityEnum.getDisplayValue());
    }

    public String getDisplayPriority() {
        return displayPriority;
    }

    public void setDisplayPriority(String displayPriority) {
        this.displayPriority = displayPriority;
    }
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;

//        if (state != null) {
//            BookspackageStateEnum stateEnum = BookspackageStateEnum.byValue(this.state);
//            this.setDisplayState(stateEnum.getDisplayValue());
//        }
    }

    public String getDisplayState() {
        return displayState;
    }

    public void setDisplayState(String displayState) {
        this.displayState = displayState;
    }

    public boolean isHasDiscardedBooks() {
        return hasDiscardedBooks;
    }

    public void setHasDiscardedBooks(boolean hasDiscardedBooks) {
        this.hasDiscardedBooks = hasDiscardedBooks;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }

    public BigDecimal getPricePerKilogram() {
        return pricePerKilogram;
    }

    public void setPricePerKilogram(BigDecimal pricePerKilogram) {
        this.pricePerKilogram = pricePerKilogram;
    }

    public String getLoadingDay() {
        return loadingDay;
    }

    public void setLoadingDay(String loadingDay) {
        this.loadingDay = loadingDay;
    }

    public Long getTruckGroupId() {
        return truckGroupId;
    }

    public void setTruckGroupId(Long truckGroupId) {
        this.truckGroupId = truckGroupId;
    }
}

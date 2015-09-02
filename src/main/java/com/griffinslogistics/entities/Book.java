package com.griffinslogistics.entities;
// Generated Jul 28, 2014 10:58:21 PM by Hibernate Tools 3.6.0

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * Book generated by hbm2java
 */
@Entity
@Table(name = "book")
public class Book implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int bookNumber;
    private String title;
    private int count;
    private double weight;
    private double weightPerBook;

    private boolean discarded;
    
    @Column(length = 500)
    private String deliveryAddress;

    @Transient
    private Long totalBooksCount;
    @Transient
    private Double totalBooksWeight;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "book", fetch = FetchType.LAZY)
    @OrderBy("id DESC")
    private Set<Box> boxes;

    @ManyToOne
    @JoinColumn(name = "PackageId")
    private Bookspackage bookspackage;

    @Column(name = "PackageId", updatable = false, insertable = false)
    private Long bookspackageId;

    @Column(name = "TransportId", updatable = false, insertable = false)
    private Long transportId;

    @ManyToOne
    @JoinColumn(name = "TransportId")
    private Transport transport;

    @ManyToOne
    @JoinColumn(name = "PrintingHouseId")
    private PrintingHouse printingHouse;

    @Column(name = "PrintingHouseId", updatable = false, insertable = false)
    private Long printingHouseId;

    public Book() {
    }

    public Book(Bookspackage bookspackage, Transport transport, int bookNumber,
            String title, int count, double weight, Long totalBooksCount, Double totalBooksWeight, boolean discarded) {
        this.bookspackage = bookspackage;
        this.transport = transport;
        this.bookNumber = bookNumber;
        this.title = title;
        this.count = count;
        this.weight = weight;
        this.totalBooksCount = totalBooksCount;
        this.totalBooksWeight = totalBooksWeight;
        this.discarded = discarded;
    }

    public Book(Bookspackage bookspackage, Transport transport, int bookNumber,
            String title, int count, double weight, double weightPerBook,
            Long totalBooksCount, Double totalBooksWeight, Set<Box> boxes, boolean discarded) {
        this.bookspackage = bookspackage;
        this.transport = transport;
        this.bookNumber = bookNumber;
        this.title = title;
        this.count = count;
        this.weight = weight;
        this.boxes = boxes;
        this.weightPerBook = weightPerBook;
        this.totalBooksCount = totalBooksCount;
        this.totalBooksWeight = totalBooksWeight;
        this.discarded = discarded;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Bookspackage getBookspackage() {
        return this.bookspackage;
    }

    public void setBookspackage(Bookspackage bookspackage) {
        this.bookspackage = bookspackage;
    }

    public Transport getTransport() {
        return this.transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public int getBookNumber() {
        return this.bookNumber;
    }

    public void setBookNumber(int bookNumber) {
        this.bookNumber = bookNumber;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getWeight() {
        return this.weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public Set<Box> getBoxes() {
        return this.boxes;
    }

    public void setBoxes(Set<Box> boxes) {
        this.boxes = boxes;
    }

    public double getWeightPerBook() {
        return weightPerBook;
    }

    public void setWeightPerBook(double weightPerBook) {
        this.weightPerBook = weightPerBook;
    }

    public Long getTotalBooksCount() {
        return totalBooksCount;
    }

    public void setTotalBooksCount(Long totalBooksCount) {
        this.totalBooksCount = totalBooksCount;
    }

    public Double getTotalBooksWeight() {
        return totalBooksWeight;
    }

    public void setTotalBooksWeight(Double totalBooksWeight) {
        this.totalBooksWeight = totalBooksWeight;
    }

    public boolean isDiscarded() {
        return discarded;
    }

    public void setDiscarded(boolean discarded) {
        this.discarded = discarded;
    }

    public PrintingHouse getPrintingHouse() {
        return printingHouse;
    }

    public void setPrintingHouse(PrintingHouse printingHouse) {
        this.printingHouse = printingHouse;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public Long getBookspackageId() {
        return bookspackageId;
    }

    public void setBookspackageId(Long bookspackageId) {
        this.bookspackageId = bookspackageId;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }

    public Long getPrintingHouseId() {
        return printingHouseId;
    }

    public void setPrintingHouseId(Long printingHouseId) {
        this.printingHouseId = printingHouseId;
    }

}
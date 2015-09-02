/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.box;

import com.griffinslogistics.book.IBookService;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Box;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.resource.ResourceBundleBean;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author xworks.admin
 */
@ManagedBean
@ViewScoped
public class BoxJSFController implements Serializable {

    @ManagedProperty(value = "#{boxService}")
    private IBoxService boxService;

    @ManagedProperty(value = "#{bookService}")
    private IBookService bookService;
    
    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;


    private Transport transport;
    private Bookspackage bookspackage;
    private Book book;
    private List<Box> boxes;

    private Box newBox = new Box();
    private Box selectedBox;

    @PostConstruct
    public void init() {
        Map requestMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
        String bookIdString = (String) requestMap.get("book-id");

        Long bookId = Long.parseLong(bookIdString);
        
        this.book = bookService.get(bookId);
        this.transport = this.book.getTransport();
        this.bookspackage = this.book.getBookspackage();
        this.boxes = this.boxService.getBoxesByBookId(bookId);
    }

    public String test(Box box) {
        this.selectedBox = box;
        return null;
    }

    public void addBox() {

        newBox.setBook(this.book);
        newBox.setBookspackage(this.book.getBookspackage());

        boolean added = this.boxService.updateBox(newBox);

        FacesMessage message;

        if (added) {
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOX_ADDED), null);
            this.boxes.add(0, newBox);

            this.newBox = new Box();
        } else {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOX_ADD), null);
        }

        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public String deleteBox() {
        String result = null;

        boolean isDeleted = false;
        FacesMessage message = null;

        try {
            isDeleted = this.boxService.deleteBox(this.selectedBox);
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
            FacesContext.getCurrentInstance().addMessage(null, message);
        }

        if (isDeleted) {
            this.boxes.remove(this.selectedBox);
//            this.selectedBox = new Box();
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOX_DELETED), "");
        } else {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOX_DELETE), "");
        }

        FacesContext.getCurrentInstance().addMessage(null, message);

        return result;
    }

    public void onEdit(RowEditEvent event) {
        FacesMessage message = null;

        try {
            Box edited = (Box) event.getObject();

            boolean updated = this.boxService.updateBox(edited);

            if (updated) {
                message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOX_UPDATED), "");
            } else {
                message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOX_UPDATE), "");
            }

        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
        } finally {
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void onCancelEdit(RowEditEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_UPDATE_CANCELED), "");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public IBoxService getBoxService() {
        return boxService;
    }

    public void setBoxService(IBoxService boxService) {
        this.boxService = boxService;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public Bookspackage getBookspackage() {
        return bookspackage;
    }

    public void setBookspackage(Bookspackage bookspackage) {
        this.bookspackage = bookspackage;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public List<Box> getBoxes() {
        return boxes;
    }

    public void setBoxes(List<Box> boxes) {
        this.boxes = boxes;
    }

    public Box getNewBox() {
        return newBox;
    }

    public void setNewBox(Box newBox) {
        this.newBox = newBox;
    }

    public Box getSelectedBox() {
        return selectedBox;
    }

    public void setSelectedBox(Box selectedBox) {
        this.selectedBox = selectedBox;
    }

    public IBookService getBookService() {
        return bookService;
    }

    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }
}

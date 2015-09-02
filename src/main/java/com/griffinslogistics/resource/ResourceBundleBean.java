/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.resource;

import java.util.HashMap;
import javax.faces.context.FacesContext;
import javax.servlet.ServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Component;

/**
 *
 * @author xworks.admin
 */
@Component(value = "message")
public class ResourceBundleBean extends HashMap {

    // Error Messages
    public static final String ERROR_TRANSPORT_EXISTS = "error_transport_exists";

    public static final String ERROR_BOOKSPACKAGE_ADD = "error_bookspackage_add";
    public static final String ERROR_BOOKSPACKAGE_UPDATE = "error_bookspackage_update";
    public static final String ERROR_BOOKSPACKAGE_CONCURRENT_UPDATE = "error_bookspackage_concurrent_update";
    public static final String ERROR_BOOKSPACKAGE_NOT_COPIED = "error_bookspackage_not_copied";
    public static final String ERROR_BOOKSPACKAGE_NOT_DELETED = "error_bookspackage_not_deleted";

    public static final String ERROR_BOOK_ADD = "error_book_add";
    public static final String ERROR_BOOK_DELETE = "error_book_delete";
    public static final String ERROR_BOOK_UPDATE = "error_book_update";
    public static final String ERROR_NO_BOOKS_SELECTED = "error_no_books_selected";
    
    public static final String ERROR_BOX_ADD = "error_box_add";
    public static final String ERROR_BOX_DELETE = "error_box_delete";
    public static final String ERROR_BOX_UPDATE = "error_box_update";

    public static final String ERROR_ADDITIONAL_COST_ADD = "error_additional_cost_add";
    public static final String ERROR_ADDITIONAL_COST_UPDATE = "error_additional_cost_update";
    
    public static final String ERROR_NO_BOXES_EXCEL_GENERATOR = "error_no_boxes_excel_generator";
    public static final String ERROR_NO_BOXES_IN_BOOKSPACKAGE_EXCEL_GENERATOR = "error_no_boxes_in_bookspackage_excel_generator";

    // Success Messages
    public static final String SUCCESS_UPDATE_CANCELED = "success_update_canceled";
    public static final String SUCCESS_TRANSPORT_ADDED = "success_transport_added";

    public static final String SUCCESS_BOOKSPACKAGE_ADDED = "success_bookspackage_added";
    public static final String SUCCESS_BOOKSPACKAGE_UPDATED = "success_bookspackage_updated";
    public static final String SUCCESS_BOOKSPACKAGE_COPIED = "success_bookspackage_copied";
    public static final String SUCCESS_BOOKSPACKAGE_PASTED = "success_bookspackage_pasted";
    public static final String SUCCESS_BOOKSPACKAGE_DELETED = "success_bookspackage_deleted";

    public static final String SUCCESS_BOOK_ADDED = "success_book_added";
    public static final String SUCCESS_BOOK_DELETED = "success_book_deleted";
    public static final String SUCCESS_BOOK_UPDATED = "success_book_updated";
    public static final String SUCCESS_BOOK_DISCARDED = "success_book_discarded";
    public static final String SUCCESS_BOOK_RETURNED = "success_book_returned";
    
    public static final String SUCCESS_BOX_ADDED = "success_box_added";
    public static final String SUCCESS_BOX_DELETED = "success_box_deleted";
    public static final String SUCCESS_BOX_UPDATED = "success_box_updated";

    public static final String SUCCESS_PRINTING_HOUSE_ADDED = "success_printing_house_added";
    public static final String SUCCESS_PRINTING_HOUSE_UPDATED = "success_printing_house_updated";
    
    public static final String SUCCESS_ADDITIONAL_COST_ADDED = "success_additional_cost_added";
    public static final String SUCCESS_ADDITIONAL_COST_UPDATED = "success_additional_cost_updated";
    
    
    
    @Autowired
    private MessageSource messageSource;

    @Override
    public String get(Object key) {
        ServletRequest request = (ServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String message;
        try {
            message = messageSource.getMessage((String) key, null, request.getLocale());
        } catch (NoSuchMessageException e) {
            message = "Invalid message key: " + key;
        }
        return message;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.converters;

import com.griffinslogistics.bookspackage.BookspackageJSFController;
import com.griffinslogistics.entities.TruckGroup;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;

/**
 *
 * @author Georgi
 */
@ManagedBean
@RequestScoped
public class TruckGroupConverter implements Converter {

    @ManagedProperty(value = "#{bookspackageJSFController}")
    BookspackageJSFController bookspackageJSFController;

    public Object getAsObject(FacesContext facesContext, UIComponent component, String submittedValue) {
        if (submittedValue.trim().equals("")) {
            return null;
        } else {
            try {
                int number = Integer.parseInt(submittedValue);

                for (TruckGroup truckGroup : bookspackageJSFController.getAllTruckGroups()) {
                    if (truckGroup.getId() == number) {
                        return truckGroup;
                    }
                }

            } catch (NumberFormatException exception) {
                throw new ConverterException(new FacesMessage(FacesMessage.SEVERITY_ERROR, "Conversion Error", "Невалидна група!"));
            }
        }

        return null;
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object value) {
        if (value == null || value.equals("")) {
            return "";
        } else {
            long id = ((TruckGroup) value).getId();
            return String.valueOf(id);
        }
    }

    public BookspackageJSFController getBookspackageJSFController() {
        return bookspackageJSFController;
    }

    public void setBookspackageJSFController(BookspackageJSFController bookspackageController) {
        this.bookspackageJSFController = bookspackageController;
    }
}

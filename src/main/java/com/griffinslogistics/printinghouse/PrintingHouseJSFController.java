/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.printinghouse;

import com.griffinslogistics.entities.PrintingHouse;
import com.griffinslogistics.resource.ResourceBundleBean;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Logger;
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
public class PrintingHouseJSFController implements Serializable {

    private static final Logger logger = Logger.getLogger(PrintingHouseJSFController.class.getName());

    @ManagedProperty(value = "#{printingHouseService}")
    private IPrintingHouseService printingHouseService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private List<PrintingHouse> printingHouses;
    private PrintingHouse newPrintingHouse;

    @PostConstruct
    public void init() {
        this.newPrintingHouse = new PrintingHouse();
        this.printingHouses = this.printingHouseService.getAll();
    }

    public void addPrintingHouse() {
        FacesMessage message = null;
        try {
            this.newPrintingHouse.setName(this.newPrintingHouse.getName().trim());
            boolean added
                    = this.printingHouseService.update(newPrintingHouse);

            if (added) {
                this.printingHouses.add(0, this.newPrintingHouse);
                this.newPrintingHouse = new PrintingHouse();
                String messageString = ResourceBundleBean.SUCCESS_PRINTING_HOUSE_ADDED;
                message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(messageString), null);
            }
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
        } finally {
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void onEdit(RowEditEvent event) {
        FacesMessage message = null;
        PrintingHouse toEdit = (PrintingHouse) event.getObject();
        try {
            String messageString = ResourceBundleBean.SUCCESS_PRINTING_HOUSE_UPDATED;
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(messageString), null);
            this.printingHouseService.update(toEdit);
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
        } finally {
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void onCancelEdit(RowEditEvent event) {
        String messageString =  ResourceBundleBean.SUCCESS_UPDATE_CANCELED;
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public List<PrintingHouse> getPrintingHouses() {
        return printingHouses;
    }

    public void setPrintingHouses(List<PrintingHouse> printingHouses) {
        this.printingHouses = printingHouses;
    }

    public PrintingHouse getNewPrintingHouse() {
        return newPrintingHouse;
    }

    public void setNewPrintingHouse(PrintingHouse newPrintingHouse) {
        this.newPrintingHouse = newPrintingHouse;
    }

    public IPrintingHouseService getPrintingHouseService() {
        return printingHouseService;
    }

    public void setPrintingHouseService(IPrintingHouseService printingHouseService) {
        this.printingHouseService = printingHouseService;
    }

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }

}

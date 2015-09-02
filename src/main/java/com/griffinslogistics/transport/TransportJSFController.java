/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.transport;

import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.resource.ResourceBundleBean;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author xworks.admin
 */
@ManagedBean
@ViewScoped
public class TransportJSFController {

    @ManagedProperty(value = "#{transportService}")
    private ITransportService transportService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private Calendar calendar;

    private List<Transport> allTransportations;
    private Transport newTransport;
    private List<Integer> weekNumbers;
    private List<Integer> years;
    private Transport selectedTransportation;

    private Long transportId;

    @PostConstruct
    public void init() {
        allTransportations = transportService.getAll();

        Collections.reverse(allTransportations);

        this.newTransport = new Transport();
        this.calendar = Calendar.getInstance();
        initWeekNumbers();
        initYears();
    }

    public String addTransport() {
        String resultPage = null;

        calendar.setWeekDate(newTransport.getYear(), newTransport.getWeekNumber(), Calendar.FRIDAY);

        Date date = calendar.getTime();
        newTransport.setStartDate(date);

        FacesMessage facesMessage = null;

        try {
            boolean isAdded = this.transportService.addTransport(newTransport);

            if (isAdded) {
                this.allTransportations.add(0, newTransport);
                String message = resourceBundleBean.get(ResourceBundleBean.SUCCESS_TRANSPORT_ADDED);
                facesMessage = new FacesMessage(FacesMessage.SEVERITY_INFO, message, "");
                newTransport = new Transport();
            }
        } catch (Exception e) {
            facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
        }
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);

        return resultPage;
    }

    public String viewBookspackages(Transport transport) {
        setTransportInSession(transport);
        return "/bookspackages?faces-redirect=true&transport-id=" + transport.getId();
    }

    public String viewBooks(Transport transport) {
        setTransportInSession(transport);
        return "/books-for-transportation?faces-redirect=true&transport-id=" + transport.getId();
    }

    public String viewAdditionalCosts() {
        return "/admin/additional-costs?faces-redirect=true&transport-id=" + transportId;
    }

    public void setTransportInSession(Transport transport) {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        session.put("transport", transport);
    }

    private void initWeekNumbers() {
        int weeksCount = this.calendar.getActualMaximum(Calendar.WEEK_OF_YEAR);

        this.weekNumbers = new ArrayList<Integer>(weeksCount);

        for (int i = 0; i < weeksCount; i++) {
            this.weekNumbers.add(i, i + 1);
        }
    }

    private void initYears() {
        this.years = new ArrayList<Integer>(3);
        int currentYear = this.calendar.get(Calendar.YEAR);

        this.years.add(0, currentYear);
        this.years.add(1, currentYear - 1);
        this.years.add(2, currentYear + 1);
    }

    public List<Transport> getAllTransportations() {
        return allTransportations;
    }

    public void setAllTransportations(List<Transport> allTransportations) {
        this.allTransportations = allTransportations;
    }

    public ITransportService getTransportService() {
        return transportService;
    }

    public void setTransportService(ITransportService transportService) {
        this.transportService = transportService;
    }

    public Transport getNewTransport() {
        return newTransport;
    }

    public void setNewTransport(Transport newTransport) {
        this.newTransport = newTransport;
    }

    public List<Integer> getWeekNumbers() {
        return weekNumbers;
    }

    public void setWeekNumbers(List<Integer> weekNumbers) {
        this.weekNumbers = weekNumbers;
    }

    public List<Integer> getYears() {
        return years;
    }

    public void setYears(List<Integer> years) {
        this.years = years;
    }

    public Transport getSelectedTransportation() {
        return selectedTransportation;
    }

    public void setSelectedTransportation(Transport selectedTransportation) {
        this.selectedTransportation = selectedTransportation;
    }

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.additionalcost;

import com.griffinslogistics.entities.AdditionalCost;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.resource.ResourceBundleBean;
import com.griffinslogistics.transport.ITransportService;
import com.griffinslogistics.truckgroup.ITruckGroupService;
import com.griffinslogistics.truckgroup.TruckGroupTotalsModel;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
public class AdditionalCostJSFController implements Serializable {

    @ManagedProperty(value = "#{additionalCostService}")
    private IAdditionalCostService additionalCostService;

    @ManagedProperty(value = "#{truckGroupService}")
    private ITruckGroupService truckGroupService;

    @ManagedProperty(value = "#{transportService}")
    private ITransportService transportService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private Transport transport;
    private AdditionalCost newAdditionalCost;

    private List<AdditionalCost> additionalCosts;
    private Map<String, TruckGroupTotalsModel> truckGroupTotalsMap;
    private List<String> truckGroupTotalsKeys;
    private List<TruckGroupTotalsModel> truckGroupTotals;

    private int truckGroupsPrice;
    private int additionalCostsPrice;
    private Long transportId;

    @PostConstruct
    public void init() {

        this.newAdditionalCost = new AdditionalCost();
        this.additionalCosts = new ArrayList<AdditionalCost>();

        initTransport();
        initAdditionalCosts();
        initTruckGroupTotals();
    }

    public void addAdditionalCost() {
        newAdditionalCost.setTransport(transport);

        boolean added = this.additionalCostService.updateAdditionalCost(newAdditionalCost);

        FacesMessage message;
        String messageString;
        if (added) {
            this.additionalCosts.add(0, newAdditionalCost);
            newAdditionalCost = new AdditionalCost();
            messageString = resourceBundleBean.get(ResourceBundleBean.SUCCESS_ADDITIONAL_COST_ADDED);
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        } else {
            messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_ADDITIONAL_COST_ADD);
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, messageString, "");
        }

        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public void onEdit(RowEditEvent event) {
        FacesMessage message = null;

        try {
            AdditionalCost edited = (AdditionalCost) event.getObject();
            boolean updated = this.additionalCostService.updateAdditionalCost(edited);
            String messageString;
            if (updated) {
                messageString = resourceBundleBean.get(ResourceBundleBean.SUCCESS_ADDITIONAL_COST_UPDATED);
                message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
            } else {
                messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_ADDITIONAL_COST_UPDATE);
                message = new FacesMessage(FacesMessage.SEVERITY_ERROR, messageString, "");
            }
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
        } finally {
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void onCancelEdit(RowEditEvent event) {
        String messageString = resourceBundleBean.get(ResourceBundleBean.SUCCESS_UPDATE_CANCELED);
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public int sortTruckGroupTotals(TruckGroupTotalsModel model1, TruckGroupTotalsModel model2) {
        Integer model1Number = null;
        Integer model2Number = null;
        try {
            model1Number = Integer.parseInt(model1.getName());
        } catch (NumberFormatException exception) {

        }

        try {
            model2Number = Integer.parseInt(model2.getName());
        } catch (NumberFormatException exception) {

        }

        if (model1Number == null) {
            return 1;
        } else if (model2Number == null) {
            return -1;
        } else {
            return model1Number.compareTo(model2Number);
        }
    }

    private void initTransport() {
        String transportIdString = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("transport-id");
        transportId = Long.parseLong(transportIdString);
        this.transport = this.transportService.get(transportId);
    }

    private void initAdditionalCosts() {
        this.additionalCosts = this.additionalCostService.getAdditionalCostsByTransportId(this.transport.getId());
        for (AdditionalCost additionalCost : additionalCosts) {
            BigDecimal price = additionalCost.getPrice();
            if (price != null) {
                this.additionalCostsPrice += additionalCost.getPrice().intValue();
            }
        }
    }

    private void initTruckGroupTotals() {
        this.truckGroupTotalsMap = this.truckGroupService.getTruckGroupTotalsForTransport(transport.getId());

        this.truckGroupTotalsKeys = new ArrayList<String>();
        this.truckGroupTotalsKeys.addAll(truckGroupTotalsMap.keySet());

        Collections.sort(this.truckGroupTotalsKeys);

        this.truckGroupTotals = new ArrayList<TruckGroupTotalsModel>();

        for (String string : this.truckGroupTotalsKeys) {
            TruckGroupTotalsModel model = this.truckGroupTotalsMap.get(string);
            this.truckGroupTotals.add(model);
            this.truckGroupsPrice += model.getTotalPrice().intValue();
        }

        Collections.sort(this.truckGroupTotals, new Comparator<TruckGroupTotalsModel>() {

            @Override
            public int compare(TruckGroupTotalsModel o1, TruckGroupTotalsModel o2) {
                return sortTruckGroupTotals(o1, o2);
            }
        });
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public AdditionalCost getNewAdditionalCost() {
        return newAdditionalCost;
    }

    public void setNewAdditionalCost(AdditionalCost newAdditionalCost) {
        this.newAdditionalCost = newAdditionalCost;
    }

    public List<AdditionalCost> getAdditionalCosts() {
        return additionalCosts;
    }

    public void setAdditionalCosts(List<AdditionalCost> additionalCosts) {
        this.additionalCosts = additionalCosts;
    }

    public List<TruckGroupTotalsModel> getTruckGroupTotals() {
        return truckGroupTotals;
    }

    public void setTruckGroupTotals(List<TruckGroupTotalsModel> truckGroupTotals) {
        this.truckGroupTotals = truckGroupTotals;
    }

    public int getTruckGroupsPrice() {
        return truckGroupsPrice;
    }

    public void setTruckGroupsPrice(int truckGroupsPrice) {
        this.truckGroupsPrice = truckGroupsPrice;
    }

    public int getAdditionalCostsPrice() {
        return additionalCostsPrice;
    }

    public void setAdditionalCostsPrice(int additionalCostsPrice) {
        this.additionalCostsPrice = additionalCostsPrice;
    }

    public IAdditionalCostService getAdditionalCostService() {
        return additionalCostService;
    }

    public void setAdditionalCostService(IAdditionalCostService additionalCostService) {
        this.additionalCostService = additionalCostService;
    }

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }

    public Map<String, TruckGroupTotalsModel> getTruckGroupTotalsMap() {
        return truckGroupTotalsMap;
    }

    public void setTruckGroupTotalsMap(Map<String, TruckGroupTotalsModel> truckGroupTotalsMap) {
        this.truckGroupTotalsMap = truckGroupTotalsMap;
    }

    public List<String> getTruckGroupTotalsKeys() {
        return truckGroupTotalsKeys;
    }

    public void setTruckGroupTotalsKeys(List<String> truckGroupTotalsKeys) {
        this.truckGroupTotalsKeys = truckGroupTotalsKeys;
    }

    public ITruckGroupService getTruckGroupService() {
        return truckGroupService;
    }

    public void setTruckGroupService(ITruckGroupService truckGroupService) {
        this.truckGroupService = truckGroupService;
    }

    public ITransportService getTransportService() {
        return transportService;
    }

    public void setTransportService(ITransportService transportService) {
        this.transportService = transportService;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }
}

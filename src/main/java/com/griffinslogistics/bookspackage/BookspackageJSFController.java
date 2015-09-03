/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.bookspackage;

import com.griffinslogistics.book.BookBoxModel;
import com.griffinslogistics.book.IBookService;
import com.griffinslogistics.document.excel.BDLGenerator;
import com.griffinslogistics.document.excel.CMRGenerator;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
import com.griffinslogistics.entities.Pulsiodetails;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.entities.TruckGroup;
import com.griffinslogistics.pulsiodetails.IPulsioDetailsService;
import com.griffinslogistics.resource.ResourceBundleBean;
import com.griffinslogistics.transport.ITransportService;
import com.griffinslogistics.truckgroup.ITruckGroupService;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import org.primefaces.event.RowEditEvent;
import org.springframework.orm.hibernate4.HibernateOptimisticLockingFailureException;

/**
 *
 * @author xworks.admin
 */
@ManagedBean
@ViewScoped
public class BookspackageJSFController implements Serializable {

    @ManagedProperty(value = "#{bookspackageService}")
    private IBookspackageService bookspackageService;

    @ManagedProperty(value = "#{bookService}")
    private IBookService bookService;

    @ManagedProperty(value = "#{pulsioDetailsService}")
    private IPulsioDetailsService pulsioDetailsService;

    @ManagedProperty(value = "#{transportService}")
    private ITransportService transportService;

    @ManagedProperty(value = "#{truckGroupService}")
    private ITruckGroupService truckGroupService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private Transport transport;
    private Long transportId;

    private List<Bookspackage> bookspackages;

    private List<SelectItem> truckGroupSelectItems;
    private List<SelectItem> truckGroupFilterSelectItems;
    private List<TruckGroup> allTruckGroups;
    private TruckGroup selectedTruckGroup;
    private Integer year;
    private Integer weekNumber;
    private Book bookFilter;
    private boolean hasBookFilter;

    private List<BookspackageModel> filteredBookspackages;
    private Bookspackage selectedBookspackage;
    private Map<String, Double> totalWeights;
    private List<String> totalWeightsKeys;
    private SelectItem[] bookspackagePrioritySelectItems;
    private SelectItem[] bookspackagePriorityFilterSelectItems;
    private SelectItem[] bookspackageStateSelectItems;
    private SelectItem[] bookspackageStateFilterSelectItems;
    private Bookspackage newBookspackage;

    private List<Bookspackage> bookspackageHistories;

    @PostConstruct
    public void init() {
        newBookspackage = new Bookspackage();

        if (transportId == null) {
            String transportIdString = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("transport-id");
            transportId = Long.parseLong(transportIdString);
        }

        initTransport();
        this.bookspackages = bookspackageService.getBookspackagesByTransportId(this.transport.getId());

        initTruckGroups();
        initTotals();
        initBookspackagePrioritySelectItems();
        initBookspackageStateSelectItems();
    }

    public void addBookspackage() {
        this.newBookspackage.setTransport(this.transport);
        this.newBookspackage.setTransportId(this.transport.getId());
        boolean added = this.bookspackageService.addBookspackage(newBookspackage);

        FacesMessage facesMessage = null;
        String message = null;

        if (added) {
            this.bookspackages.add(0, this.newBookspackage);
            message = resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOKSPACKAGE_ADDED);
            facesMessage = new FacesMessage(FacesMessage.SEVERITY_INFO, message, "");
        } else {
            message = resourceBundleBean.get(ResourceBundleBean.ERROR_BOOKSPACKAGE_ADD);
            facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, message, null);
        }
        this.newBookspackage = new Bookspackage();

        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
    }

    public void copyBookspackage(Bookspackage bookspackage) {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Bookspackage copiedBookspackage = bookspackage.makeDeepCopy();
        session.put("copiedBookspackage", copiedBookspackage);
        String messageString = String.format(resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOKSPACKAGE_COPIED), bookspackage.getPackageNumber());
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public void pasteBookspackage() {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        Bookspackage copiedBookspackage = (Bookspackage) session.get("copiedBookspackage");

        String messageString;
        FacesMessage message;
        if (copiedBookspackage == null) {
            messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_BOOKSPACKAGE_NOT_COPIED);
            message = new FacesMessage(FacesMessage.SEVERITY_WARN, messageString, "");
        } else {
            this.newBookspackage = copiedBookspackage;
            messageString = resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOKSPACKAGE_PASTED);
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        }

        FacesContext.getCurrentInstance().addMessage(null, message);

    }

    public String viewBooks(Bookspackage bookspackage) {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        session.put("bookspackage", bookspackage);
        return "/books?faces-redirect=true&bookspackage-id=" + bookspackage.getId();
    }

    public void getAllBDL() {

        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();

        Map<String, List<BookBoxModel>> bookBoxModelsForTransportation = this.bookService.getAllBookBoxModelsByTransportId(this.transportId);

        if (bookBoxModelsForTransportation.isEmpty()) {
            FacesMessage message = new FacesMessage(
                    FacesMessage.SEVERITY_WARN,
                    resourceBundleBean.get(ResourceBundleBean.ERROR_NO_BOXES_EXCEL_GENERATOR),
                    null);
            FacesContext.getCurrentInstance().addMessage(null, message);
            return;
        }

        try (OutputStream outputStream = externalContext.getResponseOutputStream();) {

            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            externalContext.setResponseContentType(contentType);
            String transportNumber = this.transport.getWeekNumber() + "/" + this.transport.getYear();
            String responseHeaderValue = String.format("attachment; filename=\"BDL Transport %s.xlsx\"", transportNumber);
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);

            Pulsiodetails pulsioDetails = this.pulsioDetailsService.getDetails();

            BDLGenerator.generateAll(outputStream, bookBoxModelsForTransportation, pulsioDetails, transportNumber);

            FacesContext.getCurrentInstance().responseComplete();
            outputStream.flush();
            outputStream.close();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getBDL() {
        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();

        List<BookBoxModel> bookBoxModels = this.bookService.getAllBookBoxModelsByBookspackageId(selectedBookspackage.getId());

        if (bookBoxModels.isEmpty()) {
            String messageString = this.resourceBundleBean.get(ResourceBundleBean.ERROR_NO_BOXES_IN_BOOKSPACKAGE_EXCEL_GENERATOR);
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, messageString, null);
            FacesContext.getCurrentInstance().addMessage(null, message);
            return;
        }

        try (OutputStream outputStream = externalContext.getResponseOutputStream();) {

            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            externalContext.setResponseContentType(contentType);
            String packageNumber = selectedBookspackage.getPackageNumber();
            String responseHeaderValue = String.format("attachment; filename=\"BDL %s.xlsx\"", packageNumber);
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);

            Pulsiodetails pulsioDetails = this.pulsioDetailsService.getDetails();

            BDLGenerator.generateSingle(outputStream, bookBoxModels, pulsioDetails, packageNumber);

            FacesContext.getCurrentInstance().responseComplete();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getAllCMR() {

        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();

        List<BookspackageCMRModel> bookspackageCMRModels = this.bookspackageService.totalBookspackageCMRModelsByTransportId(transportId);

        if (bookspackageCMRModels.isEmpty()) {
            String messageString = this.resourceBundleBean.get(ResourceBundleBean.ERROR_NO_BOXES_EXCEL_GENERATOR);
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, messageString, null);
            FacesContext.getCurrentInstance().addMessage(null, message);
            return;
        }

        try (OutputStream outputStream = externalContext.getResponseOutputStream();) {

            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            externalContext.setResponseContentType(contentType);
            String responseHeaderValue = String.format("attachment; filename=\"CMR Transport %s.xlsx\"", this.transport.getWeekNumber() + "/" + this.transport.getYear());
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);

            Pulsiodetails pulsioDetails = this.pulsioDetailsService.getDetails();

            CMRGenerator.generateAll(outputStream, bookspackageCMRModels, pulsioDetails);

            FacesContext.getCurrentInstance().responseComplete();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void getCMR() {
        BookspackageCMRModel bookspackageCMRModel = this.bookspackageService.bookspackageCMRModelById(selectedBookspackage.getId());

        if (bookspackageCMRModel.getTotalBoxesCount() == null || bookspackageCMRModel.getTotalBoxesCount() == 0) {
            String messageString = this.resourceBundleBean.get(ResourceBundleBean.ERROR_NO_BOXES_IN_BOOKSPACKAGE_EXCEL_GENERATOR);
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_WARN, messageString, null);
            FacesContext.getCurrentInstance().addMessage(null, message);
            return;
        }

        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();

        try (OutputStream outputStream = externalContext.getResponseOutputStream();) {

            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            externalContext.setResponseContentType(contentType);
            String responseHeaderValue = String.format("attachment; filename=\"CMR %s.xlsx\"", selectedBookspackage.getPackageNumber());
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);

            Pulsiodetails pulsioDetails = this.pulsioDetailsService.getDetails();

            CMRGenerator.generateSingle(outputStream, bookspackageCMRModel, pulsioDetails);
            FacesContext.getCurrentInstance().responseComplete();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(BookspackageJSFController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void fetchBookspackageHistory() {
        this.bookspackageHistories = this.bookspackageService.getBookpackagesHistory(this.selectedBookspackage.getId());
    }

    public void onEdit(RowEditEvent event) {
        FacesMessage message = null;
        Bookspackage edited = (Bookspackage) event.getObject();

        try {
            boolean isUpdated = bookspackageService.updateBookspackage(edited);

            if (isUpdated) {
                message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOKSPACKAGE_UPDATED), "");
                initTotals();
            } else {
                message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOOKSPACKAGE_UPDATE), "");
            }
        } catch (HibernateOptimisticLockingFailureException e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOOKSPACKAGE_CONCURRENT_UPDATE), "");
            FacesContext.getCurrentInstance().getPartialViewContext().getRenderIds().add("bookspackages-datatable-form:bookspackages-datatable");
            this.bookspackages = bookspackageService.getBookspackagesByTransportId(this.transport.getId());

        } finally {
            FacesContext.getCurrentInstance().addMessage(null, message);
        }
    }

    public void onCancelEdit(RowEditEvent event) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_UPDATE_CANCELED), "");
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public String deleteBookspackage() {
        String result = null;

        boolean isDeleted = false;
        FacesMessage message = null;

        try {
            TruckGroup truckGroup = this.selectedBookspackage.getTruckGroup();
//            if (truckGroup.getId() == null || truckGroup.getId() == 0) {
//                this.selectedBookspackage.setTruckGroup(null);
//            }

            isDeleted = this.bookspackageService.deleteBookspackage(this.selectedBookspackage);
            this.bookspackages.remove(this.selectedBookspackage);
            this.selectedBookspackage = new Bookspackage();
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
            FacesContext.getCurrentInstance().addMessage(null, message);
        }

        String messageString;
        if (isDeleted) {
            messageString = resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOKSPACKAGE_DELETED);
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, messageString, "");
        } else {
            messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_BOOKSPACKAGE_NOT_DELETED);
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, messageString, "");
        }

        FacesContext.getCurrentInstance().addMessage(null, message);
        return result;
    }

    private void initTransport() {
        transport = transportService.get(transportId);
    }

    private void initTotals() {
        totalWeights = this.transportService.totalWeightsForTransport(this.transport.getId());
        this.totalWeightsKeys = new ArrayList<String>(totalWeights.keySet());
    }

    private void initTruckGroups() {
        this.truckGroupSelectItems = new ArrayList<SelectItem>();
        this.truckGroupFilterSelectItems = new ArrayList<SelectItem>();

        allTruckGroups = this.truckGroupService.getAllTruckGroups();

        truckGroupFilterSelectItems.add(new SelectItem("", "Всички"));

        for (TruckGroup truckGroup : allTruckGroups) {
            truckGroupSelectItems.add(new SelectItem(truckGroup.getId(), truckGroup.getName()));
            truckGroupFilterSelectItems.add(new SelectItem(truckGroup.getId(), truckGroup.getName()));
        }
    }

    private void initBookspackagePrioritySelectItems() {
        BookspackagePriorityEnum[] priorities = BookspackagePriorityEnum.values();

        this.bookspackagePrioritySelectItems = new SelectItem[priorities.length];
        this.bookspackagePriorityFilterSelectItems = new SelectItem[priorities.length + 1];
        this.bookspackagePriorityFilterSelectItems[0] = new SelectItem("", "Всички");

        for (int i = 0; i < priorities.length; i++) {
            this.bookspackagePrioritySelectItems[i] = new SelectItem(priorities[i].getValue(), priorities[i].getDisplayValue());
            this.bookspackagePriorityFilterSelectItems[i + 1] = new SelectItem(priorities[i].getValue(), priorities[i].getDisplayValue());
        }
    }

    private void initBookspackageStateSelectItems() {
        BookspackageStateEnum[] states = BookspackageStateEnum.values();

        this.bookspackageStateSelectItems = new SelectItem[states.length];
        this.bookspackageStateFilterSelectItems = new SelectItem[states.length + 1];
        this.bookspackageStateFilterSelectItems[0] = new SelectItem("", "Всички");

        for (int i = 0; i < states.length; i++) {
            this.bookspackageStateSelectItems[i] = new SelectItem(states[i].getValue(), states[i].getDisplayValue());
            this.bookspackageStateFilterSelectItems[i + 1] = new SelectItem(states[i].getValue(), states[i].getDisplayValue());
        }
    }

    public IBookspackageService getBookspackageService() {
        return bookspackageService;
    }

    public void setBookspackageService(IBookspackageService bookspackageService) {
        this.bookspackageService = bookspackageService;
    }

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public List<Bookspackage> getBookspackages() {
        return bookspackages;
    }

    public void setBookspackages(List<Bookspackage> bookspackages) {
        this.bookspackages = bookspackages;
    }

    public SelectItem[] getBookspackagePrioritySelectItems() {
        return bookspackagePrioritySelectItems;
    }

    public void setBookspackagePrioritySelectItems(SelectItem[] bookspackagePrioritySelectItems) {
        this.bookspackagePrioritySelectItems = bookspackagePrioritySelectItems;
    }

    public SelectItem[] getBookspackagePriorityFilterSelectItems() {
        return bookspackagePriorityFilterSelectItems;
    }

    public void setBookspackagePriorityFilterSelectItems(SelectItem[] bookspackagePriorityFilterSelectItems) {
        this.bookspackagePriorityFilterSelectItems = bookspackagePriorityFilterSelectItems;
    }

    public SelectItem[] getBookspackageStateSelectItems() {
        return bookspackageStateSelectItems;
    }

    public void setBookspackageStateSelectItems(SelectItem[] bookspackageStateSelectItems) {
        this.bookspackageStateSelectItems = bookspackageStateSelectItems;
    }

    public SelectItem[] getBookspackageStateFilterSelectItems() {
        return bookspackageStateFilterSelectItems;
    }

    public void setBookspackageStateFilterSelectItems(SelectItem[] bookspackageStateFilterSelectItems) {
        this.bookspackageStateFilterSelectItems = bookspackageStateFilterSelectItems;
    }

    public List<BookspackageModel> getFilteredBookspackages() {
        return filteredBookspackages;
    }

    public void setFilteredBookspackages(List<BookspackageModel> filteredBookspackages) {
        this.filteredBookspackages = filteredBookspackages;
    }

    public Bookspackage getNewBookspackage() {
        return newBookspackage;
    }

    public void setNewBookspackage(Bookspackage newBookspackage) {
        this.newBookspackage = newBookspackage;
    }

    public Map<String, Double> getTotalWeights() {
        return totalWeights;
    }

    public void setTotalWeights(Map<String, Double> totalWeights) {
        this.totalWeights = totalWeights;
    }

    public ITransportService getTransportService() {
        return transportService;
    }

    public ITruckGroupService getTruckGroupService() {
        return truckGroupService;
    }

    public void setTruckGroupService(ITruckGroupService truckGroupService) {
        this.truckGroupService = truckGroupService;
    }

    public List<SelectItem> getTruckGroupSelectItems() {
        return truckGroupSelectItems;
    }

    public void setTruckGroupSelectItems(List<SelectItem> truckGroupSelectItems) {
        this.truckGroupSelectItems = truckGroupSelectItems;
    }

    public List<SelectItem> getTruckGroupFilterSelectItems() {
        return truckGroupFilterSelectItems;
    }

    public void setTruckGroupFilterSelectItems(List<SelectItem> truckGroupFilterSelectItems) {
        this.truckGroupFilterSelectItems = truckGroupFilterSelectItems;
    }

    public List<TruckGroup> getAllTruckGroups() {
        return allTruckGroups;
    }

    public void setAllTruckGroups(List<TruckGroup> allTruckGroups) {
        this.allTruckGroups = allTruckGroups;
    }

    public TruckGroup getSelectedTruckGroup() {
        return selectedTruckGroup;
    }

    public void setSelectedTruckGroup(TruckGroup selectedTruckGroup) {
        this.selectedTruckGroup = selectedTruckGroup;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getWeekNumber() {
        return weekNumber;
    }

    public void setWeekNumber(Integer weekNumber) {
        this.weekNumber = weekNumber;
    }

    public Book getBookFilter() {
        return bookFilter;
    }

    public void setBookFilter(Book bookFilter) {
        this.bookFilter = bookFilter;
    }

    public boolean isHasBookFilter() {
        return hasBookFilter;
    }

    public void setHasBookFilter(boolean hasBookFilter) {
        this.hasBookFilter = hasBookFilter;
    }

    public Bookspackage getSelectedBookspackage() {
        return selectedBookspackage;
    }

    public void setSelectedBookspackage(Bookspackage selectedBookspackage) {
        this.selectedBookspackage = selectedBookspackage;
    }

    public void setTransportService(ITransportService transportService) {
        this.transportService = transportService;
    }

    public List<String> getTotalWeightsKeys() {
        return totalWeightsKeys;
    }

    public void setTotalWeightsKeys(List<String> totalWeightsKeys) {
        this.totalWeightsKeys = totalWeightsKeys;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }

    public IBookService getBookService() {
        return bookService;
    }

    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }

    public IPulsioDetailsService getPulsioDetailsService() {
        return pulsioDetailsService;
    }

    public void setPulsioDetailsService(IPulsioDetailsService pulsioDetailsService) {
        this.pulsioDetailsService = pulsioDetailsService;
    }

    public List<Bookspackage> getBookspackageHistories() {
        return bookspackageHistories;
    }

    public void setBookspackageHistories(List<Bookspackage> bookspackageHistories) {
        this.bookspackageHistories = bookspackageHistories;
    }
}

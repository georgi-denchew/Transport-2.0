/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.document.excel.BookLabelGenerator;
import com.griffinslogistics.entities.PrintingHouse;
import com.griffinslogistics.entities.Transport;
import com.griffinslogistics.printinghouse.IPrintingHouseService;
import com.griffinslogistics.resource.ResourceBundleBean;
import com.griffinslogistics.transport.ITransportService;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
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
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author xworks.admin
 */
@ManagedBean
@ViewScoped
public class BookfForTransportationJSFController implements Serializable {

    private static final Logger logger = Logger.getLogger(BookfForTransportationJSFController.class.getName());

    @ManagedProperty(value = "#{bookService}")
    private IBookService bookService;

    @ManagedProperty(value = "#{transportService}")
    private ITransportService transportService;

    @ManagedProperty(value = "#{printingHouseService}")
    private IPrintingHouseService printingHouseService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private Transport transport;
    List<BookForTransportationModel> booksForTransportation;
    List<BookForTransportationModel> selectedBooksForPrinting;
    private List<SelectItem> printingHousesFilterSelectItems;
    private List<PrintingHouse> allPrintingHouses;
    private Long transportId;

    @PostConstruct
    public void init() {
        initTransporation();
        initBooksForTransportation();
        initPrintingHouses();
    }

    public void updateDiscardedField(BookForTransportationModel book) {

        boolean updateSuccessful = this.bookService.updateBookDiscardedField(book.getId(), book.isDiscarded());

        FacesMessage message;
        String messageString = null;

        if (updateSuccessful) {
            String format;
            
            if (book.isDiscarded()) {
                format = resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOK_DISCARDED);
            } else {
                format = resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOK_RETURNED);
            }
            messageString = String.format(format, book.getTitle(), book.getBookNumber());
            
            message = new FacesMessage(messageString);

        } else {
            messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_BOOK_UPDATE);
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, messageString, null);
        }
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public void getLabel() {
        OutputStream outputStream = null;

        if (selectedBooksForPrinting == null || selectedBooksForPrinting.isEmpty()) {
            String messageString = resourceBundleBean.get(ResourceBundleBean.ERROR_NO_BOOKS_SELECTED);
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, messageString, null);
            FacesContext.getCurrentInstance().addMessage(null, message);
            return;
        }

        try {
            List<Long> selectedBookIds = new ArrayList<Long>();
            for (BookForTransportationModel bookForTransportationModel : selectedBooksForPrinting) {
                selectedBookIds.add(bookForTransportationModel.getId());
            }

            List<BookLabelModel> bookLabelModelList = this.bookService.getLabelInfoForBooks(selectedBookIds);
            //this.dbHelper.books.getLabelInfoForBooks(selectedBookIds);

            ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            externalContext.setResponseContentType(contentType);
            String filename = String.format("\"Stikeri Knigi za Transport %s\\%s\"", transport.getYear(), transport.getWeekNumber());
            String responseHeaderValue = ("attachment; filename=" + filename + ".xlsx");
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);
            outputStream = externalContext.getResponseOutputStream();

            BookLabelGenerator.generateLabels(outputStream, bookLabelModelList);
            FacesContext.getCurrentInstance().responseComplete();

        } catch (FileNotFoundException ex) {
            logger.log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            logger.log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, null, ex);

        } finally {
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException ex) {
                logger.log(Level.SEVERE, null, ex);
            }
        }
    }

    public void postProcessXLS(Object document) {
        XSSFWorkbook wb = (XSSFWorkbook) document;

        try {
            XSSFSheet sheet = wb.getSheetAt(0);

            for (int i = 2; i <= sheet.getPhysicalNumberOfRows(); i++) {
                Row row = sheet.getRow(i);
                row.setHeightInPoints(30);

                XSSFCell cell = sheet.getRow(i).getCell(0);
                String text = cell.getStringCellValue();
                boolean value = Boolean.parseBoolean(text);

                if (value) {
                    cell.setCellValue("Да");
                } else {
                    cell.setCellValue("Не");
                }
            }
        } catch (Exception e) {
            String message = e.getMessage();
            e.printStackTrace();
        }
    }

    private void initTransporation() {
        if (transportId == null) {
            String transportIdString = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("transport-id");
            transportId = Long.parseLong(transportIdString);
        }

        transport = transportService.get(transportId);
    }

    private void initBooksForTransportation() {
        this.booksForTransportation
                = this.bookService.getBooksForTransportModelByTransportId(transport.getId());

    }

    private void initPrintingHouses() {
        this.printingHousesFilterSelectItems = new ArrayList<SelectItem>();

        this.allPrintingHouses = this.printingHouseService.getAll();

        printingHousesFilterSelectItems.add(new SelectItem("", "Всички"));

        for (PrintingHouse printingHouse : allPrintingHouses) {
            printingHousesFilterSelectItems.add(new SelectItem(printingHouse.getName(), printingHouse.getName()));
        }
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public List<BookForTransportationModel> getBooksForTransportation() {
        return booksForTransportation;
    }

    public void setBooksForTransportation(List<BookForTransportationModel> booksForTransportation) {
        this.booksForTransportation = booksForTransportation;
    }

    public List<BookForTransportationModel> getSelectedBooksForPrinting() {
        return selectedBooksForPrinting;
    }

    public void setSelectedBooksForPrinting(List<BookForTransportationModel> selectedBooksForPrinting) {
        this.selectedBooksForPrinting = selectedBooksForPrinting;
    }

    public List<SelectItem> getPrintingHousesFilterSelectItems() {
        return printingHousesFilterSelectItems;
    }

    public void setPrintingHousesFilterSelectItems(List<SelectItem> printingHousesFilterSelectItems) {
        this.printingHousesFilterSelectItems = printingHousesFilterSelectItems;
    }

    public List<PrintingHouse> getAllPrintingHouses() {
        return allPrintingHouses;
    }

    public void setAllPrintingHouses(List<PrintingHouse> allPrintingHouses) {
        this.allPrintingHouses = allPrintingHouses;
    }

    public IBookService getBookService() {
        return bookService;
    }

    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }

    public IPrintingHouseService getPrintingHouseService() {
        return printingHouseService;
    }

    public void setPrintingHouseService(IPrintingHouseService printingHouseService) {
        this.printingHouseService = printingHouseService;
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

    public ResourceBundleBean getResourceBundleBean() {
        return resourceBundleBean;
    }

    public void setResourceBundleBean(ResourceBundleBean resourceBundleBean) {
        this.resourceBundleBean = resourceBundleBean;
    }
}

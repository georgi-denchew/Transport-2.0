/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.book;

import com.griffinslogistics.bookspackage.IBookspackageService;
import com.griffinslogistics.document.excel.BookLabelGenerator;
import com.griffinslogistics.entities.Book;
import com.griffinslogistics.entities.Bookspackage;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author xworks.admin
 */
@ManagedBean
@ViewScoped
public class BookJSFController implements Serializable {

    private static final Logger logger = Logger.getLogger(BookJSFController.class.getName());

    @ManagedProperty(value = "#{bookService}")
    private IBookService bookService;

    @ManagedProperty(value = "#{bookspackageService}")
    private IBookspackageService bookspackageService;

    @ManagedProperty(value = "#{transportService}")
    private ITransportService transportService;

    @ManagedProperty(value = "#{printingHouseService}")
    private IPrintingHouseService printingHouseService;

    @ManagedProperty(value = "#{message}")
    ResourceBundleBean resourceBundleBean;

    private Transport transport;
    private Long transportId;
    private Bookspackage bookspackage;
    private Long bookspackageId;
    private List<Book> books;
    private List<BookModel> allBookModels;

    private Book selectedBook;
    private Book newBook = new Book();

    int selectedBookModelBookNumber;

    private boolean isNewTitle;
    private BookModel selectedModel;

    private List<SelectItem> printingHousesSelectItems;
    private List<SelectItem> printingHousesFilterSelectItems;
    private List<PrintingHouse> allPrintingHouses;
    private boolean isForTransportation;

    @PostConstruct
    public void init() {
        Map requestMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();

        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        String isForTransportationString = request.getParameter("for-transportation");

        this.isForTransportation = false;

        if (isForTransportationString != null) {
            this.isForTransportation = Boolean.parseBoolean(isForTransportationString);
        }

        String bookspackageIdString = (String) requestMap.get("bookspackage-id");
        bookspackageId = Long.parseLong(bookspackageIdString);
        
        
        bookspackage = bookspackageService.get(bookspackageId);
        transport = transportService.get(bookspackage.getTransportId());
        transportId = transport.getId();
//        initTransportation();
//        if (!isForTransportation) {
//            initBookspackage();
//        }

        initBooks();
        initTranposrtationBooks();
        initPrintingHouses();

        if (this.allBookModels != null) {
            isNewTitle = this.allBookModels.isEmpty();
        }
    }

    public void getLabel() {
        OutputStream outputStream = null;

        try {
            BookLabelModel bookLabelModel = bookService.getLabelInfoForBookId(selectedBook.getId());

            ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
            externalContext.responseReset();

            String contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            externalContext.setResponseContentType(contentType);
            String filename = String.format("\"Stiker Kniga %s Pratka %s\"", selectedBook.getBookNumber(), bookspackage.getPackageNumber());
            String responseHeaderValue = ("attachment; filename=" + filename + ".xlsx");
            externalContext.setResponseHeader("Content-Disposition", responseHeaderValue);
            outputStream = externalContext.getResponseOutputStream();

            BookLabelGenerator.generateLabel(outputStream, bookLabelModel);
            FacesContext.getCurrentInstance().responseComplete();

        } catch (FileNotFoundException ex) {
            logger.log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
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

    public void addBook() {
        newBook.setBookspackage(this.bookspackage);
        newBook.setDeliveryAddress(this.bookspackage.getDeliveryAddress());
        calculateWeightPerBook(newBook);
        Transport currentTransportation = this.bookspackage.getTransport();
        newBook.setTransport(currentTransportation);

        if (this.isNewTitle) {
            Integer biggestNumber = this.bookService.getBiggestBookNumberForTransportId(currentTransportation.getId());

            if (biggestNumber == null || biggestNumber == 0) {
                biggestNumber = 1;
            } else {
                biggestNumber++;
            }
            newBook.setBookNumber(biggestNumber);
        } else {
            findBookModel();
            newBook.setBookNumber(this.selectedModel.getBookNumber());
            newBook.setTitle((String) this.selectedModel.getTitle());
        }

        boolean added = this.bookService.updateBook(newBook);

        FacesMessage message;

        if (added) {
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOK_ADDED), null);
            this.books.add(0, newBook);

            if (this.isNewTitle) {
                this.allBookModels.add(new BookModel(this.newBook.getBookNumber(), this.newBook.getTitle()));
            }
            this.newBook = new Book();
        } else {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOOK_ADD), null);
        }

        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public String deleteBook() {
        String result = null;

        boolean isDeleted = false;
        FacesMessage message = null;

        try {
            isDeleted = this.bookService.deleteBook(this.selectedBook);
            this.books.remove(this.selectedBook);
            if (isDeleted) {
                initTranposrtationBooks();
            }
        } catch (Exception e) {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, e.getMessage(), "");
            FacesContext.getCurrentInstance().addMessage(null, message);
        }

        if (isDeleted) {
            this.books.remove(this.selectedBook);
            this.selectedBook = new Book();
            message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOK_DELETED), "");
        } else {
            message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOOK_DELETE), "");
        }

        FacesContext.getCurrentInstance().addMessage(null, message);

        return result;
    }

    public void onEdit(RowEditEvent event) {
        FacesMessage message = null;

        try {
            Book edited = (Book) event.getObject();
            calculateWeightPerBook(edited);

            if (!isForTransportation) {
                edited.setBookspackage(this.bookspackage);
            }

            edited.setTransport(transport);
            boolean updated = this.bookService.updateBook(edited);

            if (updated) {
                message = new FacesMessage(FacesMessage.SEVERITY_INFO, resourceBundleBean.get(ResourceBundleBean.SUCCESS_BOOK_UPDATED), "");
            } else {
                message = new FacesMessage(FacesMessage.SEVERITY_ERROR, resourceBundleBean.get(ResourceBundleBean.ERROR_BOOK_DELETE), "");
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

    public String viewBookspackages() {

        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();

        session.put("book", this.selectedBook);
        session.put("transportation", this.transport);
        return "/bookspackages?faces-redirect=true&book-filter=true";
    }

    public String viewBoxes(Book book) {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        session.put("book", book);
        return "/boxes?faces-redirect=true&book-id=" + book.getId();
    }

    private void initTransportation() {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();

        if (this.transport == null) {
            this.transport = (Transport) session.get("transport");
        }
    }

    private void initBookspackage() {
        Map<String, Object> session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();

        if (this.bookspackage == null) {
            this.bookspackage = (Bookspackage) session.get("bookspackage");
        }
    }

    private void initBooks() {
        if (isForTransportation) {
            this.books = this.bookService.getBooksByTransportId(this.transport.getId());
        } else {
            this.books = this.bookService.getBooksByBookspackageId(this.bookspackage.getId());
        }
    }

    private void initTranposrtationBooks() {
        if (isForTransportation) {
            this.allBookModels = this.bookService.getBookModelsByTransportId(this.transport.getId());
        } else {
            this.allBookModels = this.bookService.getBookModelsByTransportId(this.bookspackage.getTransport().getId());
        }
    }

    private void findBookModel() {
        for (BookModel model : allBookModels) {
            if (model.getBookNumber() == this.selectedBookModelBookNumber) {
                this.selectedModel = model;
                break;
            }
        }
    }

    private void initPrintingHouses() {
        this.printingHousesSelectItems = new ArrayList<SelectItem>();
        this.printingHousesFilterSelectItems = new ArrayList<SelectItem>();

        this.allPrintingHouses = this.printingHouseService.getAll();

        printingHousesFilterSelectItems.add(new SelectItem("", "Всички"));

        for (PrintingHouse printingHouse : allPrintingHouses) {
            printingHousesSelectItems.add(new SelectItem(printingHouse.getId(), printingHouse.getName()));
            printingHousesFilterSelectItems.add(new SelectItem(printingHouse.getId(), printingHouse.getName()));
        }
    }

    private void calculateWeightPerBook(Book selectedBook) {
        double weightPerBook = 0;
        if (selectedBook.getWeight() != 0 && selectedBook.getCount() != 0) {
            weightPerBook = selectedBook.getWeight() / selectedBook.getCount();
        }
        selectedBook.setWeightPerBook(weightPerBook);
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

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public Book getSelectedBook() {
        return selectedBook;
    }

    public void setSelectedBook(Book selectedBook) {
        this.selectedBook = selectedBook;
    }

    public Book getNewBook() {
        return newBook;
    }

    public void setNewBook(Book newBook) {
        this.newBook = newBook;
    }

    public int getSelectedBookModelBookNumber() {
        return selectedBookModelBookNumber;
    }

    public void setSelectedBookModelBookNumber(int selectedBookModelBookNumber) {
        this.selectedBookModelBookNumber = selectedBookModelBookNumber;
    }

    public boolean isIsNewTitle() {
        return isNewTitle;
    }

    public void setIsNewTitle(boolean isNewTitle) {
        this.isNewTitle = isNewTitle;
    }

    public BookModel getSelectedModel() {
        return selectedModel;
    }

    public void setSelectedModel(BookModel selectedModel) {
        this.selectedModel = selectedModel;
    }

    public List<SelectItem> getPrintingHousesSelectItems() {
        return printingHousesSelectItems;
    }

    public void setPrintingHousesSelectItems(List<SelectItem> printingHousesSelectItems) {
        this.printingHousesSelectItems = printingHousesSelectItems;
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

    public boolean isIsForTransportation() {
        return isForTransportation;
    }

    public void setIsForTransportation(boolean isForTransportation) {
        this.isForTransportation = isForTransportation;
    }

    public List<BookModel> getAllBookModels() {
        return allBookModels;
    }

    public void setAllBookModels(List<BookModel> allBookModels) {
        this.allBookModels = allBookModels;
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

    public Long getBookspackageId() {
        return bookspackageId;
    }

    public void setBookspackageId(Long bookspackageId) {
        this.bookspackageId = bookspackageId;
    }

    public IBookspackageService getBookspackageService() {
        return bookspackageService;
    }

    public void setBookspackageService(IBookspackageService bookspackageService) {
        this.bookspackageService = bookspackageService;
    }

    public ITransportService getTransportService() {
        return transportService;
    }

    public void setTransportService(ITransportService transportService) {
        this.transportService = transportService;
    }

}

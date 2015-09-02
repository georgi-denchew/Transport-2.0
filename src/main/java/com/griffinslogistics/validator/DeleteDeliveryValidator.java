/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.validator;

//import com.griffinslogistics.db.helpers.PulsioDetailsHelper;
import com.griffinslogistics.pulsiodetails.IPulsioDetailsService;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Georgi
 */
@Component
public class DeleteDeliveryValidator implements Validator {

    @Autowired
    private IPulsioDetailsService pulsioDetailsService;

    @Override
    public void validate(FacesContext fc, UIComponent uic, Object o) throws ValidatorException {
        String password = (String) o;
        boolean isValid = pulsioDetailsService.validatePassword(password);

        if (!isValid) {
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Грешна парола!", null);

            throw new ValidatorException(message);
        }
    }
}

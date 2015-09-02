/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.griffinslogistics.pulsiodetails;

import com.griffinslogistics.entities.Pulsiodetails;

/**
 *
 * @author xworks.admin
 */
public interface IPulsioDetailsDAO {

    boolean validatePassword(String password);

    Pulsiodetails getDetails();
}

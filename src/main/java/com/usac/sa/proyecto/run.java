/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.sa.proyecto;

import java.sql.SQLException;

/**
 *
 * @author Reimer
 */
public class run {

    public static void main(String[] argv) {

        Cliente c = new Cliente("Rei", "1234");
        System.out.println(c.Login());
        
        Cliente c2 = new Cliente("reimer", "1234");
        System.out.println(c2.Login());

    }
}

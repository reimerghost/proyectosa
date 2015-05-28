/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.ace2.sonar.client;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Reimer
 */
public class Menu {

    private int dp;
    private BaseDeDatos bdd;

    public Menu() {
        dp = -1;
        bdd = new BaseDeDatos();
    }

    public void mostrarMenuInicial() {
        boolean sale = false;

        while (!sale) {
            System.out.println("Bienvenido a Cliente SONAR para RASPBERRY-PI");
            System.out.println("--------------------------------------------");
            System.out.println("Elija la opcion");
            System.out.println("1) Registrar Dispositivo");
            System.out.println("2) Tomar Datos");
            System.out.println("3) Ver último datos leído");
            System.out.println("0) Salir del Programa");
            switch (getOpcion()) {

                case '0':
                    System.exit(0);
                    getOpcion();
                    break;
                case '1':
                    RegistrarDispositivo();
                    getOpcion();
                    break;
                case '2':
                    tomaDatos();
                    getOpcion();
                    break;
                case '3':
                    bdd.test();
                    getOpcion();
                    break;
            }
        }
    }

    private void RegistrarDispositivo() {
        System.out.println("Ingrese el número de Dispositivo: ");
        getOpcion();
        String a = getOpcion() + "";
        dp = Integer.parseInt(a);
        bdd = new BaseDeDatos(dp);
        bdd.Migrar();
    }

    private void tomaDatos() {
        if (dp > -1) {
            System.out.println("---");
            Thread myrunnable;
            myrunnable = new Thread(new Detector(dp), "T1"); //Thread created
            try {
                myrunnable.start();
                while (!Thread.interrupted()) {
                    if (Thread.interrupted()) {
                        return;//to quit from the middle of the loop
                    }
                }
            } finally {

            }
        } else {
            System.out.println("El dispositivo no ha sido registrado");
        }
    }

    private char getOpcion() {
        char caracter = ' ';
        try {
            caracter = (char) System.in.read();
            System.out.println("------" + caracter);
        } catch (IOException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return caracter;
    }
}

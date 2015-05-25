/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.ace2.sonar.client;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Reimer
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dp = 0;
        for (int i = 0; i < args.length; i++) {
            System.out.println(i+" "+args[i]);
            dp = Integer.parseInt(args[0]);
        }
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
            // close your ports in finally-block
            // so they get closed even on exceptions
        }

    }

}

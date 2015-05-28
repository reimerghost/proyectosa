/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.ace2.sonar.client;

/**
 *
 * @author Reimer
 */
public class Detector implements Runnable {

    /*El decibelio es la medida utilizada para
     expresar el nivel de potencia y el nivel de 
     intensidad del ruido.*/
    /*NOTA: Cualquier ruido por encima de los 120 dB
     puede perjudicar los oídos y llevar a la pérdida de la audición. */
    private int reg;
    private BaseDeDatos bdd;
    public Detector(int dp) {
        reg = 0;
        bdd = new BaseDeDatos(dp);
    }
    public void run() {
        System.out.println(" Thread Running " + Thread.currentThread().getName());
        try {
            while (true) {
                //System.out.println(tiempoCorriendo);
                reg++;
                float gf = 10*(float)Math.random()+10*(float)Math.random();
                bdd.grabarRegistro(reg,gf);
                bdd.Migrar();
                bdd.test();
                Thread.sleep(5000L);                
            }
        } catch (InterruptedException iex) {
        }finally{           
        }
    }

}

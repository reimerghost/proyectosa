package com.usac.ace2.sonar.client;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BaseDeDatos {

    private static int dispo = -1;

    public BaseDeDatos(int d) {
        dispo = d;
        iniciarBD();
    }
    public BaseDeDatos(){
        dispo = -500;
    }

    public void iniciarBD() {
        try {
            Class.forName("org.sqlite.JDBC");
            String p = "jdbc:sqlite:sonarbd-" + dispo + ".db";
            System.out.println(p);
            Connection conn = DriverManager.getConnection(p);
            Statement stat = conn.createStatement();
            stat.executeUpdate("drop table if exists REGISTRO;");
            stat.executeUpdate("create table if not exists REGISTRO"
                    + "(id_registro,"
                    + "datetime default current_timestamp,"
                    + "nivel_capturado,"
                    + "id_dispositivo"
                    + ");");
            conn.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void grabarRegistro(int no_reg, float captura) {
        try {
            String p = "jdbc:sqlite:sonarbd-" + dispo + ".db";
            Connection conn = DriverManager.getConnection(p);
            PreparedStatement prep = conn.prepareStatement("insert into REGISTRO values (?,?, ?, ?);");

            //Inserta Valores
            prep.setInt(1, no_reg);
            prep.setTimestamp(2, getFecha());
            prep.setFloat(3, captura);
            prep.setInt(4, dispo);
            prep.addBatch();

            conn.setAutoCommit(false);
            prep.executeBatch();
            conn.setAutoCommit(true);
            conn.close();
        } catch (Exception e) {

        }
    }

    private java.sql.Timestamp getFecha() {
        java.sql.Timestamp ts = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        return ts;
    }

    public void test() {
        if(dispo>-1){
        try {
            Class.forName("org.sqlite.JDBC");
            String p = "jdbc:sqlite:sonarbd-" + dispo + ".db";
            Connection conn = DriverManager.getConnection(p);
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery("select * from REGISTRO;");
            System.out.println("---");
            while (rs.next()) {
                System.out.println("1 = " + rs.getInt("id_registro"));
                System.out.println("2 = " + rs.getTimestamp("datetime"));
                System.out.println("2 = " + rs.getFloat("nivel_capturado"));
                System.out.println("3 = " + rs.getInt("id_dispositivo"));
                System.out.println("***");
            }
            System.out.println("---");
            rs.close();
            conn.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BaseDeDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
        }else{
            System.out.println("El dispositivo no está registrado.");
        }
    }

    public void Migrar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net:3306/db_9c7c0e_sonar", "9c7c0e_sonar", "abcde12345");
            Statement stm = con.createStatement();
            ResultSet resultado = stm.executeQuery("SELECT * FROM dispositivo");
            boolean existe_dispositivo = false;
            while (resultado.next()) {
                int id_dispositvo = Integer.parseInt(resultado.getString("id_dispositivo"));
                if (dispo == id_dispositvo) {
                    existe_dispositivo = true;
                    break;
                }
            }
            if (!existe_dispositivo) {
                System.out.println("El dispositivo no existe");
                if(dispo>-1){
                PreparedStatement prep = con.prepareStatement("insert into dispositivo values (?, ?, ?, ?, ?);");
                //Añade el nuevo Dispositivo.
                prep.setInt(1, dispo);
                prep.setString(2, "test");
                prep.setInt(3, 1);
                prep.setFloat(4, 999f);
                prep.setFloat(5, 999f);
                prep.addBatch();
                //COMMIT
                con.setAutoCommit(false);
                prep.executeBatch();
                con.setAutoCommit(true);
                System.out.println("Se agregó el dispositivo: " + dispo);
                }
            } else {
                //aqui hacemos algo si el dispositivo existe
                System.out.println("El dispositivo" + dispo + " existe");
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}

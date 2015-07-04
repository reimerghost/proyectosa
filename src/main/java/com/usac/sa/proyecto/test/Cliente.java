/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.sa.proyecto.test;

import com.usac.sa.proyecto.utils.bddConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Compaq
 */
public class Cliente {

    private String nombre, apellido, dirección, teléfono, usuario, password;

    public Cliente(String u, String p) {
        usuario = u;
        password = p;
    }

    public boolean Login() {
        boolean resp = false;
        Connection dbConnection = null;
        Statement statement = null;

        String updateTableSQL = "select * from emp";

        try {
            dbConnection = bddConnection.getDBConnection();
            statement = dbConnection.createStatement();
            //preparedStatement = dbConnection.prepareStatement(updateTableSQL);

            ResultSet rs = statement.executeQuery(updateTableSQL);

            while (rs.next()) {
                System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));
                resp = true;
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (dbConnection != null) {
                try {
                    dbConnection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return resp;
    }
}

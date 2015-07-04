/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.usac.sa.proyecto;

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

        String updateTableSQL = "select nombre from cliente where usuario='"
                + usuario + "' and password='"
                + password + "'";

        try {
            dbConnection = bddConnection.getDBConnection();
            statement = dbConnection.createStatement();
            //preparedStatement = dbConnection.prepareStatement(updateTableSQL);
            ResultSet rs = statement.executeQuery(updateTableSQL);

            while (rs.next()) {
                System.out.println(rs.getString(1));
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

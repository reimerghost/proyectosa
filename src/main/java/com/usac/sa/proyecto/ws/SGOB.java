/**
 * @autor reimer
 */
package com.usac.sa.proyecto.ws;

import com.usac.sa.proyecto.test.Cliente;
import com.usac.sa.proyecto.test.testTest;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public class SGOB {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "iniciarSesion")
    public boolean IniciarSesion(@WebParam(name = "usuario") String user, @WebParam(name = "password") String pass) {
        //TODO write your implementation code here:
        Cliente c = new Cliente(user, pass);
        return c.Login();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "abrirCuenta")
    public String AbrirCuenta() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "crearCliente")
    public String CrearCliente() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "agregarSaldo")
    public String AgregarSaldo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "mostrarSaldo")
    public String MostrarSaldo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "realizarTransferencia")
    public String realizarTransferencia() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "consultarHistorial")
    public String consultarHistorial() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "mostrarDatosCliente")
    public String mostrarDatosCliente() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "solicitarPrestamo")
    public String solicitarPrestamo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "autorizarPrestamo")
    public String autorizarPrestamo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "rechazarPrestamo")
    public String rechazarPrestamo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "verEstadoPrestamo")
    public String verEstadoPrestamo() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "verCuotasPagadas")
    public String verCuotasPagadas() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "verTotalCuotasPagadas")
    public String verTotalCuotasPagadas() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "verCuotasTotales")
    public String verCuotasTotales() {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "verSaldoRestante")
    public testTest verSaldoRestante() {
        //TODO write your implementation code here:
        testTest tt = new testTest();

        return tt;
    }

    //TESTING ZONE
    @WebMethod(operationName = "sayHello")
    public String sayHello(@WebParam(name = "guestname") String guestname) {

        if (guestname == null) {
            return "Hello";
        }
        return "Hello " + guestname;

    }
}

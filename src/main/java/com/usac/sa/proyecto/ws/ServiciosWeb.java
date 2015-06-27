/**
 * @autor reimer
 */
package com.usac.sa.proyecto.ws;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
 
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public class ServiciosWeb {
 
 
    @WebMethod(operationName = "sayHello")
    public String sayHello(@WebParam(name="guestname") String guestname){
 
        if(guestname==null){
            return "Hello";
        }
        return "Hello "+ guestname;
 
    }
}

<%-- 
    Document   : SetParametrosTemp
    Created on : 24/05/2015, 04:12:11 PM
    Author     : naldoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE HTML>
<html>

<head>
  <title>Registro de parametros</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="style/style.css" title="style" />
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <table  style="width: 100%">
              <tr>
                  <td >
                      <h1><font color="red"> <a href="index.html">Sonar<span class="logo_colour">, S.A.</span></a></font></h1>
                    <h2>Sound Monitor</h2>
                  </td>
                  <td>
                    <img src="style/Logo_Sonar.png" alt="Logo_Sonar" style="width:100px;height:50px">
                  </td>
              </tr>  
          </table>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="index.html">Parametros</a></li>
          <li><a href="Monitor.jsp">Monitor</a></li>
          <li><a href="Graficas.jsp">Graficas</a></li>
          <li><a href="Contactenos.jsp">Contactenos</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      
      <div id="content">
        <!-- insert the page content here -->
        <%
            int Dispositivo = Integer.parseInt(request.getParameter("dispositivo"));
            float Minimo = Float.parseFloat(request.getParameter("minimo"));
            float Maximo = Float.parseFloat(request.getParameter("maximo"));
            java.util.Date currentTime = new java.util.Date();
            Timestamp tStamp = new Timestamp(currentTime.getTime());
            //out.write("<h1>" + tStamp + "</h1>");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net:3306/db_9c7c0e_sonar","9c7c0e_sonar","abcde12345");
                //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sonar","aec2","12345");
                //Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net/db_9c7c0e_sonar","9c7c0e_sonar","abcde12345");
                Statement stm=con.createStatement();
                ResultSet resultado = stm.executeQuery("SELECT * FROM dispositivo");
                boolean existe_dispositivo = false;
                while(resultado.next()){
                    int id_dispositvo = Integer.parseInt(resultado.getString("id_dispositivo"));
                    if ( Dispositivo == id_dispositvo ){
                        existe_dispositivo = true;
                        break;
                    }
                }
                if(!existe_dispositivo){
                    out.write("<h1> El dispositovo no existe </h1>");
                }
                else{
                    //aqui hacemos algo si el dispositivo existe
                    //out.write("El dispositovo existe");
                    int res = stm.executeUpdate("UPDATE dispositivo SET minimo=" + Minimo + ", maximo=" + Maximo + "WHERE id_dispositivo=" + Dispositivo);
                    out.write("<h1> SE CAMBIARON LOS NIVELES PARA EL DISPOSITIVO " + Dispositivo);
                }
            } catch(Exception e) {
                out.write(e.toString());
            }
            
         %>
        
        </div>
    </div>
    <div id="footer">
      Copyright &copy; Sonar, S.A. 
    </div>
  </div>
</body>
</html>


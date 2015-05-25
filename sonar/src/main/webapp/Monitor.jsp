<%-- 
    Document   : Monitor
    Created on : 24/05/2015, 09:57:53 PM
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
          <h1><a href="index.html">Sonar<span class="logo_colour">, S.A.</span></a></h1>
          <h2>Sound Monitor</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="index.html">Parametros</a></li>
          <li><a href="Monitor.jsp">Monitor</a></li>
          <li><a href="page.html">A Page</a></li>
          <li><a href="another_page.html">Another Page</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      
      <div id="content">
        <!-- insert the page content here -->
        <%
            //int Dispositivo = Integer.parseInt(request.getParameter("dispositivo"));
            //float Minimo = Float.parseFloat(request.getParameter("minimo"));
            //float Maximo = Float.parseFloat(request.getParameter("maximo"));
            java.util.Date currentTime = new java.util.Date();
            Timestamp tStamp = new Timestamp(currentTime.getTime());
            //out.write("<h1>" + tStamp + "</h1>");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net/db_9c7c0e_sonar","9c7c0e_sonar","abcde12345");
                Statement stm=con.createStatement();
                ResultSet resultado = stm.executeQuery("SELECT * FROM dispositivo INNER JOIN registro ON dispositivo.id_dispositivo=registro.id_dispositivo");
                boolean existe_dispositivo = false;
                out.write("<table style=\"width:100%\">");
                out.write("<tr>");
                 out.write("<th> Dispositivo ID </th>");
                 out.write("<th> Localizacion </th>");
                 out.write("<th> Activo </th>");
                 out.write("<th> Maximo </th>");
                 out.write("<th> Minimo </th>");
                 out.write("<th> Registro ID </th>");
                 out.write("<th> Fecha y Hora </th>");
                 out.write("<th> Nivel Capturado </th>");
                out.write("</tr>");
                out.write("<br>");
                while(resultado.next()){
                    float nivel_capturado = Float.parseFloat(resultado.getString("nivel_capturado"));
                    float minimo = Float.parseFloat(resultado.getString("minimo"));
                    float maximo = Float.parseFloat(resultado.getString("maximo"));
                    String ColorCelda = "";
                    if (nivel_capturado > maximo)
                    {
                        ColorCelda = "red";
                    }
                    else
                    {
                        ColorCelda = "green";
                    }
                   out.write("<tr>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("id_registro") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("localizacion") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("activo") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("maximo") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("minimo") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("id_registro") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("timestamp") + "</font></td>");
                    out.write("<td> <font color=\"" + ColorCelda + "\">" + resultado.getString("nivel_capturado") + "</font></td>");
                   out.write("</tr>");
                }
                out.write("</table>");
                
                    //aqui hacemos algo si el dispositivo existe
                    //out.write("El dispositovo existe");
                    //int res = stm.executeUpdate("UPDATE dispositivo SET minimo=" + Minimo + ", maximo=" + Maximo + "WHERE id_dispositivo=" + Dispositivo);
                    //out.write("<h1> SE CAMBIARON LOS NIVELES PARA EL DISPOSITIVO " + Dispositivo);
                
            } catch(Exception e) {
                out.write(e.toString());
            }
            
         %>
        
        </div>
    </div>
    <div id="footer">
      Copyright &copy; black_white | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">Free CSS Templates</a>
    </div>
  </div>
</body>
</html>


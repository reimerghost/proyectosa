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
          <h1><a href="index.html">Sonar<span class="logo_colour">, S.A.</span></a></h1>
          <h2>Sound Monitor</h2>
        </div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->
          <li class="selected"><a href="index.html">Home</a></li>
          <li><a href="examples.html">Examples</a></li>
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
            int Dispositivo = Integer.parseInt(request.getParameter("dispositivo"));
            float Minimo = Float.parseFloat(request.getParameter("minimo"));
            float Maximo = Float.parseFloat(request.getParameter("maximo"));
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net:3306/db_9c7c0e_sonar","9c7c0e_sonar","abcde12345");
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
      Copyright &copy; black_white | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">Free CSS Templates</a>
    </div>
  </div>
</body>
</html>


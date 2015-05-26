<%-- 
    Document   : Contactenos
    Created on : 25/05/2015, 11:40:06 PM
    Author     : naldoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE HTML>
<html>

<head>
  <title>Contactenos</title>
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
        <h1> Lo sentimos, este sitio esta bajo construccion. :( </h1>
        </div>
    </div>
    <div id="footer">
      Copyright &copy; Sonar, S.A. 
    </div>
  </div>
</body>
</html>
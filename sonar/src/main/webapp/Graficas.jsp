<%-- 
    Document   : Graficas
    Created on : 25/05/2015, 10:39:37 AM
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
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
          var data = google.visualization.arrayToDataTable([
          ['Hora', 'dB' , 'Fecha'],
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://MYSQL5005.Smarterasp.net/db_9c7c0e_sonar","9c7c0e_sonar","abcde12345");
                Statement stm=con.createStatement();
                ResultSet resultado = stm.executeQuery("SELECT * FROM dispositivo INNER JOIN registro ON dispositivo.id_dispositivo=registro.id_dispositivo");
                
                while(resultado.next()){
                     float NivelCapturado = Float.parseFloat(resultado.getString("nivel_capturado"));
                     String Hora = resultado.getString("timestamp");
                     Timestamp ts = Timestamp.valueOf(Hora);
                     out.write("[" + ts.getSeconds() + ",   " + NivelCapturado +  "   , '" + ts.toString() + " , " + "dB: " + NivelCapturado  + "'" + "],");
                }
            } catch(Exception e) {
                out.write(e.toString());
            }
        %>
        ]);
        data.setColumnProperty(2,'role','tooltip');
        
        var options = {
          title: 'Nivel de ruido Vs Tiempo',
          hAxis: {title: 'Hora', minValue: 0, maxValue: 50},
          vAxis: {title: 'Decibeles', minValue: 0, maxValue: 50},
          legend: 'none'
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
    </script>

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
          <li><a href="Graficas.jsp">Graficas</a></li>
          <li><a href="another_page.html">Another Page</a></li>
          <li><a href="contact.html">Contact Us</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      
      <div id="content">
        <!-- insert the page content here -->
          <div id="chart_div" style="width: 900px; height: 500px;"></div>
      </div>
    </div>
    <div id="footer">
      Copyright &copy; black_white | <a href="http://validator.w3.org/check?uri=referer">HTML5</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.html5webtemplates.co.uk">Free CSS Templates</a>
    </div>
  </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRATION</title>
</head>
<body>
<%@ page import ="java.lang.Exception" %>;
<%@ page import ="java.sql.Connection" %>;
<%@ page import ="java.sql.DriverManager"%>;
<%@ page import ="java.sql.SQLException"%>;
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%

  
 Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","admin");
Statement stmt=con.createStatement();


ResultSet rs1 =stmt.executeQuery("sELECT * FROM(SELECT PRODUCTNAME, plancost,TO_CHAR(TO_DATE(PURCHASEDATE, 'DD-MON-YYYY'), 'YYYY') YEAR  FROM MV12 WHERE PRODUCTNAME='CRICKET')PIVOT(SUM( plancost)FORM  year in ('2012','2013','2014'))"); 

 if(!rs1.next()) {
	 
	 out.println("<h1>records are not found.Please review the data</h1>");
                
            } else {
        %>

        <table style="font-family: Copperplate / Copperplate Gothic Light, sans-serif;
    border-collapse: collapse;
    width: 100%; background-color: #a8e063">
	<caption style ="font-family: Copperplate / Copperplate Gothic Light, sans-serif;">
	 SLICE OPERATION BY PRODUCT</caption>
	
	
	
            <tr>
			
                <th>PRODUCT</th>
                <th>REVENUE_IN_2012</th>
			    <th>REVENUE_IN_2013</th>
				<th>REVENUE_IN_2014</th>
           </tr>
          <% while (rs1.next()) {  %>
           <tr  >
               <td> <%= rs1.getString(1) %> </td>
               <td> <%= rs1.getInt(2)%> </td>
			   <td> <%= rs1.getInt(3)%> </td>
			   <td> <%= rs1.getInt(4)%> </td>
			   
		</tr> 
           <% 
           } 
       %>
       </table><br>
       
       <% 
           } 
       %>
</body>
</html>
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
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","admin" );
Statement stmt=con.createStatement();


ResultSet rs1 =stmt.executeQuery("SELECT * FROM(SELECT  TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'Q')QUARTER, productNAME,plancost FROM mv12 WHERE TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'Q') =1)PIVOT(SUM( plancost) FORM productNAME IN ('VERIZON','CRICKET','H20'))"); 

 if(!rs1.next()) {
	 
	 out.println("<h1>records are not found.Please review the data</h1>");
                
            } else {
        %>

        <table style="font-family: Copperplate / Copperplate Gothic Light, sans-serif;
    border-collapse: collapse;
    width: 100%; background-color: #a8e063">
	<caption style ="font-family: Copperplate / Copperplate Gothic Light, sans-serif;">
	 SLICE OPERATION BY QUARTER</caption>
	
	
	
            <tr>
			
                <th>QUARTER</th>
                <th>VERIZON_REVENUE</th>
			    <th>CRICKET_REVENUE</th>
				<th>H20_REVENUE</th>
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
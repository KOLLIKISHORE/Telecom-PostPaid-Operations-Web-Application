<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRATION</title>
</head>
<body>
<!------Importing required packages----->
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
Statement stmt1=con.createStatement();
 Statement stmt2= con.createStatement();
 
ResultSet rs1 =stmt1.executeQuery("SELECT TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'YYYY') YEAR,  TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'MON') MONTH,PRODUCTNAME,SUM(PLANCOST) REVENUE_IN_$ FROM mv12  group by TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY') ,'YYYY') , TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'MON'),PRODUCTNAME ORDER BY YEAR "); 

ResultSet rs2 =stmt2.executeQuery("SELECT TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY'), 'MON') MONTH ,PRODUCTNAME,SUM(PLANCOST) REVENUE_IN_$ FROM mv12  group by TO_CHAR(TO_DATE(purchasedate, 'DD-MON-YYYY') ,'MON'),PRODUCTNAME  ORDER BY MONTH"); 

 if(!rs1.next()) 
 {
out.println("<h1>records are not found.Please review the data</h1>");
                
} else {
        %>

        <table style="font-family: Copperplate / Copperplate Gothic Light, sans-serif;
    border-collapse: collapse;
    width: 100%; background-color: #a8e063">
	<caption style ="font-family: Copperplate / Copperplate Gothic Light, sans-serif;">
	DRILL DOWN (YEAR  TO MONTH) </caption>
              <tr>
			
                <th>YEAR</th>
                <th>MONTH</th>
				<th>PRODUCT</th>
				<th>REVENUE_IN_DOLLARS</th>
				
			   
           </tr>
          <% while (rs1.next()) {  %>
           <tr  >
               <td> <%= rs1.getString(1) %> </td>
               <td> <%= rs1.getString(2) %> </td>
			   <td> <%= rs1.getString(3)%> </td>
			   <td> <%= rs1.getInt(4)%> </td>
			   
		</tr> 
           <% 
           } 
       %>
       </table><br><br><br>
       
       <% 
           } 
       %>
	   
	   
	<H1> NOW VISUALISING THE DRILL DOWN OPERATION BASED ON ABOVE TABLE</H1 >  
	   
	   <%
	   
	   if(!rs2.next()) {
	   out.println("<h1>records are not found.Please review the data</h1>");}
                 else {
        %>
       <br><br><br>
        <table style="font-family: Copperplate / Copperplate Gothic Light, sans-serif;
    border-collapse: collapse;
    width: 100%; background-color: #a8e063">
	
              <tr>
			
                
                <th>MONTH</th>
				<th>PRODUCTNAME</th>
				<th>REVENUE_IN_DOLLARS</th> 
           </tr>
          <% while (rs2.next()) {  %>
           <tr>
               <td> <%= rs2.getString(1) %> </td>
               
			   <td> <%= rs2.getString(2)%> </td>
			    <td> <%= rs2.getInt(3)%> </td>
			   
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
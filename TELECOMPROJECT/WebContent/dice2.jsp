<%@ page import="java.sql.*" %>
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
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection
("jdbc:oracle:thin:@localhost:1521/xe","system","admin");
Statement stmt=con.createStatement();
ResultSet rs1 =stmt.executeQuery("SELECT TO_CHAR(TO_DATE(PURCHASEDATE, 'DD-MON-YYYY'), 'Q') QUARTER ,PRODUCTNAME, COUNTRY,SUM(PLANCOST) AS REVENUE  FROM MV12 WHERE PRODUCTNAME IN ('VERIZON','H20') AND TO_CHAR(TO_DATE(PURCHASEDATE, 'DD-MON-YYYY'), 'Q') IN ( 1,2,3) AND UPPER(COUNTRY) IN ('AUSTRALIA','UNITED STATES') GROUP BY TO_CHAR(TO_DATE(PURCHASEDATE, 'DD-MON-YYYY'), 'Q'),COUNTRY,PRODUCTNAME ORDER BY  PRODUCTNAME"); 

 if(!rs1.next()) {
	 
	 out.println("<h1>records are not found.Please review the data</h1>");
                
            } else {
        %>

        <table style="font-family: Copperplate / Copperplate Gothic Light, sans-serif;
    border-collapse: collapse;
    width: 100%; background-color: #a8e063">
	<caption style ="font-family: Copperplate / Copperplate Gothic Light, sans-serif;">
	 DICE  OPERATION  ON DIFFERENT QUARTER AND DIFFERENT PRODUCTS AND DIFFERENT COUNTRIES </caption>
	
	
	
            <tr>
			
                <th>QUARTER</th>
                <th>PRODUCT</th>
				<TH>COUNTRY</TH>
			    <th>REVENUE_IN_DOLLARS</th>
				
           </tr>
          <% while (rs1.next()) {  %>
           <tr  >
               <td> <%= rs1.getString(1) %> </td>
			    <td> <%= rs1.getString(2) %> </td>
				<td> <%= rs1.getString(3) %> </td>
				
			   <td> <%=rs1.getInt(4)%> </td>
			   
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
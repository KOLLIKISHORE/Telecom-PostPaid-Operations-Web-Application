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
String operator =request.getParameter("operator");
String planid =request.getParameter("plan");

String username=(String)session.getAttribute("username");

Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","admin");
Statement stmt=con.createStatement();
Statement stmt2=con.createStatement();


ResultSet rs = stmt.executeQuery("select * from product where productname ='" + operator + "' and planid ='" +planid+ "'   ");
  if (rs.next()) {
        
		String productid = rs.getString(1);
		
  stmt2.executeUpdate("insert into order_tab values( SEQ.NEXTVAL,'"+username+"','"+planid+"',SYSDATE,' "+productid+" ','INSERVICE','12-DEC-2016')  ");
   con.commit;
      } else {
        out.println("selected product with planid was not present in repository");
		 response.sendRedirect("customerorder.jsp");
    }    
                 
				 %>
				 
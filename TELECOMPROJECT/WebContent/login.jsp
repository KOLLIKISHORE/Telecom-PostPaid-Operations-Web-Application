<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*"%>
<%
    String username= request.getParameter("username");    
    String password = request.getParameter("password");
  
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","admin");
Statement stmt=con.createStatement();




 ResultSet rs = stmt.executeQuery("select * from customer where username ='" + username + "' and password='" + password + "'");
  if (rs.next()) {
       session.setAttribute("username", username);
        
        response.sendRedirect("newnewcustomerorder.jsp");
    } else {
       out.println("Invalid credentials are entered .Please enter credentials properly <a href='homepage.html'></a>");
    }    
	
	

   
%>
</body>
</html>
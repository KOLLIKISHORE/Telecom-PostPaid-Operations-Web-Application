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

<!-------Fetching the all the values given in the registraion form ------>
<% 
String  firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String password=request.getParameter("PASSWORD");
String cities=request.getParameter("cites");
String  states=request.getParameter("states");
String contries=request.getParameter("Countries");
String emailid=request.getParameter("EMAILID");


try{
	
Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection
("jdbc:oracle:thin:@localhost:1521/xe","system","admin");
Statement stmt=con.createStatement();
stmt.executeUpdate("insert into customer values('"+username+"','"+firstname+"','"+lastname+"','"+password+"','"+ cities+"','"+ states+"','"+ contries+"','"+emailid+"') ");
con.commit;
}

catch(ArithmeticException e){
	
	out.println ("Please provide the valid details ");
}  

catch(ArrayIndexOutOfBoundsException e)
  {
	  out.println ("Please provide the valid details");
	  
  }  
catch (NullPointerException ex)
{
	out.println ("Blank values are not allowed. Please provide the values");
}
catch(NumberFormatException ex){
	
	out.println ("Please enter the valid format label values");
	
}
catch (Exception e)
{
   out.println("USERNAME IS ALREADY TAKEN BY SOMEONE<a href="Register.html">" );
}	

%>
</body>
</html>
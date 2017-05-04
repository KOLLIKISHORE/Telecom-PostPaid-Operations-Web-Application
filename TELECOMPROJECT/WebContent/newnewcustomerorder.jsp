
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>********************* WELCOME************************************* </title>
<style>

ul {
    list-style-type: none;
    
   
    overflow: hidden;
    background-color: #727a17;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

li a:hover {
    background-color:tamato;
}

h1 {
color : #CBE32D;
font-family: Copperplate, "Copperplate Gothic Light", fantasy; }

form {
  background: white;
  width: 45%;
  height: 300px;
  font-family: lato;
  position: relative;
  color: #333;
  border-radius: 20px;
}
form header {
  background: #FF3838;
  padding: 30px 20px;
  color: white;
  font-family: Copperplate, "Copperplate Gothic Light", fantasy;
  
  border-radius: 10px 10px 0 0;
}


label {
    width:180px;
    clear:left;
    text-align:right;
    padding-right:10px;
}

input, label {

    float:left;
	font-family: Copperplate, "Copperplate Gothic Light", fantasy;

	
}

div1  {
    font-family: Copperplate, "Copperplate Gothic Light", fantasy;

}
form button:hover {
  background: tomato;
}


label {
    width:180px;
    clear:left;
    text-align:right;
    padding-right:10px;
}

input, label {
    float:left;
    }
	
	button {
	 
	background-color: #4CAF50;
    border-left: none;
    color: white;
	height:30px;
	width:70px;
    padding-left : 10px;
	text-align: center;
	margin-left: 200px
    font-size: 25px;
    cursor: pointer;
	border-radius :20px
	}
	
	#absolute {
 position: absolute;
left: 40%;

width: 500px; 
}
	
	option{
	font-family: Copperplate, "Copperplate Gothic Light", fantasy;
		color :#ff6a00;
	}
	#operator {
        height: 28px;
    }
	
	#operator2
	{
        height: 28px;
    }
</style>
</head>
<body    style = " background-color:#45B649;"  >

<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*"%>

<% session.setAttribute("username",  session.getAttribute("username") ); %>


<ul>
  <li><a href="VIEWORDERS.jsp">VIEW ORDERS</a></li>
  <li><a href="CANCELORDER.jsp">CANCEL ORDER</a></li>
  <li><a href="HOMEPAGE.html">HOME</a></li>
  <li><a href="HOMEPAGE.html">LOGOUT</a></li>
  
 
</ul>


<h1 align="center" > TELECOM POSTPAID SELLER </h1>

<div style ="display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;">

<form  action="orderentry.jsp" method ="POST">
 <center> <header> ORDER NEW CONNECTION </header></center> <br>
  
  
   
  <label for="TELECOM OPERATOR">TELECOM OPERATOR</label>
  <select name="operator" id="operator"  required>
    <option value ="-1" style="color:lato;" >PLEASE SELECT YOUR PREFERRED NETWORK</option>
    <option value ="AT&amp;T" class ="option1"  name = "AT&T"  >AT&amp;T</option>
    <option value ="CRICKET" class ="option1"  name = "CRICKET"  >CRICKET</option>
	<option value ="H20" class ="option1" name="H20" >H20</option>
	<option value ="VERIZON" class ="option1"  name="VERIZON" >VERIZON</option>
</select> <br> <br> <br>
  
  
  <label for="PLAN">PLAN</label>
  <select name="plan" class="plan" id="operator2" required>
    <option value ="-1" style="color:lato;" >PLEASE CHOOSE YOUR PLAN</option>
    <option value ="101" class ="option1" name="DOMESTIC"  >DOMESTIC</option>
    <option value ="103" class ="option1"  name="INTERNATIONAL" >INTERNATIONAL</option>
	<option value ="102" class ="option1" name="DATAPLAN" >DATAPLAN</option>
</select> <br> <br> <br>
  
  <div id="absolute">

 <button type="submit" style= "text-align:center;"  value="ORDER">ORDER</button>
  
  </div>
</form>

</div>





</body>







                 
          

		
		 
		


</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		Hello 
		<%
		String username = (String)request.getSession().getAttribute("USER");
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
		Statement state = connect.createStatement();
		ResultSet result = state.executeQuery("SELECT * FROM registration WHERE username = '" +  username + "';"  );
		System.out.println(result.next());
		String name = result.getString("first_name");
		String lastName = result.getString("last_name");
		if(lastName != "null")
			name = name + " " + lastName;
		
		out.println(name);
		request.getSession().setAttribute("USER", username);
		%>
	</h1>
	
	<a href="slotBooking.jsp">Search a Slot</a>
	<a href="">My Bookings</a>
</body>
</html>
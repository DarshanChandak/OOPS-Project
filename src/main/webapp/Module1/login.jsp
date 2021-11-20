<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	ResultSet result = state.executeQuery("SELECT * FROM registration WHERE username = '" +  username + "' and password = '" + password + "';"  );
	
	if(result.next()){
		request.getSession().setAttribute( "USER" , username);
		out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module2/userDashboard.jsp\" />");
	}
	else{
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = login.html\" /><body><b>Logged In"
					+ "</b></body></html>");
	}
%>
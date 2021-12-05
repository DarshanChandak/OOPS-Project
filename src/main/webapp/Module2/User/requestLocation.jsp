<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String location = request.getParameter("request");

	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	
	int a = state.executeUpdate("INSERT INTO `requests` (`location`) VALUES ('"+ location +"');");	
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../User/userDashboard.jsp\" />");
	
%>
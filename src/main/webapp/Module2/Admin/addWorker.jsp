<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.*,java.util.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	
	String name = request.getParameter("workerName");
	String username = request.getParameter("workerUsername");
	String password = request.getParameter("workerPassword");
	
	int a = state.executeUpdate("INSERT INTO `workers` (`username`, `password`, `name`)VALUES('" + username + "', '" + password + "', '" + name +"');");
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Admin/adminDashboard.jsp\" />");

%>
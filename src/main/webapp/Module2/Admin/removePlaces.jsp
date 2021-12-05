<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.*,java.util.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	
	String location = request.getParameter("remove_location");
	String date = request.getParameter("remove_date");
	
	int a = state.executeUpdate("DELETE FROM parking_slots WHERE location = '" + location + "' AND date = '" + date +"';");
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Admin/adminDashboard.jsp\" />");

%>
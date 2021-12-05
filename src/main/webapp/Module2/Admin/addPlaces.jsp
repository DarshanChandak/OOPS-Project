<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.*,java.util.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	
	String location = request.getParameter("location");
	String date = request.getParameter("date");
	String rate = request.getParameter("price");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	String slots = request.getParameter("numberSlot");
	
	startTime = startTime.replace(":", "");
	endTime = endTime.replace(":", "");
	
	int a = state.executeUpdate("INSERT INTO `parking_slots` (`location`, `date`, `rate`, `start_time`,`end_time`,`slots`)VALUES('" + location + "', '" + date + "', " + rate + ", '" + startTime + "', '" + endTime + "', " + slots +");");
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Admin/adminDashboard.jsp\" />");

%>
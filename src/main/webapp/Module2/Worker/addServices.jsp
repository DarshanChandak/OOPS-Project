<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	
	String location = request.getParameter("place");
	String startTime = request.getParameter("startt");
	String endTime = request.getParameter("endt");
	String[] services = request.getParameterValues("services");
	
	String username = (String)request.getSession().getAttribute("Worker_Username");
	startTime = startTime.replace(":", "");
	endTime = endTime.replace(":", "");
	
	int carWashing = 0, dryWashing = 0, repairCheck = 0, oilChanging = 0;
	
	for(String service: services)
	{
		if(service.equals("Car Washing"))
			carWashing = 1;
		if(service.equals("Dry Washing"))
			dryWashing = 1;
		if(service.equals("Repair Checks"))
			repairCheck = 1;
		if(service.equals("Oil Changing"))
			oilChanging = 1;
	}
	
	int a = state.executeUpdate("INSERT INTO `services` (`username`,`location`,`start_time`,`end_time`,`car_washing`,`dry_washing`,`repair_check`,`oil_changing`)VALUES('" + username + "', '" + location + "', '" + startTime + "', '" + endTime + "', " + carWashing + ", " + dryWashing + ", " + repairCheck +", " + oilChanging + ");");
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Worker/workerDashboard.jsp\" />");
%>
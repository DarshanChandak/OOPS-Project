<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

	String price = (String)request.getSession().getAttribute("FINALPAY");
	String username = (String)request.getSession().getAttribute("USER"); 
	String location = (String)request.getSession().getAttribute("LOCATION");
	String date = (String)request.getSession().getAttribute("DATE");
	String startTime = (String)request.getSession().getAttribute("START_TIME");
	String endTime = (String)request.getSession().getAttribute("END_TIME");
	System.out.println("testing"+price);

	endTime = endTime.replace(":", "");
	startTime = startTime.replace(":", "");
		
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();

	ResultSet result = state.executeQuery("SELECT * FROM parking_slots WHERE location = '" + location + "' and date = '"+ date + "' and start_time <= " + startTime + " and end_time >= " + endTime + ";");
	
	if(result.next()) {
		
		Statement state1 = connect.createStatement();
		int a = state1.executeUpdate("INSERT INTO `current_booking` (`location_id`, `username`, `price`, `in_time`, `out_time`)VALUES( '" + result.getString("id") + "' , '" + username + "' , '" + price + "' , '" + startTime + "' , '" + endTime + "' );");
		Statement state4 = connect.createStatement();
		int e = state4.executeUpdate("UPDATE users SET wallet = wallet - " + price + " WHERE username = '" + username + "';");
		Statement state6 = connect.createStatement();
		int d = state6.executeUpdate("UPDATE users SET number_booking = number_booking + " + 1 + " WHERE username = '" + username + "';");	
	}
		
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../MyBooking/myBooking.jsp\" />");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

	String bookingId = request.getParameter("parkingId");
	String username = (String)request.getSession().getAttribute("USER"); 

	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();

	ResultSet result = state.executeQuery("SELECT * FROM current_booking WHERE id = " + bookingId + ";");
	
	if(result.next()) {
		
		Statement state1 = connect.createStatement();
		ResultSet wait = state1.executeQuery("SELECT * FROM waitlist WHERE location_id = " + result.getString("location_id") + " LIMIT 1;");
		
		if(wait.next()) {
			Statement state2 = connect.createStatement();
			int a = state2.executeUpdate("INSERT INTO `current_booking` (`location_id`,`username`,`price`,`in_time`,`out_time`)VALUES('" + wait.getString("locationId") + "', '" + wait.getString("username") + "', '" + wait.getString("price") + "', '" + wait.getString("in_time") + "', '" + wait.getString("out_time") + "');");
			Statement state3 = connect.createStatement();
			int b = state3.executeUpdate("UPDATE users SET wallet = wallet - " + wait.getString("price") + " WHERE username = '" + wait.getString("username") + "';");
			Statement state5 = connect.createStatement();
			int c = state5.executeUpdate("DELETE FROM waitlist WHERE id = " + wait.getString("id") + " ;");
			Statement state8 = connect.createStatement();
			int g = state8.executeUpdate("UPDATE users SET number_booking = number_booking + " + 1 + " WHERE username = '" + wait.getString("username") + "';");	
		}
		Statement state4 = connect.createStatement();
		int e = state4.executeUpdate("UPDATE users SET wallet = wallet + " + result.getString("price") + " WHERE username = '" + result.getString("username") + "';");
		Statement state6 = connect.createStatement();
		int d = state6.executeUpdate("DELETE FROM current_booking WHERE id = " + result.getString("id") + " ;");
		Statement state7 = connect.createStatement();
		int f = state7.executeUpdate("UPDATE users SET number_booking = number_booking - " + 1 + " WHERE username = '" + username + "';");	
	}
		
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = myBooking.jsp\" />");
%>
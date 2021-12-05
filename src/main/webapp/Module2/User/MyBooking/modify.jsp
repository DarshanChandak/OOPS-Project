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
		int a = state1.executeUpdate("UPDATE users SET wallet = wallet + " + result.getString("price") + " WHERE username = '" + result.getString("username") + "';");
		Statement state2 = connect.createStatement();
		int b = state2.executeUpdate("DELETE FROM current_booking WHERE id = " + result.getString("id") + " ;");
		
	}
		
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../SlotBooking/slotBooking.jsp\" />");
%>
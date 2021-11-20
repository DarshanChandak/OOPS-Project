<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("pswd");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String address = request.getParameter("address");
	String regNo = request.getParameter("regno");
	String phoneNo = (String)request.getParameter("phoneNo");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state1 = connect.createStatement();
	int a = state1.executeUpdate("INSERT INTO `registration` (`username`, `password`, `first_name`, `last_name`, `address`, `reg_no`, `email`, `phone_no`, `otp`) VALUES ('"+username+"', '"+password+"', '"+firstName+"', '"+lastName+"', '"+address+"', '"+regNo+"', '"+email+"', '"+phoneNo+"', '"+110011+"');");
%>
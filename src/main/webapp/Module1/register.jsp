<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String otp = request.getParameter("otp");
	String username = (String)request.getSession().getAttribute("Resister_Username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	ResultSet result = state.executeQuery("SELECT * FROM registration WHERE username = '" +  username + "' and otp = '" + otp + "';"  );
	
	if(result.next()){
		request.getSession().setAttribute( "USER" , username);
		
		String password = result.getString("password");
		String firstName = result.getString("first_name");
		String lastName = result.getString("last_name");
		String address = result.getString("address");
		String regNo = result.getString("reg_no");
		String phoneNo = result.getString("phone_no");
		String email = result.getString("email");
		
		System.out.println(email);
		Statement state1 = connect.createStatement();
		Statement state2 = connect.createStatement();
		int a = state1.executeUpdate("INSERT INTO `users` (`username`,`password`,`first_name`,`last_name`,`address`,`reg_no`,`email`,`phone_no`,`current_booking`,`number_booking`)VALUES('"+username+"', '"+password+"', '"+firstName+"', '"+lastName+"', '"+address+"', '"+regNo+"', '"+email+"', '"+phoneNo+"', "+0+", "+0+");");
		int b = state2.executeUpdate("DELETE FROM registration WHERE username = '" + username + "';");
		out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module1/login.html\" />");
	}
	else{
		out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module1/otp.html\" />");
	}
%>
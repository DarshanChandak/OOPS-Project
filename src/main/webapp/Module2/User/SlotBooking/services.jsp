<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String p = (String)request.getSession().getAttribute("PRICES");
	int price = Integer.parseInt(p);
	
	request.getSession().setAttribute("SERVICES", "1");
	
	String[] services = request.getParameterValues("services");
	
	for(String service: services)
	{
		if(service.equals("Car Washing"))
			price += 100;
		if(service.equals("Dry Washing"))
			price += 150;
		if(service.equals("Repair Checks"))
			price += 100;
		if(service.equals("Oil Changing"))
			price += 50;
	}
	System.out.println(price);
	p = price + "";
	request.getSession().setAttribute("FINAL_PRICE", p);
	
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = bookingConfirmation.jsp\" />");
%>
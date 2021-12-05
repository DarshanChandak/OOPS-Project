<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String location = request.getParameter("name");
	String date = request.getParameter("endate");
	String startTime = request.getParameter("entime");
	String endTime = request.getParameter("extime");
	
	request.getSession().setAttribute("LOCATION", location);
	request.getSession().setAttribute("DATE", date);
	request.getSession().setAttribute("START_TIME", startTime);
	request.getSession().setAttribute("END_TIME", endTime);
	
	request.getSession().setAttribute("SEARCHED", "1");
	
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = slotBooking.jsp\" />");
%>
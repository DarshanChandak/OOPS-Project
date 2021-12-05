<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.time.*"%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	ResultSet result;
	
	LocalDate date = java.time.LocalDate.now();
	String currentDate = date.toString();
	
	Formatter fmt = new Formatter();
    Calendar cal = Calendar.getInstance();
    fmt = new Formatter();
    
    String currentTime = fmt.format("%tl:%tM", cal, cal).toString(); 
    currentTime = currentTime.replace(":", "");
    
    Statement state1 = connect.createStatement();
	ResultSet current = state1.executeQuery("SELECT * FROM current_booking WHERE out_time < " + currentTime + ";");
	
	Statement state2 = connect.createStatement();
	while(current.next()) {
		
		Statement state3 = connect.createStatement();
		ResultSet dateCheck = state3.executeQuery("SELECT * FROM parking_slots WHERE id = '" + current.getString("location_id") +"' and date < '"+ currentDate + "';");
		int a, b;
		if(dateCheck.next()) {
			a = state2.executeUpdate("INSERT INTO `past_booking`(`location_id`,`username`,`price`,`in_time`,`out_time`,`date`)VALUES('"+ current.getString("location_id") +"', '"+current.getString("username")+"', '"+current.getString("price")+ "', '" + current.getString("in_time") + "', '" + current.getString("out_time") +"', '"+ dateCheck.getString("date") +"');");
			b = state1.executeUpdate("DELETE FROM current_booking WHERE location_id = " + current.getString("location_id") + ";");
		}
	}
	
	if(password.equals("login_via_google")) {
		result = state.executeQuery("SELECT * FROM users WHERE email = '" + username + "';");
		if(result.next()){
			request.getSession().setAttribute( "USER" , result.getString("username"));
			out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module2/User/userDashboard.jsp\" />");
		}
		else{
			out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module1/login.html\" />");
		}
	}
	else {
		result = state.executeQuery("SELECT * FROM admin WHERE username = '" +  username + "' and password = '" + password + "';");
		if(result.next()){
			request.getSession().setAttribute( "ADMIN" , username);
			out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module2/Admin/adminDashboard.jsp\" />");
		}
		else{
			result = state.executeQuery("SELECT * FROM workers WHERE username = '" +  username + "' and password = '" + password + "';"  );
			if(result.next()){
				request.getSession().setAttribute( "Worker_Username" , username);
				out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module2/Worker/workerDashboard.jsp\" />");
			}
			else{
				result = state.executeQuery("SELECT * FROM users WHERE username = '" +  username + "' and password = '" + password + "';"  );
				if(result.next()){
					request.getSession().setAttribute( "USER" , username);
					out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module2/User/userDashboard.jsp\" />");
				}
				else{
					out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module1/login.html\" />");
				}
			}		
		}		
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Park-Ease! - Car Parking Solutions</title>
    <link rel="stylesheet" type="text/css" href="myBooking.css">
</head>
<body>
<section id="table"
    style="
    margin-bottom: 0%;background-image:url('myBooking.jpeg');background-size: 100% 65%;background-repeat: no-repeat;">
    <center >
        <h1
            style="font-size:3.5vw; color:rgb(241,197,14); padding-top: 1vw;font-weight:bold; font-family: Roboto, sans-serif;margin-bottom: 0%;">
            Park<span
                style="font-size:3.5vw; color:white; font-weight:bold; font-family: Roboto, sans-serif;">-Ease!</span>
        </h1>
        <h2
            style="text-decoration:none; color:white; font-size: 2vw; padding-top:1.75vw;font-family: Roboto, sans-serif; ">
            Past-Bookings
        </h2>
        <h3 style="color: rgb(241,197,14);font-family: Roboto, sans-serif;padding-top:1.25vw;">Following are the details
            of your previous
            car-bookings at Park-Ease!
        </h3>
        <br>

    </center>



    <!-- AVAILABLE SLOTS -->

    <div style="background-color:black">
        <div style="background-color:black">
            <h2
                style="text-decoration:none; color:rgb(241,197,14); font-size: 2rem; padding-top: 0;font-family: Roboto, sans-serif; ">
                <br>
                <u>Your Current Bookings:</u>
            </h2>
        </div>
        <br>
        <br>
        <br>
        
        <%
        	String username = (String)request.getSession().getAttribute("USER");
        
        	Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
			Statement state = connect.createStatement();
			ResultSet result = state.executeQuery("SELECT * FROM current_booking WHERE username = '" + username + "';");
			
			while(result.next()){
				Statement state1 = connect.createStatement();
				ResultSet location = state1.executeQuery("SELECT * from parking_slots WHERE id = '" + result.getString("location_id") + "';");
				location.next();
				String inTime = result.getString("in_time");
				String outTime = result.getString("out_time");
				
				inTime = inTime.substring(0, 2) + ":" + inTime.substring(2);
				outTime = outTime.substring(0, 2) + ":" + outTime.substring(2);
				
				out.println("<div class='p'>"
		                +"    <div class='row'>"
		                +"       <div class='column'>"
		                +"          <div class='card' style='color:black'>"
		                +"              <div class='container2'>"
		                +"                  <h4><b>Location and Date</b></h4>"
		                +"                  <p>" + location.getString("location") +" - "+ location.getString("date") +"</p>"
		                +"              </div>"
		                +"          </div>"
		                +"      </div>"
		                +"      <div class='column'>"
		                +"          <div class='card' style='color:black'>"
		                +"              <div class='container2'>"
		                +"                  <h4><b>Check-in and Check-out Time</b></h4>"
		                +"                  <p>"+inTime+ " to "+ outTime+"</p>"
		                +"              </div>"
		                +"          </div>"
		                +"      </div>"
		                +"        <div class='column'>"
		                +"          <div class='card' style='color:black'>"
		                +"              <div class='container2'>"
		                +"                  <h4><b>Price</b></h4>"
		                +"                  <p>"+ result.getString("price") +"</p>"
		                +"              </div>"
		                +"          </div>"
		                +"      </div>"
		                +"      <div class='column3'>"
		                +"			<form action='./modify.jsp' method='post'>"
		                +"			<input type='hidden' id='parkingModifyId' name='parkingId' value='" + result.getString("id") + "'>"				
		                +"          <input type='submit' class='button_press' style='color:black;width:10vw;' value='Modify'>"
		                +"			</form>"
				        +"			<form action='./cancel.jsp' method='post'>"		
				        +"			<input type='hidden' id='parkingCancelId' name='parkingId' value='" + result.getString("id") + "'>"			
		                +"          <input type='submit' class='button_press' style='color:black;width:10vw;' value='Cancel'>"
		                +"			</form>"
		                +"      </div>"
		                +"  </div>"
		                +"</div>"
		                +"<br><br>");
			}
		
        	
        %>
        <br>
        <div style="background-color:black">
            <div style="background-color:black">
                <h2
                    style="text-decoration:none; color:rgb(241,197,14); font-size: 2rem; padding-top: 0;font-family: Roboto, sans-serif; ">

                    <u>Booking History:</u>
                </h2>
            </div>
            <br>
            <br>
            <br>
        <% 
        	ResultSet past = state.executeQuery("SELECT * FROM past_booking WHERE username = '" + username + "';");
		
        	while(past.next()) {
        		
        		Statement state1 = connect.createStatement();
				ResultSet location = state1.executeQuery("SELECT * from parking_slots WHERE id = '" + result.getString("location_id") + "');");
				
				String inTime = result.getString("in_time");
				String outTime = result.getString("out_time");
				
				inTime = inTime.substring(0, 2) + ":" + inTime.substring(2);
				outTime = outTime.substring(0, 2) + ":" + outTime.substring(2);
        		
        		out.println("<div class='p'>"
        				+"<div class='row'>"
        				+"<div class='column'>"
        				+"  <div class='card' style='color:black'>"
        				+"      <div class='container2'>"
        				+"          <h4><b>Location and Date</b></h4>"
        				+"          <p>" + location.getString("location") +" - "+ location.getString("date") +"</p>"
		                +"      </div>"
        				+"  </div>"
        				+"</div>"
        				+"<div class='column'>"
        				+"    <div class='card' style='color:black'>"
        				+"     <div class='container2'>"
        				+"          <h4><b>Check-in and Check-out Time</b></h4>"
        				+"          <p>"+inTime+ " to "+ outTime+"</p>"
		                +"      </div>"
        				+"  </div>"
        				+"</div>"
        				+"<div class='column'>"
        				+"    <div class='card' style='color:black'>"
        				+"        <div class='container2'>"
        				+"            <h4><b>Price</b></h4>"
        				+"            <p>"+ result.getString("price") +"</p>"
		                +"        </div>"
        				+"    </div>"
        				+"</div>"
        				+"</div>"
        				+"</div>"
        				+"<br><br>");
        	}
        %>
            
            </div>
        </div>
</section>
</body>
</html>
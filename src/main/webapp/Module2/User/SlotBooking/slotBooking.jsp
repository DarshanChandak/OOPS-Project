<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- <meta charset="UTF-8"> -->
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
        <link rel="stylesheet" type="text/css" href="slotBooking.css">
        <title>Park-Ease! - Car Parking Solutions</title>
    </head>

    <body>
        <div>
            <section id="table"
                style="margin-bottom: 0%;background-image:url('../assets/bookingBackground.jpg'); background-repeat: no-repeat;background-size: 100% 80%;">
                <center>
                    <h1
                        style="font-size:70px; color:rgb(241,197,14); padding-top: 20px;font-weight:bold; font-family: Roboto, sans-serif;margin-bottom: 0%;">
                        Park<span
                            style="font-size:70px; color:white; font-weight:bold; font-family: Roboto, sans-serif;">-Ease!</span>
                    </h1>
                    <h2
                        style="text-decoration:none; color:white; font-size: 2rem; padding-top: 30px;font-family: Roboto, sans-serif; ">
                        <u>Parking Registration</u>
                    </h2>
                    <h3 style="color: rgb(241,197,14);padding-top: 30px;font-family: Roboto, sans-serif">After filling
                        the
                        details, click on the button "Search" to see the available
                        slots
                    </h3>
                    <br>
                    <form action="./searchSlots.jsp" method="post">
                        <table class="table-border" border="3" width="30%" height="375px"
                            style="color:white;margin-top:10px;margin-left:700px;">
                            <caption
                                style="font-size:20px;color: rgb(241,197,14);padding-top: 15px;padding-bottom: 20px;">
                                <div class="p">
                                    <p id="blink">CHECK AVAILABILITY!</p>
                                </div>
                            </caption>
                            <script type="text/javascript">
                                var blink =
                                    document.getElementById('blink');

                                setInterval(function () {
                                    blink.style.opacity =
                                        (blink.style.opacity == 0 ? 1 : 0);
                                }, 400);
                            </script>
                            <thead>
                                <tr>
                                    <th class="tab-elements">Location</th>
                                    <td class="tab-elements"><input class="fill" type="text" name="name" id="location">
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th class="tab-elements">Entry Date</th>
                                    <td class="tab-elements"><input class="fill" type="date" name="endate" id="endate">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tab-elements">Check-in Time</th>
                                    <td class="tab-elements"><input class="fill" type="time" name="entime" id="entime">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="tab-elements">Check-out Time</th>
                                    <td class="tab-elements"><input class="fill" type="time" name="extime" id="extime">
                                    </td>
                                </tr>
                                <tr id="button">
                                    <td colspan="2" align="center">
                                        <button class="button"><span>SEARCH NOW! </span></button>
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </form>
                </center>

                <!-- AVAILABLE SLOTS -->
                <div style="background-color:black">
                    <h2
                        style="text-decoration:none; color:rgb(241,197,14); font-size: 2rem; padding-top: 0;font-family: Roboto, sans-serif; ">
                        <u>Available Slots:</u>
                    </h2>
                </div>
                
                <%
                
                	String searched = (String)request.getSession().getAttribute("SEARCHED");
                
                	if(searched.equals("1")) {
                		
                		String location = (String)request.getSession().getAttribute("LOCATION");
                		String date = (String)request.getSession().getAttribute("DATE");
                		String startTime = (String)request.getSession().getAttribute("START_TIME");
                		String endTime = (String)request.getSession().getAttribute("END_TIME");
                		
                		request.getSession().setAttribute("LOCATION", location);
                		request.getSession().setAttribute("DATE", date);
                		request.getSession().setAttribute("START_TIME", startTime);
                		request.getSession().setAttribute("END_TIME", endTime);
                		
                		String username = (String)request.getSession().getAttribute("USER");
                		request.getSession().setAttribute("USER", username);
                		request.getSession().setAttribute("SERVICES", "0");
                		
                		startTime = startTime.replace(":", "");
                		endTime = endTime.replace(":", "");
                		
                		String hours = "" + (Integer.parseInt(startTime.substring(0,2)) - Integer.parseInt(startTime.substring(2))) * 60;
                		String min = "" + (Integer.parseInt(endTime.substring(0,2)) - Integer.parseInt(endTime.substring(2)));
                		                		
                		Class.forName("com.mysql.jdbc.Driver");
                		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
                		Statement state = connect.createStatement();
                		ResultSet result = state.executeQuery("SELECT * FROM parking_slots WHERE location = '" + location + "' and date = '"+ date + "' and start_time <= " + startTime + " and end_time >= " + endTime + ";");
                		
                		String services = "<div class='column2' style='color:white;font-size: 20px;'><h4>Services Available</h4>";
                		
                		Statement state1 = connect.createStatement();
                		ResultSet serve = state1.executeQuery("SELECT * FROM services WHERE location = '" + location + "' and start_time >= " + startTime + " and end_time <= " + endTime + ";");
                		
                		int price = 0;
                		
                		Statement state2 = connect.createStatement();
                		                		
                		if(serve.next()) {
                			if(Integer.parseInt(serve.getString("car_washing")) == 1) {
                				services += "<ul>Car Washing</ul>";
                			}
                			if(Integer.parseInt(serve.getString("dry_washing")) == 1)
                				services += "<ul>Dry Washing</ul>";
                			if(Integer.parseInt(serve.getString("repair_check")) == 1)
                				services += "<ul>Repair Check</ul>";
                			if(Integer.parseInt(serve.getString("oil_changing")) == 1)
                				services += "<ul>Oil Changing</ul>";
                		}
                		else {
                			services += "<p>No Services Available</p>";
                		}
                		
                		services += "</div>";
                		int timeCheck = (Integer.parseInt(hours) + Integer.parseInt(min));
                		
                		if(timeCheck <= 0) {
                			out.println("<div style='background-color:black'><center><h3>INVALID TIME ENTERED</h3></center></div>");
                		}     
                		
                		while(result.next() && (timeCheck > 0)) {
                			
                			String option = "";
                			int slotsAvailable = 0;
                			ResultSet availibility = state2.executeQuery("SELECT COUNT(*) FROM current_booking WHERE location_id = '" + result.getString("id") + "' and in_time >= " + startTime + " and out_time <= " + endTime + ";");
                    		if(availibility.next()) {
                    			
                    			slotsAvailable = Integer.parseInt(result.getString("slots")) - Integer.parseInt(availibility.getString(1));
                    			if(slotsAvailable == 0) {
                    				option = "Waitlist";
                    			}
                    			else {
                    				option = "Book Now!";
                    			}
                    				
                    		}
                    		
                			price += (((Integer.parseInt(hours) + Integer.parseInt(min)) * Integer.parseInt(result.getString("rate")))/60);
                			hours = "" +  ((Integer.parseInt(hours) + Integer.parseInt(min))/60);
                			min = "" + ((Integer.parseInt(hours) + Integer.parseInt(min))%60);
                			out.println("<div style='background-color:black'>"
                			+"<form action='./bookingConfirmation.jsp' method='post'>"
                			+"<input type='hidden' id='parkingId' name='parkingId' value='" + result.getString("id") + "'>"
                               +" <div class='p'>"
                               + "<div class='row'>"
								+		"<div class='column'>"
                                +        "<div class='card' style='color:black'>"
                                +           "<div class='container2'>"
                                +                "<h4><b>Location</b></h4>"
                                +                "<p>"+ result.getString("location") +"</p>"
                                +            "</div>"
                                +        "</div>"
                                +    "</div>"
                                +    "<div class='column'>"
                                +        "<div class='card' style='color:black'>"
                                +            "<div class='container2'>"
                                +                "<h4><b>Duration</b></h4>"
                                +                "<p>" + hours + ":" + min + "</p>"
                                +            "</div>"
                                +        "</div>"
                                +    "</div>"
                                +	services
                                +    "<div class='column'>"
                                +        "<div class='card' style='color:black'>"
                                +            "<div class='container2'>"
                                +                "<h4><b>Base Price</b></h4>"
                                +                "<p>" + price + "</p>"
                                +            "</div>"
                                +        "</div>"
                                +    "</div>"
                                +    "<div class='column3'>"
                                +        "<input type='submit' class='button_press' style='color:black' value='"+option+"'>"
                                +    "</div>"
                                +"</div>"
                            +"</div>"
                                   
                            + "</form>"
                        +"</div>"
                        +"<br><br>");	
                		}
                	}
                	
                %>
                
                <hr>
            </section>
        </div>
    </body>
</html>
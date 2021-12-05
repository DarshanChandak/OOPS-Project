<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>

<head>
  <title>Park-Ease! - Car Parking Solutions</title>
  <link rel='stylesheet' type='text/css' href='bookingConfirmation.css'>
  <script>
  	function AddAmount(price) {
  		
  		if(document.getElementById("carWashing").checked == true) {
  			price = price + 100;
  		}
  		if(document.getElementById("dryWashing").checked == true) {
  			price = price + 150;
  		}
  		if(document.getElementById("repairChecks").checked == true) {
  			price = price + 100;
  		}
  		if(document.getElementById("oilChanging").checked == true) {
  			price = price + 50;
  		}
  		
  		return price;
  	}
  </script>
</head>

<body style='
    margin-bottom: 0%;background-image:url("../MyBooking/myBooking.jpeg");background-size: 100% 55%;'>
  <section id='table'>
    <center>
      <h1
        style='font-size:60px; color:rgb(241,197,14); padding-top: 0;font-weight:bold; font-family: Roboto, sans-serif;margin-bottom: 0%;'>
        Park<span style='font-size:60px; color:white; font-weight:bold; font-family: Roboto, sans-serif;'>-Ease!</span>
      </h1>
      <br>

      </h3><br>
      <h3 class='blink_1' style='color: rgb(241,197,14);font-family: Roboto, sans-serif;'> <u>Confirm your bookings
          here!</u>
      </h3>
      <br>

    </center>
    
    </div>
    <center>
    <div style='background-color:black'>
      <div style='background-color:black'>
        <h2
          style='text-decoration:none; color:rgb(241,197,14); font-size: 2rem; padding-top: 0;font-family: Roboto, sans-serif; '>
          <u> Confirm your bookings :</u>
        </h2>
        <br><br>
      </div>
      <% 
      	String location = (String)request.getSession().getAttribute("LOCATION");
		String date = (String)request.getSession().getAttribute("DATE");
		String startTime = (String)request.getSession().getAttribute("START_TIME");
		String endTime = (String)request.getSession().getAttribute("END_TIME");
		String username = (String)request.getSession().getAttribute("USER");
		String ser = (String)request.getSession().getAttribute("SERVICES");
		
      	startTime = startTime.replace(":", "");
		endTime = endTime.replace(":", "");
		
		String hours = "" + (Integer.parseInt(startTime.substring(0,2)) - Integer.parseInt(startTime.substring(2))) * 60;
		String min = "" + (Integer.parseInt(endTime.substring(0,2)) - Integer.parseInt(endTime.substring(2)));
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
		Statement state = connect.createStatement();
		ResultSet result = state.executeQuery("SELECT * FROM parking_slots WHERE location = '" + location + "' and date = '"+ date + "' and start_time <= " + startTime + " and end_time >= " + endTime + ";");
		
		String services = "<form id='serve' action='./services.jsp' method='post'>";
		
		Statement state1 = connect.createStatement();
		ResultSet serve = state1.executeQuery("SELECT * FROM services WHERE location = '" + location + "' and start_time >= " + startTime + " and end_time <= " + endTime + ";");
		
		int price = 0;
		
		Statement state2 = connect.createStatement();
		                		
		if(serve.next()) {
			if(Integer.parseInt(serve.getString("car_washing")) == 1) {
				services = services + "<input type='checkbox' id='carWashing' name='services' value='Car Washing'>"
				        +"<label"
				        +" style='position:relative;top:-5px;font-size:20px; margin:15px;font-family:Arial Bold;color:white; margin-left:2vw; font-size:22px'"
				        +" for='carWashing'> Car Washing</label>";
			}
			if(Integer.parseInt(serve.getString("dry_washing")) == 1) {
				services = services + "<input type='checkbox' id='dryWashing' name='services' value='Dry Washing'>"
				        +"<label"
				         +" style='position:relative;top:-5px;font-size:20px; margin:15px;font-family:Arial Bold;color:white; margin-left:2vw; font-size:22px'"
				         +" for='dryWashing'> Dry Washing</label>";
			}
			if(Integer.parseInt(serve.getString("repair_check")) == 1) {
				services = services + "<input type='checkbox' id='repairChecks' name='services' value='Repair Checks'>"
				        +"<label"
				          +" style='position:relative;top:-5px;font-size:20px; margin:15px;font-family:Arial Bold;color:white; margin-left:2vw; font-size:22px'"
				          +"for='repairChecks'> Repair Checks</label>";
			}
			if(Integer.parseInt(serve.getString("oil_changing")) == 1) {
				services = services + "<input type='checkbox' id='oilChanging' name='services' value='Oil Changing'>"
				        +"<label"
				          +" style='position:relative;top:-5px;font-size:20px;  font-family:Arial Bold;color:white; margin-left:2vw; font-size:22px'"
				         +" for='oilChanging'> Oil Changing</label>";
			}
			services = services + "<input id='service' type='submit' value='Add Service' form='serve' style='width:10vw; margin-left:2vw'>";
		}
		else {
			services += "<p>No Services Available</p>";
		}
		
		services += "</form>";
		
		if(ser.equals("1"))
			services = "";
		
		while(result.next()) {
			
			String option = "";
			int slotsAvailable = 0;
			ResultSet availibility = state2.executeQuery("SELECT COUNT(*) FROM current_booking WHERE location_id = '" + result.getString("id") + "' and in_time >= " + startTime + " and out_time <= " + endTime + ";");
    		if(availibility.next()) {
    			
    			slotsAvailable = Integer.parseInt(result.getString("slots")) - Integer.parseInt(availibility.getString(1));
    			if(slotsAvailable == 0) {
    				option = "<form action='./waitlist.jsp' method='post' id='next'>";
    			}
    			else {
    				option = "<form action='./confirmation.jsp' method='post' id='next'>";
    			}
    				
    		}
    		
    		Statement st = connect.createStatement();
    		ResultSet user = state2.executeQuery("SELECT * FROM users WHERE username = '" + username + "' ;");
    		
			price += (((Integer.parseInt(hours) + Integer.parseInt(min)) * Integer.parseInt(result.getString("rate")))/60);
			hours = "" +  ((Integer.parseInt(hours) + Integer.parseInt(min))/60);
			min = "" + ((Integer.parseInt(hours) + Integer.parseInt(min))%60);
			
			if(user.next()) {
				if(Integer.parseInt(user.getString("number_booking")) >= 5)
					price = (int)(price * 0.9);
			}
			
			request.getSession().setAttribute("PRICES",""+ price);
			String final_price = (String)request.getSession().getAttribute("FINAL_PRICE");
			
			String printPrice = "";
			if(final_price == null)
				printPrice = ""+price;
			else
				printPrice = final_price;
			System.out.println(printPrice);
			request.getSession().setAttribute("FINALPAY",printPrice);
			out.println("<p style='color:white; margin-left:30px; font-size:22px'>"
			        +" Date:&emsp;&emsp;&emsp;&ensp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
			        + date +"</p><br> <br>"
			        +"<p style='color:white; margin-left:30px; font-size:22px'>Location:"
			        +"&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+ location + "</p><br><br>"
			        +"<p style='color:white; margin-left:30px; font-size:22px'>In-time:"
			        +"  &emsp;&emsp;&emsp;&ensp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + (startTime.substring(0, 2) + ":" + startTime.substring(2))
			        +"</p><br><br>"
			        +"<p style='color:white; margin-left:30px; font-size:22px'>"
			        +" Out-time:&emsp;&emsp;&ensp;&ensp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + (endTime.substring(0, 2) + ":" + endTime.substring(2))
			        +"</p><br><br><br>"
			        + services 
			        + "<br><br><br><br>"
			        +"<p class='final' style='color:white; margin-left:30px; font-size:22px'>Payment Amount:"
			        +"  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+ printPrice +" </p><br><br> <br>"
			        +option
			        +"<input type='submit' value='Confirm'>"
			        +"</form>"
			        +"<form action='slotBooking.jsp'>"
			        +"<input type='submit' value='Cancel' form='next'>"
			        +"</form>");	
		}
		
      %>
    </div>
  </center>



  </section>
</body>

</html>

</html>
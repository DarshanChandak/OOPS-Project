<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<% 
	String username = (String)request.getSession().getAttribute("Worker_Username"); 
	request.getSession().setAttribute("Worker_Username", username); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>AutoWash - Car Wash Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="workerDashboard.css" rel="stylesheet">
</head>

<body>
	<!-- Top Bar Start -->
	<div class="top-bar">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-md-12">
					<div class="logo">
						<a href="../../Module1/login.html">
							<h1>
								Park-<span>Ease!</span>
							</h1> <!-- <img src="img/logo.jpg" alt="Logo"> -->
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Worker Service</h2>
				</div>
				<div class="col-12">
					<a href="">Home</a> <a href="">Worker Service</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Service Start -->
	<div class="service">
		<div class="container">
			<div class="section-header text-center">
				<p>What We Do?</p>
				<h2>Washing Services available</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<i class="flaticon-car-wash-1"></i>
						<h3>Car Washing</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<i class="flaticon-car-wash"></i>
						<h3>Dry Cleaning</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<i class="flaticon-vacuum-cleaner"></i>
						<h3>Repair Checks</h3>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="service-item">
						<i class="flaticon-seat"></i>
						<h3>Oil Changing</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->
	<div class="form">
		<form action="addServices.jsp" method="post">
			<p style="font-size: 20px; font-family: Arial Bold">
				<b><label style="font-size: 22px" for="place">Location
						of service:</label></b> <select id="place" name="place">
					<%
              		Class.forName("com.mysql.jdbc.Driver");
            		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
            		Statement state = connect.createStatement();
            		ResultSet result = state.executeQuery("SELECT * FROM parking_slots;");
            		
            		while(result.next()) {
            			out.println("<option value='"+ result.getString("location") +"'>"+ result.getString("location") +"</option>");
            		}
            		
              	%>
					<!--  <option value="Hyderabad">Hyderabad</option>
                <option value="Goa">Goa</option>
                <option value="Pilani">Pilani</option>-->
				</select>
			</p>
			<br>

			<p style="font-size: 20px; font-family: Arial Bold">
				<b style="font-size: 22px; margin-right: 20px;">Select
					availability time: &nbsp; &nbsp;&nbsp; </b> Start time:&nbsp;
				&nbsp;&nbsp; <input type="time" id="startt" name="startt"
					style="margin: 40px; margin-right: 250px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				End time: &nbsp;&nbsp;&nbsp;&nbsp; <input type="time" id="endt"
					name="endt" style="margin: 30px"><br>
				<br>
			</p>
			<h5>Services provided:</h5>
			<input type="checkbox" id="service1" name="services"
				value="Car Washing"> <label
				style="position: relative; top: -5px; font-size: 20px; margin: 15px; font-family: Arial Bold"
				for="service1">Car Washing</label> <input type="checkbox"
				id="service2" name="services" value="Dry Washing"> <label
				style="position: relative; top: -5px; font-size: 20px; margin: 15px; font-family: Arial Bold"
				for="service2">Dry Washing</label> <input type="checkbox"
				id="service3" name="services" value="Repair Checks"> <label
				style="position: relative; top: -5px; font-size: 20px; margin: 15px; font-family: Arial Bold"
				for="service3">Repair Checks</label> <input type="checkbox"
				id="service4" name="services" value="Oil Changing"> <label
				style="position: relative; top: -5px; font-size: 20px; margin: 15px; font-family: Arial Bold"
				for="service4">Oil Changing</label> <input type="submit"
				value="Submit">
		</form>
	</div>
	<!-- Page Header End -->

	<!-- Pre Loader -->
	<div id="loader" class="show">
		<div class="loader"></div>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

	<!-- Template Javascript -->
	<script src="../dashboard.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String username = (String)request.getSession().getAttribute("USER"); 
	request.getSession().setAttribute("USER", username); 
	request.getSession().setAttribute("SEARCHED", "0");
%>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="userDashboard.css" type="text/css">

    <title>
        Park-Ease! - Car Parking Solutions
    </title>
</head>

<body>
    <!--Entry section-->
    <nav>
        <header id="header">
            <a href="#" class="logo">

            </a>

            <ul class="nav-links">
                
                <li><a href="#div2" class="active">Services</a></li>
                <li><a href="#footer" class="active">Contact</a></li>
                <li><a href="../../Module1/login.html" class="active">Sign-out</a></li>
            </ul>
        </header>
    </nav>

    <section>
        <h1 style="font-size:90px; color:rgb(241, 197, 14); font-weight:bold; font-family: Roboto, sans-serif;"
            class="main-title">Park<span
                style="font-size:90px; color:white; font-weight:bold; font-family: Roboto, sans-serif;">-Ease!</span>
        </h1>

        <h3 style="text-align:center" class="main-title">Car Parking Made Easy!</h3>

        <img src="assets\UserDash1.jpg" id="foreground">

    </section>
    <div class="top">
        <h1 class="footer-title2" style="text-align:center;color:white;font-weight:700;font-family: Roboto, sans-serif;">
            Save time by pre
            booking your slot online!</h1>
    </div>


    <!--Services-->
    <section id="div2">
        <div class="pre1">
            <div class="text1" id="text1">
                <h1 style="font-size:3.75rem;font-family: Roboto, sans-serif;"> <u
                        style="text-decoration-color:rgb(241, 197, 14)">KEY SERVICES</u></h1>
            </div>

            <h3 style="text-align:center;color:white;font-weight:700;font-family: Roboto, sans-serif;">
                Park-Ease came up with an idea to book <br> the parking slots beforehand while travelling to your
                harbor!
            </h3>
        </div>

        <div>
            <div class="container1">
                <div id="slotBooking">
                    <div class="circle">
                        <img src="assets/CarLogo.png" class="symbol"><br>

                        <a href="SlotBooking/slotBooking.jsp" style="color: rgb(241, 197, 14); text-decoration: none;"><button
                                class="button1" style="font-family: Roboto,sans-serif;">Book your Slot</button></a>
                    </div>

                </div>

                <div id="pastBooking">
                    <div class="circle">
                        <img src="assets/CalendarLogo.png" class="symbol"><br>
                        <a href="MyBooking/myBooking.jsp" style="color: rgb(241, 197, 14); text-decoration: none;">
                        <button class="button1" style="font-family: Roboto,sans-serif;">My Bookings</button></a>
                    </div>

                </div>

                <div id="contactUs">
                    <div class="circle">
                        <img src="assets/contactUsLogo.png" class="symbol"><br>
                        <a href="../About_Us/AboutUs.html" style="color: rgb(241, 197, 14); text-decoration: none;">
                        <button class="button1" style="font-family: Roboto,sans-serif;">About Us</button></a>
                    </div>

                </div>
            </div>
        </div>

    </section>
    
    <div class="top">
        <h1 class="footer-title" style="text-align:left;color:white;font-weight:700;font-family: Roboto, sans-serif;">
            <b>
                <font style="color:black">WALLET</font>
            </b>
        </h1>
        <form action="./addMoney.jsp" method="post">
            <div>
                <label for="amount">Enter Amount:</label>
                <input id="amount" name="amount" type="text" placeholder="" required>
                <input type="submit" name="money_submit" value="Add Amount">
            </div>
        </form>
        <div class="vl"></div>
        <h1 class="footer-title" style="text-align:right;color:white;font-weight:550;font-family: Roboto, sans-serif;margin-top: 50px;">
            <b>
                <font style="color:black;font-size: 45px;">REQUEST LOCATION</font>
            </b>
        </h1>
        <form action="./requestLocation.jsp">
            <div>
                <label for="request">Enter Location:</label>
                <input id="request" name="request" type="text" placeholder="" required>
                <input type="submit" name="loc_submit" value="Request">

            </div>
        </form>
    </div>

    <!-- Testimonial Start -->
    <section id="testimonial" style="background-color: rgb(27, 26, 26);">
        <div class="section-header text-center">
            <h1 style="font-size:3.7rem;color:white;font-weight:600;font-family: Roboto, sans-serif;">
                <u>Testimonials</u>
            </h1>
            <h2 style="color:rgb(241,197,14);font-weight:600;font-family: Roboto, sans-serif; margin-bottom: 70px;">
                What our clients say about us:
            </h2>
        </div>

        <div class="block_container" style="background-color: black;"></div>
        <marquee loop="infinite" behavior="scroll" direction="left" scrollamount=" 9">

            <div class="testimonial-item"
                style="background-color:rgba(128, 128, 128, 0.459);float: left;width: 320px;padding: 50px">
                <!-- <img src="C:\Users\Darshan Chandak\OneDrive\Pictures\ROG.jpg" alt="Image"> -->
                <div class="testimonial-text">
                    <h3>Ansh Gupta</h3>
                    <h4>Doctor</h4>
                    <p>
                        One of the best services<br>
                        available in recent times to be<br>
                        carefree about my vehicle's <br>
                        parking and safety assurance.
                    </p>
                </div>
            </div>

            <div class="testimonial-item" style="background-color:grey;float: left;width: 320px;padding: 50px">
                <!-- <img src="C:\Users\anupa\OneDrive\Desktop\self img.jfif" alt="Image"> -->
                <div class="testimonial-text">
                    <h3>Ishaan Srivastava</h3>
                    <h4>Businessman</h4>
                    <p>
                        Couldn't thank more <br>
                        for these amazing and <br>
                        user-friendly services <br>
                        provided by Park-Ease!
                    </p>
                </div>
            </div>

            <div class="testimonial-item"
                style="background-color:rgba(128, 128, 128, 0.459);float: left;width: 320px;padding: 50px">
                <!-- <img src="C:\Users\anupa\OneDrive\Desktop\self img.jfif" alt="Image"> -->
                <div class="testimonial-text">
                    <h3>Uday Singh Thakur</h3>
                    <h4>Gamer</h4>
                    <p>
                        One of the best services<br>
                        available in recent times to be<br>
                        carefree about my vehicle's <br>
                        parking and safety assurance.
                    </p>
                </div>
            </div>
            <div class="testimonial-item" style="background-color:grey;float: left;width: 320px;padding: 50px">
                <!-- <img src="C:\Users\anupa\OneDrive\Desktop\self img.jfif" alt="Image"> -->
                <div class="testimonial-text">
                    <h3>Abhinav Tyagi</h3>
                    <h4>Model</h4>
                    <p>
                        Couldn't thank more <br>
                        for these amazing and <br>
                        user-friendly services <br>
                        provided by Park-Ease!
                    </p>
                </div>
            </div>

        </marquee>
        </div>
    </section>
    <div class="top">
        <h1 class="footer-title" style="text-align:left;color:white;font-weight:700;font-family: Roboto, sans-serif;">
            Get exciting discounts and offers whenever you park with Park-Ease!</h1>
    </div>
    <!-- footer section-->
    <section id="footer">
        <div class="row">
            <div class="column">
                <h2 class="heads" style="text-align:left;font-family: Roboto, sans-serif;"><a href="#"><i
                            class="fas fa-map-marker-alt" style="color:rgb(241, 197, 14)"></i></a>Park-Ease!</h2><br>
                <p class="p">We got you covered when it comes to parking!</p>
            </div>

            <div class="column" style="text-align: right">
                <h2 class="heads" style="text-align:right;font-family: Roboto, sans-serif;">Contact Info</h2>
                <p class="p" style="text-align:right; color:rgb(241, 197, 14);font-family: Roboto, sans-serif;">
                    Corporate Office Address:</p>
                <h5 style="text-align:right;font-family: Roboto, sans-serif;"><a href="https://goo.gl/maps/4oE5fY4Pc7zKpECo6"><i
                            class="fas fa-map-marker-alt" style="color:rgb(241, 197, 14)"></i></a>BITS Pilani Hyderabad Campus</h5>
                <p class="p" style="text-align:right; color:rgb(241, 197, 14);font-family: Roboto, sans-serif;">Customer
                    Service</p>
                <h5 style="text-align:right;font-family: Roboto, sans-serif;"><a href=""><i class="fas fa-phone-alt"
                            style="color:rgb(241, 197, 14)"></i></a>+91 9876543210</h5>
            </div>
            <div class="column">
                <div class="Contact">
                </div>
            </div>
        </div>
    </section>

</body>

</html>
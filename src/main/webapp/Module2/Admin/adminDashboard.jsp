<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="adminDashboard.css" rel="stylesheet">
    </head>

    <body>
        <!-- Top Bar Start -->
        <div class="top-bar">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 col-md-12">
                        <div class="logo">
                            <a href="../../Module1/login.html">
                                <h1>Park-<span>Ease!</span></h1>
                                <!-- <img src="img/logo.jpg" alt="Logo"> -->
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
                        <h2>Admin Service</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Admin Service</a>
                    </div>
                </div>
            </div>
        </div>
        <center>
            <div class="col-lg-10 py-10 bg-light my-3" style="width:100%">
                <div class="row inform-cards">
                    <div class="col-sm-6 col-md-4 col-lg p-4">

                        <div class="card text-white my-2 rounded">
                            <div class="row">
                                <div class="col">
                                    <h2 id="add_places" class="heading text-white">&nbsp Add Places </h2>
                                </div>
                            </div>
                            <br>
                            <form class="form" action="./addPlaces.jsp" method="post">
                                <div class="info">
                                    <span class="first">
                                        <b> Location : </b>
                                    </span>
                                    <input class="fname" input type="text" step="any" name="location"
                                        style="margin-left:115px; width:180px; height:25px "><br><br>
                                    <span class="second">
                                        <b> Date : </b>
                                    </span>
                                    <input class="fname" type="date" name="date"
                                        style="margin-left:142px; padding-right:20px"><br><br>
                                    <span class="first">
                                        <b>Price : </b>
                                    </span>
                                    <input class="fname" input type="number" step="any" name="price"
                                        style="margin-left:140px"><br><br>
                                    <span class="first">
                                        <b>Time Slot : </b>
                                    </span>
                                    <input type="time" id="startTime" name="startTime"
                                        style="margin-left:110px; margin-right:50px">
                                    to&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="time" id="endTime"
                                        name="endTime" style="margin:30px"><br> <br>
                                    <span class="last">
                                        <b> Number of Slots : </b>
                                    </span>
                                    <input id="number_slot" type="number" name="numberSlot" required
                                        style="margin-left:64px">
                                </div>
                                <br>

                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row inform-cards">
                    <div class="col-sm-6 col-md-4 col-lg p-4">
                        <div class="card text-white my-2 rounded">
                            <div class="row">
                                <div class="col">
                                    <h2 id="remove_places" class="heading text-white">&nbsp Remove Places</h2>
                                </div>
                            </div>
                            <br>
                            <form class="form" action="./removePlaces.jsp" method="post">
                                <div class="info">
                                    <span class="first">
                                        <b> Location : </b>
                                    </span>
                                    <input class="fname" input type="text" name="remove_location"
                                        style="margin-left:115px; width:180px; height:25px "><br><br>
                                    <span class="second">
                                        <b> Date : </b>
                                    </span>
                                    <input class="fname" type="date" name="remove_date"
                                        style="margin-left:142px; padding-right:20px"><br><br>
                                </div>
                                <br>
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>


                <div class="row inform-cards">
                    <div class="col-sm-6 col-md-4 col-lg p-4">
                        <div class="card text-white my-2 rounded">
                            <div class="row">
                                <div class="col">
                                    <h2 id="add_workers" class="heading text-white">&nbsp Add Workers</h2>
                                </div>
                            </div>
                            <br>
                            <form class="form" action="./addWorker.jsp" method="post">
                                <div class="info">
                                    <span class="first">
                                        &nbsp;&nbsp; <b> Full Name : </b>&nbsp;&nbsp;&nbsp;
                                    </span>
                                    <input class="box fname" type="text"
                                        style="width:195px; height:25px; margin-left:115px" name="workerName"
                                        required><br><br>
                                    <span class="last">
                                        <b> Worker Username : </b>
                                    </span>
                                    <input class="fname" style="margin-left:115px; width:195px; height:25px "
                                        type="text" name="workerUsername" required>
                                    <span class="last"><br><br>
                                        <b> Worker Password : </b>
                                    </span>
                                    <input class="fname" style="margin-left:115px; width:195px; height:25px "
                                        type="password" name="workerPassword" required>
                                </div>
                                <br>
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row inform-cards">
                    <div class="col-sm-6 col-md-4 col-lg p-4">
                        <div class="card text-white my-2 rounded">
                            <div class="row">
                                <div class="col">
                                    <h2 id="remove_workers" class="heading text-white">&nbsp Remove Workers</h2>
                                </div>
                            </div>
                            <br>
                            <form class="form" action="./removeWorker.jsp" method="post">
                                <div class="title"></div>
                                <div class="info">
                                    <span class="first">
                                        <b> Worker Username : </b>
                                    </span>
                                    <input class="fname" style="margin-left:115px; width:180px; height:25px "
                                        type="text" name="workerRemove" required>
                                </div>
                                <br>
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                </div>
        </center>
        </div>

        <!-- Pre Loader -->
        <div id="loader" class="show">
            <div class="loader"></div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

        <!-- Template Javascript -->
        <script src="../dashboard.js"></script>
    </body>

    </html>
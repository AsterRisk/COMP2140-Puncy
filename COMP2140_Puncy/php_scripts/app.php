<?php
    include 'header.php';
    
  $sql = "select * from users where user_id = 1;";
  $conn->prepare($sql);
  $puncy_data = $conn->query($sql)->fetch_assoc();
  $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
  $conn->prepare($sql);
  $user_data = $conn->query($sql)->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Appointment</title>
 <link rel="stylesheet" href="app.css">
    <link href="../templates/home_page/css/bootstrap.css" rel="stylesheet" type="text/css"/>

<!-- Font awesome 5 -->
<link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

<!-- custom style -->
<link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
 <script scr="app.js"></script>
</head>
    <body>
        <nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
<div class="container">
    <ul class="navbar-nav d-none d-md-flex mr-auto">
		<li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>
		<li class="nav-item"><a class="nav-link" href="place_order.php">Make a new Order!</a></li>
        <li class="nav-item"><a class="nav-link" href="app.php">Set an Appointment</a></li>
        <li class="nav-item"><a class="nav-link" href="view_order_hist.php?user_id=<?php echo $_SESSION['id']; ?>">View my order history!</a></li>
    </ul>
    <ul class="navbar-nav">
		<li  class="nav-item"><a href="#" class="nav-link"> Call: <?php echo $puncy_data['tele_num']?> </a></li>
	</ul> <!-- list-inline //  -->
  </div> <!-- navbar-collapse .// -->
 <!-- container //  -->
</nav> <!-- header-top-light.// -->

<section class="header-main border-bottom">
	<div class="container">
<div class="row align-items-center">
	<div class="col-lg-2 col-6">
		<a href="http://bootstrap-ecommerce.com" class="brand-wrap">
			<img class="logo" src="../templates/assets/logo.png">
		</a> <!-- brand-wrap.// -->
	</div>
	<div class="col-lg-6 col-12 col-sm-12" style="opacity:0%;">
		<form action="#" class="search" >
			<div class="input-group w-100">
			    <input type="text" class="form-control" placeholder="Search">
			    <div class="input-group-append">
			      <button class="btn btn-primary" type="submit">
			        <i class="fa fa-search"></i>
			      </button>
			    </div>
		    </div>
		</form> <!-- search-wrap .end// -->
	</div> <!-- col.// -->
	<div class="col-lg-4 col-sm-6 col-12">
		<div class="widgets-wrap float-md-right">
			<div class="widget-header icontext">
				<a href="#" ><img style = "height:64px;width:64px;border-radius:50%;margin:6px;" src = "../templates/assets/blank-profile.jpeg"></a>
				<div class="text">
					<span class="text-muted">Welcome, <?php echo ucwords(strtolower($user_data['first_name'])); ?>!</span>
					<div> 
						<a href="logout.php">Sign Out</a> 
					</div>
				</div>
			</div>
		</div> <!-- widgets-wrap.// -->
	</div> <!-- col.// -->
</div> <!-- row.// -->
	</div> <!-- container.// -->
</section> <!-- header-main .// -->
</header> <!-- section-header.// -->
        <form method="post" action="set-app.php" style="margin:40px;">
            <fieldset>
            <legend>Appointment Form</legend>
          <!--  <label for="fname">First Name</label><br /> 
            <input name="fname" type="text" placeholder="First Name" required /> <br /> 
            <label for="lname">Lastname</label><br /> 
            <input name="lname" type="text" placeholder="Lastname" required /> <br />
            <label for="tele">Contact Number</label><br /> 
            <input name="tele_num" type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
            required /> <br />
            <small>Format: 123-456-7890</small> <br/> -->
            <label for="app_date">Appointment Date</label><br /> 
            <input name="appdate" type="date" required /> <br />
            <label for="app_time">Appointment Time</label><br /> 
            <input name="apptime" type="time" required min="09:00" max="18:00" /> <br />
            <small>Select a time between 9am to 6pm</small> <br/>




            <button type="button" onclick="window.location.replace('home.php')" >Cancel</button>
            <button type="submit" value="Submit">Submit</button>
            </fieldset>
        </form>

    </body>
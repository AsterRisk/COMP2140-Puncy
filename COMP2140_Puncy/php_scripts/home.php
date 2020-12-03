<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="max-age=604800" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<?php include 'header.php'?>
<title>Website title - bootstrap html template</title>

<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">

    
<!-- slideshow -->
<link rel = "stylesheet" href = "../templates/home_page/css/slideshow.css">
<script src = "../templates/home_page//js/slideshow.js"></script>
<!-- jQuery -->
<script src="https://bootstrap-ecommerce.com/bootstrap-ecommerce-html/js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="https://bootstrap-ecommerce.com/bootstrap-ecommerce-html/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="../templates/home_page/css/bootstrap.css" rel="stylesheet" type="text/css"/>

<!-- Font awesome 5 -->
<link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">

<!-- custom style -->
<link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />

<!-- custom javascript -->
<script src="../templates/home_page/js/script.js" type="text/javascript"></script>

<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
	// jQuery code

}); 
// jquery end
</script>

</head>
<body>
<?php
  $sql = "select * from users where user_id = 1;";
  $conn->prepare($sql);
  $puncy_data = $conn->query($sql)->fetch_assoc();
  $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
  $conn->prepare($sql);
  $user_data = $conn->query($sql)->fetch_assoc();
?>

<header class="section-header">

<nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
<div class="container">
    <ul class="navbar-nav d-none d-md-flex mr-auto">
		<li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>
		<li class="nav-item"><a class="nav-link" href="place_order.php">Make a new Order!</a></li>
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
	<div class="col-lg-6 col-12 col-sm-12">
		<form action="#" class="search">
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


<nav class="navbar navbar-main navbar-expand-lg navbar-light border-bottom" hidden>
  <div class="container">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-controls="main_nav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="main_nav">
      <ul class="navbar-nav">
      	<li class="nav-item dropdown">
          <a class="nav-link pl-0" data-toggle="dropdown" href="#"><strong> <i class="fa fa-bars"></i> &nbsp  All category</strong></a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Foods and Drink</a>
            <a class="dropdown-item" href="#">Home interior</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Category 1</a>
            <a class="dropdown-item" href="#">Category 2</a>
            <a class="dropdown-item" href="#">Category 3</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Fashion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Supermarket</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Electronics</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Baby &amp Toys</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Fitness sport</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Clothing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Furnitures</a>
        </li>
      </ul>
    </div> <!-- collapse .// -->
  </div> <!-- container .// -->
</nav>

</header> <!-- section-header.// -->



<!-- ========================= SECTION INTRO ========================= -->
<section class="section-intro padding-y-sm">
<div class="container">

<div class="intro-banner-wrap">
	<!-- Slideshow container -->
        <div class="slideshow-container" hidden>

          <!-- Full-width images with number and caption text -->
          <div class="mySlides fade">
            <div class="numbertext">1 / 5</div>
            <img src="../templates/assets/slideshow_1.jpg" style="width:100%">
            
          </div>

          <div class="mySlides fade">
            <div class="numbertext">2 / 5</div>
            <img src="../templates/assets/slideshow_2.jpg" style="width:100%">
            
          </div>

          <div class="mySlides fade">
            <div class="numbertext">3 / 5</div>
            <img src="../templates/assets/slideshow_3.jpg" style="width:100%">
            
          </div>
            
          <div class="mySlides fade">
            <div class="numbertext">4 / 5</div>
            <img src="../templates/assets/slideshow_4.jpg" style="width:100%">
          </div>
            
          <div class="mySlides fade">
            <div class="numbertext">5 / 5</div>
            <img src="../templates/assets/slideshow_5.jpg" style="width:100%">
            
          </div>

          <!-- Next and previous buttons -->
          <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
          <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <br>

        <!-- The dots/circles -->
        <div style="text-align:center" hidden>
          <span class="dot" onclick="currentSlide(1)"></span>
          <span class="dot" onclick="currentSlide(2)"></span>
          <span class="dot" onclick="currentSlide(3)"></span>
          <span class="dot" onclick="currentSlide(4)"></span>
          <span class="dot" onclick="currentSlide(5)"></span>
        </div>
</div>

</div> <!-- container //  -->
</section>
<!-- ========================= SECTION INTRO END// ========================= -->


<!-- ========================= SECTION FEATURE ========================= -->
<section class="section-content padding-y-sm">
<div class="container" hidden>
<article class="card card-body">


<div class="row">
	<div class="col-md-4">	
		<figure class="item-feature">
			<span class="text-primary"><i class="fa fa-2x fa-truck"></i></span>
			<figcaption class="pt-3">
				<h5 class="title">Fast delivery</h5>
				<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				tempor incididunt ut labore </p>
			</figcaption>
		</figure> <!-- iconbox // -->
	</div><!-- col // -->
	<div class="col-md-4">
		<figure  class="item-feature">
			<span class="text-primary"><i class="fa fa-2x fa-landmark"></i></span>	
			<figcaption class="pt-3">
				<h5 class="title">Creative Strategy</h5>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				 </p>
			</figcaption>
		</figure> <!-- iconbox // -->
	</div><!-- col // -->
    <div class="col-md-4">
		<figure  class="item-feature">
			<span class="text-primary"><i class="fa fa-2x fa-lock"></i></span>
			<figcaption class="pt-3">
				<h5 class="title">High secured </h5>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
				 </p>
			</figcaption>
		</figure> <!-- iconbox // -->
	</div> <!-- col // -->
</div>
</article>

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION FEATURE END// ========================= -->


<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content">
<div class="container">

<header class="section-heading">
	<h3 class="section-title">Popular orders</h3>
</header><!-- sect-heading -->

	
<div class="row">
	<div class="col-md-3">
		<div href="#" class="card card-product-grid">
			<a href="#" class="img-wrap"> <img src="images/items/1.jpg"> </a>
			<figcaption class="info-wrap">
				<a href="#" class="title">Just another product name</a>
				
				<div class="rating-wrap">
					<ul class="rating-stars">
						<li style="width:80%" class="stars-active"> 
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
						</li>
						<li>
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
						</li>
					</ul>
					
				</div>
				<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
			</figcaption>
		</div>
	</div> <!-- col.// -->
	<div class="col-md-3">
		<div href="#" class="card card-product-grid">
			<a href="#" class="img-wrap"> <img src="images/items/2.jpg"> </a>
			<figcaption class="info-wrap">
				<a href="#" class="title">Some item name here</a>
				
				<div class="rating-wrap">
					<ul class="rating-stars">
						<li style="width:80%" class="stars-active"> 
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
						</li>
						<li>
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
						</li>
					</ul>
					
				</div>
				<div class="price mt-1">$280.00</div> <!-- price-wrap.// -->
			</figcaption>
		</div>
	</div> <!-- col.// -->
	<div class="col-md-3">
		<div href="#" class="card card-product-grid">
			<a href="#" class="img-wrap"> <img src="images/items/3.jpg"> </a>
			<figcaption class="info-wrap">
				<a href="#" class="title">Great product name here</a>
				
				<div class="rating-wrap">
					<ul class="rating-stars">
						<li style="width:80%" class="stars-active"> 
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
						</li>
						<li>
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
						</li>
					</ul>
					
				</div>
				<div class="price mt-1">$56.00</div> <!-- price-wrap.// -->
			</figcaption>
		</div>
	</div> <!-- col.// -->
	<div class="col-md-3">
		<div href="#" class="card card-product-grid">
			<a href="#" class="img-wrap"> <img src="images/items/4.jpg"> </a>
			<figcaption class="info-wrap">
				<a href="#" class="title">Just another product name</a>
				
				<div class="rating-wrap">
					<ul class="rating-stars">
						<li style="width:80%" class="stars-active"> 
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
						</li>
						<li>
							<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> 
						</li>
					</ul>
					
				</div>
				<div class="price mt-1">$179.00</div> <!-- price-wrap.// -->
			</figcaption>
		</div>
	</div> <!-- col.// -->
</div> <!-- row.// -->

</div> <!-- container .//  -->
</section>
<!-- ========================= SECTION CONTENT END// ========================= -->



<!-- ========================= SECTION CONTENT ========================= -->
<section class="section-content">
<div class="container">

<!-- ========================= FOOTER ========================= -->
<footer class="section-footer border-top bg">
	<div class="container">
		<section class="footer-top  padding-y">
			<div class="row">
				<aside class="col-md col-6">
					<h6 class="title">Brands</h6>
					<ul class="list-unstyled">
						<li> <a href="#">Adidas</a></li>
						<li> <a href="#">Puma</a></li>
						<li> <a href="#">Reebok</a></li>
						<li> <a href="#">Nike</a></li>
					</ul>
				</aside>
				<aside class="col-md col-6">
					<h6 class="title">Company</h6>
					<ul class="list-unstyled">
						<li> <a href="#">About us</a></li>
						<li> <a href="#">Career</a></li>
						<li> <a href="#">Find a store</a></li>
						<li> <a href="#">Rules and terms</a></li>
						<li> <a href="#">Sitemap</a></li>
					</ul>
				</aside>
				<aside class="col-md col-6">
					<h6 class="title">Help</h6>
					<ul class="list-unstyled">
						<li> <a href="#">Contact us</a></li>
						<li> <a href="#">Money refund</a></li>
						<li> <a href="#">Order status</a></li>
						<li> <a href="#">Shipping info</a></li>
						<li> <a href="#">Open dispute</a></li>
					</ul>
				</aside>
				<aside class="col-md col-6">
					<h6 class="title">Account</h6>
					<ul class="list-unstyled">
						<li> <a href="#"> User Login </a></li>
						<li> <a href="#"> User register </a></li>
						<li> <a href="#"> Account Setting </a></li>
						<li> <a href="#"> My Orders </a></li>
					</ul>
				</aside>
				<aside class="col-md">
					<h6 class="title">Social</h6>
					<ul class="list-unstyled">
						<li><a href="#"> <i class="fab fa-facebook"></i> Facebook </a></li>
						<li><a href="#"> <i class="fab fa-twitter"></i> Twitter </a></li>
						<li><a href="#"> <i class="fab fa-instagram"></i> Instagram </a></li>
						<li><a href="#"> <i class="fab fa-youtube"></i> Youtube </a></li>
					</ul>
				</aside>
			</div> <!-- row.// -->
		</section>	<!-- footer-top.// -->

		<section class="footer-bottom row">
			<div class="col-md-2">
				<p class="text-muted"> &copy 2019 Company name </p>
			</div>
			<div class="col-md-8 text-md-center">
				<span  class="px-2">info@pixsellz.io</span>
				<span  class="px-2">+879-332-9375</span>
				<span  class="px-2">Street name 123, Avanue abc</span>
			</div>
			<div class="col-md-2 text-md-right text-muted">
				<i class="fab fa-lg fa-cc-visa"></i>
				<i class="fab fa-lg fa-cc-paypal"></i>
				<i class="fab fa-lg fa-cc-mastercard"></i>
			</div>
		</section>
	</div><!-- //container -->
</footer>
<!-- ========================= FOOTER END // ========================= -->


</body>
</html>
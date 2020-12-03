<?php

require ("header.php");
//A boolean to check if the name of the submit button is submit, also if method is post


    $order_id = $_GET['order_id'];
    $sql = "select * from orders where order_id = " . $order_id . ";";
    $conn->prepare($sql);
    $order_data = $conn->query($sql)->fetch_assoc();
    $sql = "select * from users where user_id = " . $order_data['user_id'] . ";";
    $user_data = $conn->query($sql)->fetch_assoc();
    /*$jobtype= " SELECT type from job_presets where preset_id = $job_type_id";
    $order= " SELECT order_id from order where order_id= $orderid";
    $user="SELECT order_id from order where user_id= $custid";*/
    $date_comp = date("Y/m/d"); 
?>
<?php
  $sql = "select * from users where user_id = 1;";
  $conn->prepare($sql);
  $puncy_data = $conn->query($sql)->fetch_assoc();
  $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
  $conn->prepare($sql);
  $user_data = $conn->query($sql)->fetch_assoc();
  $sql = "select count(bill_id)+1 from bills;";
    $conn->prepare($sql);
  $bill_id = $conn->query($sql)->fetch_assoc()['count(bill_id)+1'];
?>
    
<DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bill Generation</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../templates/home_page/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
        <link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
        <link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
</head>
    

<body>
    <header class="section-header">

            <nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
            <div class="container">
                <ul class="navbar-nav d-none d-md-flex mr-auto">
                    <?php
                        if($_SESSION['id'] = 1)
                        {
                            ?>
                            <li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>
                            <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="view_apps.php">View Appointments</a></li>
                            <li class="nav-item"><a class="nav-link" href="sales.php">View Sales</a></li>
                            <li class="nav-item"><a class="nav-link" href="view_order_hist.php?user_id=<?php echo $_SESSION['id']; ?>">View all orders!</a></li>
                    <?php
                        }
                        else
                        {
                            ?>
                            <li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>
                            <li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="place_order.php">Make a new Order!</a></li>
                            <li class="nav-item"><a class="nav-link" href="view_order_hist.php?user_id=<?php echo $_SESSION['id']; ?>">View my order history!</a></li>
                    <?php
                        }
                    ?>
                    
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
                <div class="col-lg-6 col-12 col-sm-12" style="opacity:0%">
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
            </header>
    <div class="invoice-box" >
        <table cellpadding="0" cellspacing="0" style ="margin-left:40px;">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                
                            </td>
                            
                            <td>
                                Invoice #: <?php echo $bill_id; ?><br>
                                Created: <?php echo $date_comp; ?><br>
                                Due: <?php echo $order_data['due_date']; ?>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="opacity:0%"><td>This is a dummy row</td></tr>
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                Puncy's Clothing Store Ltd.<br>
                                6 Definitely A Real Address Road<br>
                                Jamaica
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="heading">
                <td>
                    Item: 
                </td>
                <td>
                    Price
                </td>
                <br> 
            </tr>
            
            <tr class="item">
                
                <td>
                    <?php echo $order_data['type']; ?>
                </td>
                
                
                <td>
                    <?php echo "$".$order_data['est_cost'].".00"; 
                        $total = $order_data['est_cost'] + 500;
                    ?>
                </td>
            </tr>
            
            <tr class="item">
                
                <td>
                    Labour Cost
                </td>
                
                
                <td>
                    $500.00
                </td>
            </tr>
            <tr class="item">
                
                <td>
                    GCT
                </td>
                
                
                <td>
                    <?php
                        $gct = $total*0.165;
                        echo "$".$gct."0";
                    ?>
                </td>
            </tr>
            <br>
            <hr>
            <tr style="opacity:0%"><td>This is a dummy row</td></tr>
            <tr><td><hr></td></tr>
            <tr class="total">
                <td></td>
                
                <td>
                   <b>SubTotal: </b><?php echo "$".($total+$gct).""; ?>
                </td>
            </tr>
        </table>
    </div>
    <?php 
        $sql = "select measurement_id from measurements where type = " . $order_data['type'] .";";
        $conn->prepare($sql);
        
        $sql = "insert into bills (bill_id, user_id, order_id, job_type, fabric_cost, labour_cost, total_cost, date_completed) values (" . $bill_id .", ". $user_data['user_id'].", ". $_GET['order_id'].", '". $order_data['type']."', 0, 500,". ($total+$gct).",'" . $date_comp ."');"; 
        $conn->prepare($sql);
        $conn->query($sql);
       
    ?>
</body>
    </html>



 
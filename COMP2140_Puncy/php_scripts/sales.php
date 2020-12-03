<?php
echo "<link rel='stylesheet' type='text/css' href='../templates/assets/sales/sales.css' />";

include('header.php');

$salesQuery= "SELECT * FROM bills ORDER BY bills.date_completed;";
$conn->prepare($salesQuery);
$results = $conn->query($salesQuery);

/*foreach($result as $row){
    echo $row['date_completed'];
} */
 
?>
<?php
      $sql = "select * from users where user_id = 1;";
      $conn->prepare($sql);
      $puncy_data = $conn->query($sql)->fetch_assoc();
      $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
      $conn->prepare($sql);
      $user_data = $conn->query($sql)->fetch_assoc();
    ?>
<html>
    <head>
        <meta charset="utf-8">
    <title>Sales Report</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../templates/home_page/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
        <link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
        <link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
        <style>
            table{
                border: solid;
                margin-left:40px;
            }
            td{
                border: solid;
            }
            th{
                border:solid;
            }
        </style>
    </head>
    <body>
        <header class="section-header">

            <nav class="navbar navbar-dark navbar-expand p-0 bg-primary">
            <div class="container">
                <ul class="navbar-nav d-none d-md-flex mr-auto">
                    <?php
                        if($_SESSION['id'] == 1)
                        {
                            
                            echo '<li class="nav-item"><a class="nav-link" href="logout.php">Logout</a></li>';
                            echo '<li class="nav-item"><a class="nav-link" href="home.php">Home</a></li>';
                            echo '<li class="nav-item"><a class="nav-link" href="view_apps.php">View Appointments</a></li>';
                            echo '<li class="nav-item"><a class="nav-link" href="sales.php">View Sales</a></li>';
                            echo '<li class="nav-item"><a class="nav-link" href="view_order_hist.php?user_id=<?php echo $_SESSION[\'id\']; ?>">View all orders!</a></li>';
                        }
                        else
                        {
                            header("Location: home.php");
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
        <caption>Sales Report</caption>
<table>

    <tr><th>Date</th><th>First Name</th><th>Last Name</th><th>Clothing Type</th><th>Total Sale</th></tr>
<?php

foreach($results as $result)
{
    $sql = "select * from orders where order_id = " . $result['order_id'] .";";
    
    $conn->prepare($sql);
    $order_data = $conn->query($sql)->fetch_assoc();
    $row = "<tr><td>".$result['date_completed']."</td><td>".$order_data['first_name']."</td><td>".$order_data['last_name']."</td><td>".$order_data['type']."</td>"."<td>$".$result['total_cost'].".00</td></tr>";
    echo $row;
}

?>
</table>
    </body>
</html>




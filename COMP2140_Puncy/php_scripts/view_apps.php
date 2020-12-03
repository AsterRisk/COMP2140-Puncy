<?php
    include 'header.php';
?>

<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../templates/home_page/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
        <link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
        <link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
        <style>
            .popup-overlay {
              /*Hides pop-up when there is no "active" class*/
              visibility: hidden;
              position: absolute;
              background: #ffffff;
              border: 3px solid #666666;
              width: 50%;
              height: 50%;
              left: 25%;
            }

            .popup-overlay.active {
              /*displays pop-up when "active" class is present*/
              visibility: visible;
              text-align: center;
            }

            .popup-content {
              /*Hides pop-up content when there is no "active" class */
              visibility: hidden;
            }

            .popup-content.active {
              /*Shows pop-up content when "active" class is present */
              visibility: visible;
            }

            button {
              display: inline-block;
              vertical-align: middle;
              border-radius: 30px;
              margin: .20rem;
              font-size: 1rem;
              color: #666666;
              background: #ffffff;
              border: 1px solid #666666;
            }

            button:hover {
              border: 1px solid #666666;
              background: #666666;
              color: #ffffff;
            }
        </style>
    </head>
    <?php
      $sql = "select * from users where user_id = 1;";
      $conn->prepare($sql);
      $puncy_data = $conn->query($sql)->fetch_assoc();
      $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
      $conn->prepare($sql);
      $user_data = $conn->query($sql)->fetch_assoc();
    ?>
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
        <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#" role="tab" aria-controls="nav-home" aria-selected="true">Appointments</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Date</th>
                                            <th>Time</th>
                                        </tr>
                                    </thead>
                                    <!--<tbody>
                                        <tr>
                                            <td><a href="#">Work 1</a></td>
                                            <td>Doe</td>
                                            <td>john@example.com</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">Work 2</a></td>
                                            <td>Moe</td>
                                            <td>mary@example.com</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">Work 3</a></td>
                                            <td>Dooley</td>
                                            <td>july@example.com</td>
                                        </tr>
                                    </tbody>-->
                                    <?php
                                        $sql = "select * from appointments;";
                                        
                                        $conn->prepare($sql);
                                        $apps = $conn->query($sql);
                                        foreach ($apps as $app)
                                        {
                                            $sql = "select * from users where user_id = " . $app['user_id'] . ";";
                                            $conn->prepare($sql);
                                            $user = $conn->query($sql)->fetch_assoc();
                                            ?>
                                            <tbody>
                                                <tr>
                                                    
                                                    <td><?php echo $user['first_name']; ?></td>
                                                    <td><?php echo $user['last_name']; ?></td>
                                                    <td><?php echo $app['app_date']; ?></td>
                                                    <td><?php echo $app['app_time']; ?></td>
                                                    
                                                    <!-- View an order's details -->
                                                </tr>
                                            </tbody>
                                            <?php
                                        }
                                    ?>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
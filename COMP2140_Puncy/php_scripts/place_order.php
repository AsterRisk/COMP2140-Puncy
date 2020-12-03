<!DOCTYPE html>
<?php
    include 'header.php';
?>
<html>
    <head>
        <!--TEMPLATE FROM: https://mdbootstrap.com/snippets/jquery/pjoter-2-0/747937 -->
        <title>Order Form</title>
        <link rel = "stylesheet" href = "../templates/order_form/css/styles.css"/>
        <srcipt src = "jquery-3.2.1.min.js"></srcipt>
        <script src = "../templates/order_form/js/script.js"></script>
        <!-- -->
        <!-- Datepicker JS and CSS provided by https://jqueryui.com/datepicker/-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <link href="../templates/home_page/css/ui.css" rel="stylesheet" type="text/css"/>
        <link href="../templates/home_page/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- -->
        <!-- change the form based on selections -->
        <script>
            $(document).ready(function()
            {
                    $( "#datepicker" ).datepicker();
                    $("#new-measurements").change(function()
                        {
                            if(this.checked == true)
                            {
                                $('#existing-measures').hide();
                                $('#new-measures').show();
                                $('#set-meas-name').attr("required", true);
                            }
                            else
                            {
                                $('#existing-measures').show();
                                $('#new-measures').hide();
                                $('#set-meas-name').attr("required", false);
                            }

                        }
                    );
                    
            });
        </script>
        <script>
            $(document).ready(function()
            {
                    $("#job-type").change(function()
                        {
                            var val = parseInt($(this).children("option:selected").val());
                            if((val >=  12) && (val <= 16))
                            {
                                
                                $('#pants').show().siblings().hide();
                                $('#pants').children().children().attr("required", true);
                                $('#pants').siblings().children().children().attr("required", false);
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                                $('#set-meas-name').attr("required", true);
                            }
                            if((val >=  22) && (val <= 26))
                            {
                                $('#blouses').show().siblings().hide();
                                $('#blouses').children().children().attr("required", true);
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                                $('#blouses').siblings().children().children().attr("required", false);
                                $('#set-meas-name').attr("required", true);
                            }
                            if((val >=  2) && (val <= 6))
                            {
                                $('#shirts').show().siblings().hide();
                                $('#shirts').children().children().attr("required", true);
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                                $('#shirts').siblings().children().children().attr("required", false);
                                $('#set-meas-name').attr("required", true);
                            }
                            if((val >=  17) && (val <= 21))
                            {
                                $('#skirts').show().siblings().hide();
                                $('#skirts').children().children().attr("required", true);
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                                $('#skirts').siblings().children().children().attr("required", false);
                                $('#set-meas-name').attr("required", true);
                            }
                            if((val >=  7) && (val <= 11))
                            {
                                $('#shorts').show().siblings().hide();
                                $('#shorts').children().children().attr("required", true);
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                                $('#shorts').siblings().children().children().attr("required", false);
                                $('#set-meas-name').attr("required", true);
                            }
                            if(val == 0)
                            {
                                $('#undecided').show().siblings().hide();
                                $('#set-meas-name').show();
                                $('#appt-needed').show();
                            }
                            var type = ($(this).children("option:selected").attr('name'));
                            console.log(type);
                            $('#job_type').attr("value", type);
                        }
                    );
            });
        </script>
        <!-- -->
        
    </head>
    <body>
        <?php
            $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
            $conn->prepare($sql);
            $user_data = $conn->query($sql)->fetch_assoc();
            if($_GET)
            {
                $sql = "select * from orders where order_id = " . $_GET['temp'] . ";";
                $conn->prepare($sql);
                $template = $conn->query($sql)->fetch_assoc();
            }
            
        ?>
        <div style = "background-color:#3167eb;width=100%">
            <div class="col-lg-4 col-sm-6 col-12" >
                <div class="widgets-wrap float-md-right">
                    <div class="widget-header icontext">
                        <a href="#" ><img style = "height:64px;width:64px;border-radius:50%;margin:6px;" src = "../templates/assets/blank-profile.jpeg"></a>
                        <div class="text" style = "float: right !important">
                            <span class="text-muted" style = "color:#fff">Welcome, <?php echo ucwords(strtolower($user_data['first_name'])); ?>!</span>
                            <div> 
                                <a href="logout.php" style = "color:#ededed">Sign Out</a> 
                            </div>
                        </div>
                    </div>
                </div> <!-- widgets-wrap.// -->
            </div>
        </div>
            
        <form id = "order-form" method = "POST" action = "order.php" class="order-form my-4 mx-4 body">
            
                <div class="container pt-4">

                  <div class="row">
                    <div class="col-12">
                      <span>Place a Custom Job Order</span>
                        <br>
                        <hr class = "mt-1">
                      <span><i>*Note, jobs with less than 10 days before their due date incur extra charge.</i></span>
                      <hr class="mt-1">
                    </div>
                    <div class="col-12">

                      <div class="row mx-4">
                        <div class="col-12 mb-2">
                          <label class="order-form-label">Name</label>
                        </div>
                        <div class="col-12 col-sm-6">
                        <?php
                            if($_GET)
                            {
                                if($template)
                                {
                                    $input = '<input class="order-form-input" name = "fname" value="'.ucfirst(strtolower($template['first_name'])).'" required = "required"/>';
                                }
                                else
                                {
                                    $input = '<input class="order-form-input" name = "fname" value="'.ucfirst(strtolower($user_data['first_name'])).'" required = "required"/>';
                                }
                            }
                            else
                            {
                                $input = '<input class="order-form-input" name = "fname" value="'.ucfirst(strtolower($user_data['first_name'])).'" required = "required"/>';
                            }
                            
                            echo $input;
                        ?>

                        </div>
                        <div class="col-12 col-sm-6 mt-2 mt-sm-0">
                          <?php
                            if($_GET)
                            {
                                if($template)
                                {
                                    $input = '<input class="order-form-input" name = "lname" value="'.ucfirst(strtolower($template['last_name'])).'" required/>';

                                }
                                else
                                {
                                    $input = '<input class="order-form-input" name = "lname" value="'.ucfirst(strtolower($user_data['last_name'])).'" required/>';
                                }
                            }
                            else
                            {
                                $input = '<input class="order-form-input" name = "lname" value="'.ucfirst(strtolower($user_data['last_name'])).'" required/>';
                            }   

                            echo $input;
                          ?>
                        </div>
                      </div>

                      <div class="row mt-3 mx-4">
                        <div class="col-12">
                          <label class="order-form-label">Type of garment you want to order</label>
                        </div>
                        <div class="col-12">
                          <select id = "job-type" name = "job-type" class = "order-form-input">
                            <option value = '0'>------------</option>
                            <?php
                              $sql = "select preset_id, type from job_presets where preset_id > 1 order by preset_id ASC;";
                              $conn->prepare($sql);
                              $jobs = $conn->query($sql);
                              foreach($jobs as $job)
                              {
                                  if($_GET)
                                  {
                                      if($template)
                                      {
                                          if($template['type'] == $job['type'])
                                          {
                                              $option = "<option value = ".$job['preset_id']." name = ".$job['type']." selected = 'selected'>" .$job['type']. "</option>";
                                          }
                                          else
                                          {
                                              $option = "<option value = ".$job['preset_id']." name = ".$job['type'].">" .$job['type']. "</option>";
                                          }
                                      }
                                  }
                                  else
                                  {
                                      $option = "<option value = ".$job['preset_id']." name = ".$job['type'].">" .$job['type']. "</option>";
                                  }
                                  
                                  
                                  echo $option;
                              }
                              
                            ?>
                          </select>
                          <input id = "job_type" name = "job_type" type = "text" value = "blank" hidden/>
                        </div>
                      </div>

                      <div class="row mt-3 mx-4">
                        <div class="col-12">
                          <label class="order-form-label">Measurement Preset:</label>
                        </div>
                        <div class="row mt-3 mx-4">
                            <div class="col-12">
                              <div class="form-check">
                                <?php
                                    if($_GET)
                                    {
                                        if($template['measurements_id'] == 1)
                                        {
                                    
                                    
                                        ?>
                                        <input type="checkbox" class="form-check-input" name="new-measurements" id="new-measurements" checked value = 1>
                                <?php
                                    }
                                    else
                                    {
                                        ?>
                                        <input type="checkbox" class="form-check-input" name="new-measurements" id="new-measurements" value = 1>
                                  <?php
                                    }
                                    }
                                    else
                                    {
                                        ?>
                                        <input type="checkbox" class="form-check-input" name="new-measurements" id="new-measurements" value = 1>
                                <?php
                                    }
                                ?>
                                
                                <label for="validation" class="form-check-label">Use new Measurements?</label>
                              </div>
                            </div>
                        </div>
                        <div class="col-12" id = "existing-measures" hidden>
                          <select id = "preset_measurements" name = "measurement_id" class="order-form-input" placeholder=" ">
                          <option value = '0'>Default Measurements</option>
                          <?php
                              $sql = "select measurement_id, name from measurements where user_id = ".$_SESSION['id']." order by name ASC;";
                              $conn->prepare($sql);
                              $measurements = $conn->query($sql);
                              foreach($measurements as $measure)
                              {
                                  if($template)
                                  {
                                      if($template['measurement_id'] == $measure['measurements_id'])
                                      {
                                          $option = "<option value = '".$measure['measurements_id']."' selected = 'selected'>" .$measure['name']. "</option>";
                                      }
                                      else
                                      {
                                          $option = "<option value = '".$measure['measurements_id']."'>" .$measure['name']. "</option>";
                                      }
                                  }
                                  
                                  echo $option;
                              }
                              
                            ?>
                            </select>
                        </div>
                        <div class = "col-12" id = "new-measures">
                            <div id = "set-meas-name">
                                <div class="col-12 col-sm-6">
                                    <?php
                                        if($_GET)
                                        {
                                            if($template)
                                            {
                                                $sql = "select * from measurements where measurement_id = " . $template['measurements_id'] . ";";
                                                $conn->prepare($sql);
                                                $measurement = $conn->query($sql)->fetch_assoc();
                                                ?>
                                                <input class="order-form-input" name = "meas-name" id = "meas-name" value = "<?php echo $measurement['name']; ?>"/>
                                        <?php
                                            }
                                            else
                                            {
                                                ?>
                                                <input class="order-form-input" name = "meas-name" id = "meas-name" placeholder = "What would you like to save this preset as?"/>
                                        <?php
                                            }
                                    
                                        }
                                        else
                                        {
                                            ?>
                                            <input class="order-form-input" name = "meas-name" id = "meas-name" placeholder = "What would you like to save this preset as?"/>
                                    <?php
                                        }
                                      ?>  
                                    
                                </div>
                            </div>
                            <div id = "undecided">
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" value = "Please pick a job category."readonly/>
                                </div>
                            </div>
                            <div id = "shirts" hidden>
                                <div class = "col-12">
                                    <span>Shirts:</span>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Length</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_length"/>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Waist</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_waist"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Hip</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_hip"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Armhole</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_armhole"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bust</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_bust"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Sleeve</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_sleeve"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bicep</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_bicep"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Neck</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_neck"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Shoulder</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_shoulder"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Across Back</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_across-back"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bust Point</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "s_bust-point"/>
                                </div>

                            </div>
                            <div id = "shorts" hidden>
                                <span>Shorts:</span>
                                <div class="col-12">
                                  <label class="order-form-label">Length</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sh_length"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Waist</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sh_waist"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Hip</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sh_hip" />
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Around Leg</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sh_round-leg" />
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Around Knee</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sh_round-knee" />
                                </div>
                            </div>
                            <div id = "skirts" hidden>
                                <span>Skirts:</span>
                                <div class="col-12">
                                  <label class="order-form-label">Length</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sk_length"/>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Waist</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sk_waist"/>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Hip</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "sk_hip"/>
                                </div>
                            </div>
                            <div id = "blouses" hidden>
                                <span>Blouses:</span>
                                <div class = "col-12">
                                    <span>Shirts:</span>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Length</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_length"/>
                                </div>

                                <div class="col-12">
                                  <label class="order-form-label">Waist</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_waist"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Hip</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_hip"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Armhole</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_armhole"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bust</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_bust"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Sleeve</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_sleeve"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bicep</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_bicep"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Neck</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_neck"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Shoulder</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_shoulder"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Across Back</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_across-back"/>
                                </div>


                                <div class="col-12">
                                  <label class="order-form-label">Bust Point</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "b_bust-point"/>
                                </div>
                            </div>
                            <div id = "pants" hidden>
                                <span>Pants:</span>
                                <div class="col-12">
                                  <label class="order-form-label">Length</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_length"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Waist</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_waist"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Hip</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_hip"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Ankle</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_ankle"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Round Leg</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_round-leg"/>
                                </div>
                                <div class="col-12">
                                  <label class="order-form-label">Round Knee</label>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input class="order-form-input" name = "p_round-knee"/>
                                </div>
                            </div>
                            <div class="row mt-3 mx-4">
                            <div class="col-12">
                              <div class="form-check">
                                <input type="checkbox" class="form-check-input" name="appt-needed" id="appt-needed" checked value = 1>
                                <label for="validation" class="form-check-label">Do you need an appointment to find out your measurements?</label>
                              </div>
                            </div>
                        </div>
                        </div>
                      </div>

                      <div class="row mt-3 mx-4">
                        <div class="col-12">
                          <label class="order-form-label" for="date-picker-example">Date</label>
                        </div>
                        <div class="col-12">
                          <input class="order-form-input datepicker" placeholder="" type="text" id="datepicker" name = "due-date">
                        </div>
                      </div>

                      <div class="row mt-3 mx-4">
                        <div class="col-12">
                          <label class="order-form-label">Address</label>
                        </div>
                        <div class="col-12">
                          <?php
                            if($_GET)
                            {
                                if($template)
                                {
                                    if ($template['delivery_address'])
                                    {
                                        $input = '<input class="order-form-input" name = "addr" value = "'.$template['delivery_address'].'">';
                                    }
                                    else
                                    {
                                        $input = '<input class="order-form-input" name = "addr" value = "'.$user_data['home_address'].'">';
                                    }
                                }
                            }
                            else
                            {
                                $input = '<input class="order-form-input" name = "addr" value = "'.$user_data['home_address'].'">';
                            }
                            
                            
                            
                            echo $input;
                          ?>
                        </div>
                      </div>
                        
                      <div class="row mt-3 mx-4">
                        <div class="col-12">
                          <label class="order-form-label">Contact Number</label>
                        </div>
                        <div class="col-12">
                          <?php
                            if($_GET)
                            {
                                if($template)
                                {
                                    if ($template['delivery_address'])
                                    {
                                        $input = '<input class="order-form-input" name = "addr" value = "'.$template['contact_num'].'">';
                                    }
                                    else
                                    {
                                        $input = '<input class="order-form-input" name = "addr" value = "'.$user_data['tele_num'].'">';
                                    }
                                }
                            }
                            else
                            {
                                $input = '<input class="order-form-input" name = "addr" value = "'.$user_data['tele_num'].'">';
                            }
                            
                            echo $input;
                          ?>
                        </div>
                      </div>
                        <div class="row mt-3 mx-4">
                            <div class="col-12">
                              <div class="form-check">
                                <input type="checkbox" class="form-check-input" name="bringing-fabric" id="bringing-fabric" checked value = 1>
                                <label for="validation" class="form-check-label">Are you providing the fabric?</label>
                              </div>
                            </div>
                        </div>

                        <br>
                        <hr>
                      <div class="row mt-3">
                        <div class="col-12">
                          <input type="submit" id="btnSubmit" value= "Submit!" class="btn"/>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
          
        </form>
    </body>
</html>
  

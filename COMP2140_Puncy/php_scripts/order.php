
<!DOCTYPE html>
<?php
	include 'header.php';    

	$fname = htmlspecialchars($_POST['fname']);
	$lname = htmlspecialchars($_POST['lname']);
	$type = ($_POST['job-type']);
	$new = (isset($_POST['new-measurements']) && ($_POST['new-measurements']== 1));
    $due_date = $_POST['due-date'];
    $date_m = explode("/", $due_date);
    $due_date = $date_m[2] . "/" . $date_m[0] . "/" .$date_m[1];
    $address = $_POST['addr'];
    $phone = $_POST['phone'];
    $date_placed = date("Y/m/d");
    $job_type = $_POST['job_type'];
    $appt_needed = (isset($_POST['appt-needed']) && ($_POST['appt-needed']== 1));
    $sql = "select garment_price from job_presets where type = '" . $job_type . "';";
    $conn->prepare($sql);
    echo $sql;
    $base_price = $conn->query($sql)->fetch_assoc()['garment_price'];
    $bring_fab = (isset($_POST['bringing-fabric']) && ($_POST['bringing-fabric']== 1));
    if($bring_fab)
    {
        $est_cost = $base_price;

    }
    else
    {
        $est_cost = $base_price + 5000;
    }
    if ($new)
    {
        $measurement_name = $_POST['meas-name'];
        $sql = "select count from measurements";
        if(($type >= 1) && ($type <= 5))
        {
        //shirts
            $length      = $_POST['s_length'];
            $waist       = $_POST['s_waist'];
            $hip         = $_POST['s_hip'];
            $armhole     = $_POST['s_armhole'];
            $bust        = $_POST['s_bust'];
            $sleeve      = $_POST['s_sleeve'];
            $bicep       = $_POST['s_bicep'];
            $neck        = $_POST['s_neck'];
            $shoulder    = $_POST['s_shoulder'];
            $across_back = $_POST['s_across-back'];
            $bust_pt     = $_POST['s_bust-point'];
            $sql = "insert into measurements (user_id, job_type, name, leng, waist, hip, armhole, bust, sleeve, bicep, neck, shoulder, across_back, bust_point) values (".$_SESSION['id'] .", '".$job_type."', '".$measurement_name."', ".$length.", ".$waist.", ".$hip.", ".$armhole.", ".$bust.", ".$sleeve.", ".$bicep.", ".$neck.", ".$shoulder.", ".$across_back.", ".$bust_pt.");";
            $conn->prepare($sql);
            $conn->query($sql);
        }
        if(($type >= 11) && ($type <= 15))
        {
            $length     = $_POST['p_length'];
            $waist      = $_POST['p_waist'];
            $hip        = $_POST['p_hip'];
            $ankle      = $_POST['p_ankle'];
            $round_leg  = $_POST['p_round-leg'];
            $round_knee = $_POST['p_round-knee'];
            $sql = "insert into measurements (user_id, job_type, name, leng, waist, hip, ankle, round_leg, round_knee) values (".$_SESSION['id'] .",'".$job_type."', '".$measurement_name."', ".$length.", ".$waist.", ".$hip.", ".$ankle.", ".$round_leg.", ".$round_knee.");";
            $conn->prepare($sql);
            $conn->query($sql);
        }
        if(($type >= 21) && ($type <= 25))
        {
            //blouses
            $length      = $_POST['b_length'];
            $waist       = $_POST['b_waist'];
            $hip         = $_POST['b_hip'];
            $armhole     = $_POST['b_armhole'];
            $bust        = $_POST['b_bust'];
            $sleeve      = $_POST['b_sleeve'];
            $bicep       = $_POST['b_bicep'];
            $neck        = $_POST['b_neck'];
            $shoulder    = $_POST['b_shoulder'];
            $across_back = $_POST['b_across-back'];
            $bust_pt     = $_POST['b_bust-point'];
            $sql = "insert into measurements (user_id, job_type, name, leng, waist, hip, armhole, bust, sleeve, bicep, neck, shoulder, across_back, bust_point) values (".$_SESSION['id'] .",'".$job_type."', '".$measurement_name."', ".$length.", ".$waist.", ".$hip.", ".$armhole.", ".$bust.", ".$sleeve.", ".$bicep.", ".$neck.", ".$shoulder.", ".$across_back.", ".$bust_pt.");";
            $conn->prepare($sql);
            $conn->query($sql);
        }
        if(($type >= 16) && ($type <= 20))
        {
            //skirts
            $length = $_POST['sk_length'];
            $waist  = $_POST['sk_waist'];
            $hip    = $_POST['sk_hip'];
            $sql = "insert into measurements (user_id, job_type, name, leng, waist, hip) values (".$_SESSION['id'] .",'".$job_type."', '".$measurement_name."', ".$length.", ". $waist .", " . $hip . ");";
        }
        if(($type >= 6) && ($type <= 10))
        {
            //shorts
            $length     = $_POST['sh_length'];
            $waist      = $_POST['sh_waist'];
            $hip        = $_POST['sh_hip'];
            $round_leg  = $_POST['sh_round-leg'];
            $round_knee = $_POST['sh_round-knee'];
            $sql = "insert into measurements (user_id, job_type, name, leng, waist, hip, round_leg, round_knee) values (".$_SESSION['id'] .",'".$job_type."', '".$measurement_name."', ".$length.", ". $waist .", " . $hip .", ".$round_leg.", ".$round_knee.");";
        }
        
        $conn->prepare($sql);
        $conn->query($sql);
        $sql = "select max(measurement_id) from measurements;";
        $conn->prepare($sql);
        $meas_id = $conn->query($sql)->fetch_assoc()['max(measurement_id)'];
    }
    else
    {
        $meas_id = $_POST['measurement_id'];
    }
    if($appt_needed)
    {
        $meas_id = 1;
    }

    $sql = "insert into orders (state, date_placed, user_id, first_name, last_name, measurements_id, due_date, est_cost, providing_fabric, type, contact_num, delivery_address) values ('Accepted', '" . $date_placed . "', " . $_SESSION['id'] . ", '" . $fname . "', '" . $lname . "', " . $meas_id . ", '" . $due_date . "', " . $est_cost . ", TRUE, '".$job_type."', '" . $phone . "', '" . $address . "');";
    $conn->prepare($sql);
    $conn->query($sql);
    echo $sql;

    $sql = "select * from users where user_id = " . $_SESSION['id'] . ";";
    $conn->prepare($sql);
    $email = $conn->query($sql)->fetch_assoc()['email'];
    $fname = $conn->query($sql)->fetch_assoc()['first_name'];
    $sql = "select max(order_id) from orders;";
    $conn->prepare($sql);
    $order_id = $conn->query($sql)->fetch_assoc()['max(order_id)'];
    $admin = "puncysstore@gmail.com"; 
    $subject = "New Order from ". $fname."!";
    $subject_cli = "Order Confirmation from Puncy's Store";
    $headers = "From: " . $admin . "\r\n";
    $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
    $msg = "<html>";
    $msg .= "<head>";
    $msg .= '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />';
    $msg .= '<title>Order Confirmation from Puncy\'s Store</title>';
    $msg .= '<meta name="viewport" content="width=device-width, initial-scale=1.0"/>';
    $msg .= "</head>";
    $msg .= "<body>";
    $msg .= '<table align = "center" role="presentation" border="1" cellpadding="0" style="border-collapse: collapse;" cellspacing="0" width="100%">';
    $msg .= '<tr>';
    $msg .= '<td>';
    $msg .= '<h1 style="margin: 0;">Hello!</h1>';
    $msg .= '</td>';
    $msg .= '</tr>';
    $msg .= '<tr>';
    $msg .= '<td>';
    $msg .= '<p style="margin: 0;">Here are your order details:</p>';
    $msg .= '</td>';
    $msg .= '</tr>';
    $msg .= '<tr>';
    $msg .= '<td>ID</td><td>Date</td><td>Type of Job</td><td>Contact Number</td><td>Estimated Cost</td>';
    $msg .= '</tr>';
    $msg .= "<tr>";
    $msg .= '<td>'.$order_id.'</td><td>'.$date_placed.'</td><td>'.$type.'</td><td>'.$phone.'</td><td>'.$est_cost.'</td>';
    $msg .= '</table>';
    $msg .= '</body>';
    $msg .= "</html>";

    mail($email, $subject_cli, $msg, $headers);
    mail($admin, $subject, $msg, $headers);
    ?>

    <script>
        alert("Your order has been confirmed!");
    </script>
<?php
    header("Location: confirm_order.php");
    //header("Location: confirm_order.php");
	

    

    

    

   

    

?>
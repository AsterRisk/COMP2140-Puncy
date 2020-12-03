<?php

    /*$host = 'localhost';
    $dbname = 'puncys_store';
    $username = 'one_user';
    $password = 'password1234';


    $conn= new mysqli('localhost', 'one_user', 'password123', 'puncys_store');
    
    if (isset($_POST['Submit'])){
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $tele = $_POST['telenum'];
    $app_date = $_POST['appdate'];
    $app_time = $_POST['apptime'];

    
        if($conn->connect_error){
            die('Connection Failed : '.$conn->connect_error); */

    include('header.php');
                //include('connect.php');

    //if (isset($_POST['Submit'])){
       // $fname = $_POST['fname'];
       // $lname = $_POST['lname'];
       // $tele = $_POST['telenum'];
        $userid = $_SESSION['id'];
        $app_date = $_POST['appdate'];
        $app_time = $_POST['apptime'];
        $dup=mysqli_query($conn, "SELECT * FROM appointments WHERE app_date= '$app_date' AND app_time= '$app_time'");

    if (mysqli_num_rows($dup)>0){
        echo "Unavailable date and time selected.";
    }  
    else{
        $stmt = $conn->prepare("insert into appointments(user_id, app_date, app_time) values (?,?,?)");
        $stmt->bind_param("iss",$userid, $app_date, $app_time);
        $stmt->execute();
        echo "Appointment was succesfully made";
        $stmt->close();
        $conn->close();
        header("Location: confirm-app.php");
    }  

    /*if($conn->connect_error){
        die('Connection Failed : '.$conn->connect_error);
    } 
    else{
        //$conn->prepare($stmt);
        //$myVar = $conn->query($stmt)->fetch_assoc();
        $stmt = $conn->prepare("insert into appointments(user_id, app_date, app_time) values (?,?,?)");
        $stmt->bind_param("sss",$userid, $app_date, $app_time);
        $stmt->execute();
        echo "Appointment was succesfully made";
        $stmt->close();
        $conn->close();
    } */
 
            
/*

    include('connect.php');

    //if (isset($_POST['Submit'])){
       // $fname = $_POST['fname'];
       // $lname = $_POST['lname'];
       // $tele = $_POST['telenum'];
        $userid = $_POST['user_ID'];
        $app_date = $_POST['appdate'];
        $app_time = $_POST['apptime'];
    

    if($conn->connect_error){
        die('Connection Failed : '.$conn->connect_error);
    } 
    else{
        $stmt = $conn->prepare("insert into appointments(user_id, app_date, app_time) values (?,?,?)");
        $stmt->bind_param("sss",$userid, $app_date, $app_time);
        $stmt->execute();
        echo "Appointment was succesfully made";
        $stmt->close();
        $conn->close();
    }


    $query = "SELECT * FROM `appointments` WHERE `app_date` = '$app_date' AND `app_time` = '$app_time'";
    $sqlsearch = mysql_query($query);
    $resultcount = mysql_numrows($sqlsearch);

    if($resultcount>0){
        echo "Unavailable date and time";
    } else{
        mysql_query("INSERT INTO `appointments` ( user_id, app_date, app_time) VALUES ($userid`,$app_date`,`$app_time`)") or die (mysql_error());
        echo "Appointment was made successfully.";
    }  */

?>
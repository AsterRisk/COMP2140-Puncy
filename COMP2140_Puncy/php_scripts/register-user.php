<?php
        include 'header.php';
        $sql = "select*from logins where email = '".htmlspecialchars($_POST['email'])."';";
        $conn->prepare($sql);
        $results = $conn->query($sql);
        if($results->num_rows > 0)
        {
            //$_SESSION['err_flag'] = 1;
            echo "<h1>There was already a user with that email, please go back and try again.</h1>";
        }
        else
        {
            if($_POST['password'] == $_POST['rep-password'])
            {
                $salt = rand(1, 10000);
                $pass = $_POST['password'] . $salt;
                $pass_digest = hash("sha256", $pass);
                $dates = explode("-", $_POST['dob']);
                $birthday = $dates[0] . "/" . $dates[1] . "/" . $dates[2];
                $sql = "insert into users (first_name, last_name, tele_num, home_address, email, dob, clearance) values ('".$_POST['fname']."', '".$_POST['lname']."', '".$_POST['phone_num']."', '".$_POST['addr']."', '".$_POST['email']."', '".$birthday."', 2);";
                $sql;
                $conn->prepare($sql);
                $conn->query($sql);
                $sql = "select max(user_id) from users;";
                $conn->prepare($sql);
                $user_id = $conn->query($sql)->fetch_assoc()['max(user_id)'];
                $sql2 = "insert into logins (user_id, email, password_hash, salt) values (".$user_id.", '". $_POST['email'] ."', '".$pass_digest ."', ". $salt .");";
                $conn->prepare($sql2);
                $conn->query($sql2);
                $_SESSION['id'] = $user_id;
                header("Location: home.php");
            }
            else
            {
                echo "<h1>Passwords do not match, please go back and try again.</h1>";
            }
        }
?>
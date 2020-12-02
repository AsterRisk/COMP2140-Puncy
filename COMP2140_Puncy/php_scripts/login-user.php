<?php
    
    include 'header.php';
    $query = "select * from logins where email = '" . htmlspecialchars($_POST['email']) . "';";
    $conn->prepare($query);
    $logins = $conn->query($query);
    if($logins->num_rows <= 0)
    {
        echo "<h1>Login not found.</h1>";
    }
    else
    {
        $row = $logins->fetch_assoc();
        $salt = $row['salt'];
        $pass_digest = $row['password_hash'];
        $test_pass = htmlspecialchars($_POST['password']) . $salt;
        if (hash("sha256", $test_pass) === $pass_digest)
        {
            session_start();
            ob_start();
            $_SESSION['valid'] = true;
            $_SESSION['timeout'] = time();
            $_SESSION['username'] = $row['email'];
            $_SESSION['id'] = $row['user_id'];
            header ("Location: home.php");
            exit();
        }
        else
        {
            echo "Incorrect Password<br>";
        }
    }
?>
<?php

$conn = new mysqli("localhost", "keralate_ktreach", "ZAE6JWGphNscuEf6YZEg", "keralate_ktreach");
// $conn = new mysqli("localhost", "root", "", "ktreach");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}   
// else{
//     echo "Connected successfully";
// }

?>
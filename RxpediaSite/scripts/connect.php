<?php
    $servername = "localhost";
    $username = "html";
    $password = "php";
    $db = "drugsdb";
    $drug = strval($_GET['q']);

    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $db);
    if (!$conn) {
        die('Could not connect: ' . mysqli_connect_error());
    }

    // Query for drug info
    $q = "SELECT * FROM htmlView WHERE brandName = '".$drug."'"; 
    $result = mysqli_query($conn, $q);
    
    // Fetch the rows as an array
    $data = mysqli_fetch_row($result);

    if(empty($data)){
        die("Error");
    }

    /*
    while($row = mysqli_fetch_array($result)){
        $data[] = $row;
    }
    */
    
    //print_r($data);
    
    /*
    $jsData = json_encode($data);
    echo $jsData;
    */

    // Echo each element as a string for JavaScript to convert into array
    foreach($data as $col){
        echo $col . "/n";
    }

    mysqli_close($conn);
?>
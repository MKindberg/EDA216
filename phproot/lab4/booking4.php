<?php
	require_once('database.inc.php');

	session_start();
	$db = $_SESSION['db'];
	$user = $_SESSION['userId'];
    $movie = $_SESSION['movieName'];
    $date = $_SESSION['date'];
    $theatre = $_SESSION['theatre'];
    $seats = $_SESSION['seats'];

    $db->openConnection();
    $refnbr=$db->book($user, $movie, $date);
    $db->closeConnection();
?>

<html>
<head><title>Booking 4</title><head>
<body><h1>Booking 4</h1>
    <?php
    if($refnbr!=0){
        print "One ticket booked, Booking number: $refnbr";
    }
    else {
        print "No tickets left";
    }
    ?>
	<form method=post action="booking1.php">
		<input type=submit value="New booking">
	</form>
</body>
</html>

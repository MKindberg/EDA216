<?php
	require_once('database.inc.php');

	session_start();
	$db = $_SESSION['db'];
	$userId = $_SESSION['userId'];
    $movie = $_SESSION['movieName'];
    $date = $_REQUEST['date'];
    $_SESSION['date']=$date;

    $db->openConnection();
    $theatre=$db->getThreatre($movie, $date);
    $seats=$db->getFreeSeats($movie, $date);
    $db->closeConnection();

    $_SESSION['theatre']=$theatre;
    $_SESSION['seats']=$seats;
?>

<html>
<head><title>Booking 3</title><head>
<body><h1>Booking 3</h1>
	Current user: <?php print $userId ?>
    <p>
    Data for selected performance:
    <p>
    Movie: <?php print $movie ?> <br>
    Date: <?php print $date ?> <br>
    Theatre: <?php print $theatre ?> <br>
    Free Seats: <?php print $seats ?> <br>


	<form method=post action="booking4.php">
		<input type=submit value="Book Ticket">
	</form>
</body>
</html>

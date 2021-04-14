<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
	session_start();
	include_once "function.php";
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DMs</title>
<link rel="stylesheet" type="text/css" href="css/default.css" />
<script type="text/javascript" src="js/jquery-latest.pack.js"></script>


</head>
<body>

<?php 
    $query = "SELECT username FROM account";
    $res = mysqli_query($db->db_connect_id,$query);

    $arr = Array();
    while($row = mysqli_fetch_array($res, MYSQLI_ASSOC)){
        $arr[] = $row['username'];
    }
    $count = count($arr);
    
?>
<h2>DMs</h2>

<form action="browse.php">
		<input type="submit" value="Return to Browsing">
</form>
<br>

    <form action="#" method="post">
        Choose a user to message:
        <select name='ruser' id='ruser' >
            <?php for($i=0; $i<$count;$i++ ){?>
            <option value="<?php echo $arr[$i]; ?>" ><?php echo $arr[$i]; ?></option>
            <?php } ?>
        </select>
        <br>

        Message:
        <textarea  id='com' name='com' rows='2' cols='50'>Message here</textarea><br>

        <input name="submit" type="submit" value="Submit">
    </form>

<?php
    if(isset($_POST['submit'])){
        $dmrec = $_POST['ruser'];
        $mess = $_POST['com'];
        $send = $_SESSION['username'];
        $inq = "INSERT INTO dms (comid, sendid, recid, dm)VALUES(NULL, '$send' ,'$dmrec' , '$mess')";
        mysqli_query($db->db_connect_id,$inq);
    }



?>

<br>Messages:<br><br>
<?php
    $sess = $_SESSION['username'];
    $outq = "SELECT * FROM dms WHERE sendid = '$sess' OR recid = '$sess'";
    $messq = mysqli_query($db->db_connect_id,$outq);
    
    while ($result_row = mysqli_fetch_row($messq)){
        echo "From: ",$result_row[1];
        echo "<br>";
        echo "Sent to: ",$result_row[2];
        echo "<br><b>Message: </b><br>";
        echo $result_row[3];
        echo "<br>";
        echo "<br>";
    }
?>
</body>
</html>
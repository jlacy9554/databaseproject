<?php
	session_start();
	include_once "function.php";
?>

<form method="post" action="<?php echo "profile.php"; ?>">
Channels
<p>User is: <?php echo $_SESSION['username'];?></p>

<?php
global $db;
	
$query = "SELECT username FROM MeTubeProject_zfvm.account";
$result = mysqli_query($db->db_connect_id,$query);

while($row = mysqli_fetch_array($result)) {
	$name = $row['username'];
	echo "<a href='channel_content.php?channel=".$name."'>".$name."</a><br>";
}
?>

</form>
<?php
  if(isset($reg_error))
   {  echo "<div id='passwd_result'>".$reg_error."</div>";}
?>
<form action="browse.php">
		<input type="submit" value="Back">
</form>
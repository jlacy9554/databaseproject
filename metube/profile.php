<?php
	session_start();
	include_once "function.php";
?>
<?php
if(isset($_POST['submit'])){
    global $db;
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    $sessinfo = $_SESSION['username'];
    $query  = "SELECT id FROM account WHERE username = '$sessinfo'";
    $result = mysqli_query($db->db_connect_id,$query);
    $row = mysqli_fetch_array($result);
    $id = $row['id'];
    

    if($_POST['username'] != ""){
        $check= newnamecheck($_POST['username']);
        if($check ==1){
            $reg_error = "Username already taken.";
        }
        else{
            $query2 ="UPDATE account SET username='$username' WHERE id =$id";
            mysqli_query($db->db_connect_id,$query2);
            header('Location: profile.php');
        }
    }
    if($_POST['password'] != ""){
        if($_POST['password'] !=  $_POST['cpassword']){
            $reg_error = "Passwords don't match.";
        }
        else{
            $query3 = "UPDATE account SET password='$password' WHERE id=$id";
            mysqli_query($db->db_connect_id,$query3);
            header('Location: profile.php');
        }
    }
    if($_POST['email'] != "" ){
        $query4 = "UPDATE account SET email='$email' WHERE id=$id";
        mysqli_query($db->db_connect_id,$query4);
        header('Location: profile.php');
    }
}
?>

<form method="post" action="<?php echo "profile.php"; ?>">
Update Information:
<p>User is: <?php echo $_SESSION['username'];?></p>
<table width="100%">
		<tr>
			<td  width="20%">Username:</td>
			<td width="80%"><input class="text"  type="text" name="username"><br /></td>
		</tr>
		<tr>
			<td  width="20%">Password:</td>
			<td width="80%"><input class="text"  type="password" name="password"><br /></td>
		</tr>
        <tr>
			<td  width="20%">Confirm Password:</td>
			<td width="80%"><input class="text"  type="password" name="cpassword"><br /></td>
		</tr>
        <tr>
			<td  width="20%">Email:</td>
			<td width="80%"><input class="text"  type="email" name="email"><br /></td>
		</tr>
		<tr>
        
			<td><input name="submit" type="submit" value="Update"><input name="reset" type="reset" value="Reset"><br /></td>
		</tr>
		<tr>
			
		</tr>
	</table>

</form>
<?php
  if(isset($reg_error))
   {  echo "<div id='passwd_result'>".$reg_error."</div>";}
?>
<form action="browse.php">
		<input type="submit" value="Back">
</form>

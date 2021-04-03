<link rel="stylesheet" type="text/css" href="css/default.css" />
<?php

include "function.php";
if(isset($_POST['submit'])){ 
    $check= newnamecheck($_POST['username']);
    if($_POST['username'] == "") {
        $reg_error = "Username missing.";
    }
    else if($_POST['password'] == "") {
        $reg_error = "Password missing.";
    }
    else if($_POST['cpassword'] == "") {
        $reg_error = "Confirmation password missing.";
    }
    else if($_POST['email'] == "" ) {
        $reg_error = "Email missing.";
    }
    else if($_POST['cpassword'] !=  $_POST['password'] ) {
        $reg_error = "Passwords don't match.";
    }
   
    else if($check ==1){
        $reg_error = "Username already taken.";
    }
    else{
        global $db;
        $username = $_POST['username'];
        $password = $_POST['password'];
        $email = $_POST['email'];

        $result = mysqli_query($db->db_connect_id, "SELECT MAX(id) as max_id FROM account");
        $row = mysqli_fetch_array($result);
        $id = $row["max_id"] +1;
        $query = "INSERT INTO account  VALUES ('$username', '$password', '$email','$id')";
        mysqli_query($db->db_connect_id,$query);
        header('Location: index.php');
    }

}
?>


<form method="post" action="<?php echo "register.php"; ?>">
Registration
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
        
			<td><input name="submit" type="submit" value="Register"><input name="reset" type="reset" value="Reset"><br /></td>
		</tr>
		<tr>
			
		</tr>
	</table>

</form>
<?php
  if(isset($reg_error))
   {  echo "<div id='passwd_result'>".$reg_error."</div>";}
?>
<form action="index.php">
		<input type="submit" value="Back">
</form>

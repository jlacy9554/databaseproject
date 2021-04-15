<html>
<?php
    session_start();
    include_once "function.php"
?>
<?php
global $db;

if(isset($_GET['channel'])) {
    $currentchannel=$_GET['channel'];
	$_SESSION['currentchannel']=$currentchannel;
}

echo $currentchannel;
$query = "SELECT * FROM MeTubeProject_zfvm.media AS me INNER JOIN MeTubeProject_zfvm.upload AS up ON me.mediaid = up.mediaid WHERE up.username ='" .$currentchannel. "'";
$result = mysqli_query($db->db_connect_id,$query);
if (!$result)
	{
	   die ("This user has not uploaded any media <br />");
	}
?>

<table width="50%" cellpadding="0" cellspacing="0">
		<?php
			while ($result_row = mysqli_fetch_row($result))
			{ 
		?>
        <tr valign="top">			
			<td>
					<?php 
						echo $result_row[0];
					?>
			</td>
            <td>
			<a href="media.php?id=<?php echo $result_row[0];?>&channel=<?php echo $currentchannel;?>" target="_blank"><?php echo $result_row[1];?></a> 
            </td>
            <td>
            	<a href="<?php echo $result_row[2].$result_row[1];?>" target="_blank" onclick="javascript:saveDownload(<?php echo $result_row[0];?>);">Download</a>
            </td>
		</tr>
        <?php
			}
		?>
</table>
</html>

<form action="browse.php">
		<input type="submit" value="Back">
</form>
<?php
    session_start();
    include_once "function.php"
?>

<html>


<p><?php echo $_SESSION['username'];?>'s favorites</p>
<?php
    global $db;

    $username = $_SESSION['username'];
    $query = "SELECT * FROM media WHERE mediaid IN (SELECT mediaid FROM account_media WHERE accountid = (SELECT id FROM account WHERE username = \"".$username."\"))";

    $result = mysqli_query($db->db_connect_id, $query);

    $queryi = "SELECT * from mediainfo";
	$infores = mysqli_query($db->db_connect_id,$queryi);

?>

<div style="background:#339900;color:#FFFFFF; width:150px;">Liked Media</div>
	<table width="50%" cellpadding="0" cellspacing="0">
		<?php
            if ($result->num_rows == 0) {
                echo "<br>You have not liked any videos.";
            }

			while ($result_row = mysqli_fetch_row($result))
			{ $resi_row = mysqli_fetch_row($infores);
		?>
        <tr valign="top">			
			<td>
					<?php 
						echo $result_row[0];
					?>
			</td>
			<td>
				<?php
					echo $resi_row[1];
				?>
			</td>
            <td>
            	<a href="media.php?id=<?php echo $result_row[0];?>" target="_blank"><?php echo $result_row[1];?></a> 
            </td>
            <td>
            	<a href="<?php echo $result_row[2].$result_row[1];?>" target="_blank" onclick="javascript:saveDownload(<?php echo $result_row[0];?>);">Download</a>
            </td>
		</tr>
        <?php
			}
		?>
	</table>

    <?php echo "<br><br>" ?>

    <form action="browse.php" method="post">
        <input type="submit" value="Back">
    </form>

</html>
<html>
<?php
    session_start();
    include_once "function.php"
?>

<?php
global $db;

if(isset($_GET['playlist'])) {
    $currentplaylist = $_GET['playlist'];
    $_SESSION['currentplaylist'] = $currentplaylist;
    echo "<p>" .html_entity_decode($currentplaylist). "</p>";
} else {
    $currentplaylist = $_SESSION['currentplaylist'];
    echo "<p>" .html_entity_decode($currentplaylist). "</p>";
}

$username = $_SESSION['username'];

$query = "SELECT * FROM media where mediaid IN (SELECT mediaid FROM playlist_media WHERE playlistid = (SELECT playlistid FROM playlists WHERE name = \"".$currentplaylist."\" AND userid = (SELECT id FROM account WHERE username =\"".$username."\")))";
$result = mysqli_query($db->db_connect_id, $query);

?>

<div style="background:#339900;color:#FFFFFF; width:150px;">Playlist Media</div>
	<table width="50%" cellpadding="0" cellspacing="0">
		<?php

        if ($result->num_rows == 0) {
            echo "Playlist is empty. <br>";
        }

        if ($result) {
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
            	<a href="media.php?id=<?php echo $result_row[0];?>" target="_blank"><?php echo $result_row[1];?></a> 
            </td>
            <td>
            	<a href="<?php echo $result_row[2].$result_row[1];?>" target="_blank" onclick="javascript:saveDownload(<?php echo $result_row[0];?>);">Download</a>
            </td>
		</tr>
        <?php
			}
        } else {
            echo "Error has occured.";
        }
		?>
	</table>

<form action="addplaylistcontent.php" method="post">
    <input type="submit" value="Add Media">
</form>

<form action="playlist.php" method="post">
    <input type="submit" value="Back">
</form>

</html>
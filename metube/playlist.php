<?php
    session_start();
    include_once "function.php"
?>
<html>

<p><?php echo $_SESSION['username'];?>'s playlists</p>
<?php
    global $db;
    $username = $_SESSION['username'];

    $query = "SELECT name FROM playlists WHERE userid = (SELECT id FROM account WHERE username =\"".$username."\")";
    $result = mysqli_query($db->db_connect_id, $query);

    if (!$result)
	{
	   die ("No playlists yet: <br />". mysqli_error($db->db_connect_id));
	}

    if ($result->num_rows == 0) {
        echo "You do not have any playlists yet.<br><br>";
    }

    while ($row = mysqli_fetch_row($result)) {
        $value = htmlentities($row[0], ENT_QUOTES);
        echo "<a href='playlist_content.php?playlist=".$value."'>".$value."</a><br>";
    }

    echo "<br><br>";

?>

<form method="post"> 
    <label for="playlistname">Playlist name: </label>
        <input type="text" name="playlistname"><br>
    <input type="submit" value="New Playlist">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["playlistname"])) {
        echo "Please enter a playlist name before adding.";
    } else {
        $user = $_SESSION["username"];
        $useridquery = "SELECT id FROM account WHERE username = '".$user."'";
        $result = mysqli_query($db->db_connect_id, $useridquery);

        $userid = mysqli_fetch_row($result);
        if (isset($_POST['playlistname'])){
            $playlist = $_POST['playlistname'];
        } else {
            $playlist = null;
            echo "no playlist name supplied";
        }

        $escaped = mysqli_escape_string($db->db_connect_id, $playlist);

        $playlistexistsquery = "SELECT * FROM playlists WHERE userid=\"".$userid[0]."\" AND name=\"".$playlist."\"";
        $playlistexists = mysqli_query($db->db_connect_id, $playlistexistsquery);

        $numrows = $playlistexists->num_rows;

        if ($numrows == 0) {
            $newplaylistquery = "INSERT INTO playlists (name, userid) VALUES (\"".$playlist."\", ".$userid[0].")";
            $result = mysqli_query($db->db_connect_id, $newplaylistquery);

            echo "Playlist created.";
        } else {
            echo "Playlist name already exists.";
        }

        
    }
}
?>

<form action="browse.php">
    <input type="submit" value ="Back">
</form>

</html>
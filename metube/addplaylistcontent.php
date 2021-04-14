<?php
    session_start();
    include_once "function.php"
?>

<html>
<?php

global $db;
$query = "SELECT filename FROM media";
$result = mysqli_query($db->db_connect_id, $query);
$currentplaylist = $_SESSION['currentplaylist'];

echo "<form method='post'>";

while ($row = mysqli_fetch_array($result)) {
    $medianame = $row[0];
    echo $medianame."  <input type='checkbox' name='medialist[]' value=".$medianame." /><br><br>";
}

echo "<input type='submit' name='submit_playlist' value='Add to Playlist'/>";

echo "</form>";

echo "<form method='post' action='playlist_content.php'>";
    echo "<input type='submit' value='Back'/>";
echo "</form>";

if(isset($_POST["submit_playlist"])) {
    $medialist = $_POST["medialist"];
    
    for ($i = 0; $i < count($medialist); $i++) {
        $media = $medialist[$i];

        if ($i != (count($medialist) - 1)) {
            echo $media. ", ";
        } else {
            echo $media;
        }

        $username = $_SESSION['username'];

        $query = "INSERT INTO playlist_media VALUES ( (SELECT playlistid FROM playlists WHERE name=\"" .$currentplaylist. "\" 
            AND userid=(SELECT id FROM account WHERE username=\"".$username."\")), 
            (SELECT mediaid FROM media WHERE filename=\"" .$media. "\") )";

        $result = mysqli_query($db->db_connect_id, $query);
    }
    
    echo " have been added to the playlist.\n";
}



?>
</html>
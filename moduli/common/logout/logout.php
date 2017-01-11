<?php
session_start();
$_SESSION['id']="";
echo "<h2 align=\"center\"> logout effettuato correttamente</h2>";
echo "<h3 align=\"center\"><a href=\"index.php?modulo=login\">collegati con un altro utente..</a></h3>";
?>
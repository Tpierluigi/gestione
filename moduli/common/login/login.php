<?
$usr=$_POST["username"];
$pw=md5($_POST["username"].$_POST["password"]);
$riga=$db->get_row("Select ID from utenti where username='$usr' and password='$pw'");
if ($usr){
  if (!$riga){
  	  setcookie("id","");
			include ("form.php");
     ?>
  	<h2 align="center" style="color:red;" > LOGIN FALLITO!</h2>
      <h3 align="center"> ritentare controllando di aver scritto nome e password correttamente</h3>
  	<?
  }
  else
	{
	$val=(string)$riga->ID;
	$_SESSION["id"]=$val;
	redirect("index.php?modulo=mainmenu");
	}
}
else{
	include ("form.php");
}

?>

<?php
include_once("ez_sql.php");
function verificalivello($liv)
	{
  global $db;
  $id=$_SESSION["id"];
  if ($id>0)
  	{
  	$riga=$db->get_row("select livello from utenti where ID=$id");
    if ($riga->livello>$liv)
    	 {
    	 echo "<h2 align=\"center\"> NON HAI L'AUTORIZZAZIONE PER VISUALIZZARE QUESTA PAGINA!</h2>";
    	 echo "<h3 align=\"center\"> ritentare controllando di avere i diritti necessari</h3>";
    	 echo "<h3 align=\"center\"> <a href='javascript:history.back()'>torna indietro..</a></h3>";
			 die();
    	 }
	  return true;
	  }
  else
  	{  
  	echo "<h2 align=\"center\"> NON TI SEI AUTENTICATO!</h2>";
  	echo "<h3 align=\"center\"> inserisci nome e password corretti</h3>";
  	echo "<h3 align=\"center\"> <a href='index.php?modulo=login'>torna indietro..</a></h3>";
  	die();
		}
  }
function autorizzato($liv){
				 global $db;
				 $id=$_SESSION["id"];
				 if ($id>0){
				 		$riga=$db->query("select livello from utenti where ID=$id");
						if ($riga->livello<=$liv)
							 {
							 return true;
							 }
						}
					return false;				
					}
function viewpass($testo,$livello)
	{
  global $db;
  $id=$_SESSION["id"];
  if ($id>0)
  	{
  	$riga=$db->get_row("select livello from utenti where ID=$id");
    if ($riga->livello<$liv)
    	 return($testo);
		}
	return("&lt;HIDDEN&gt;");
	} 
					
?>

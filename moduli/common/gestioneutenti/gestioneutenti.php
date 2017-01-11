<?php
//*********+MODULO PER LA GESTIONE AMMINISTRATIVA DEGLI UTENTI********************
if (verificalivello(0))
	{
  $utente=(int)$_GET['utente'];
  $azione=$_GET['azione'];
  
  echo "<h2 align=\"center\">GESTIONE UTENTI</H2>";
  /*
  il modulo è deviso in sezioni che vengono attivate a seconda di un parametro passato
  sull'indirizzo e chiamato AZIONE. a seconda del paramtro vengono eventualmente
  usati altri parametri sempre sull'indirizzo  
  */
  if ($azione=="edit") 
  	include ("form.php");
  if ($azione=="update") 
  	include ("update.php");		
  if ($azione=="add")
  	include ("add.php");		
  	 
  if ($azione=="confirm") 
    //sezione per un'ulteriore conferma della cancellazione di un utente.
    {
    $dati=$db->get_row("SELECT * FROM utenti where ID='$utente'");
    echo "<h2 align=\"center\">Vuoi veramente cancellare l'utente <i>$dati->UserName</i>?</h2>";
    echo "<h2 align=\"center\"><a href=\"index.php?modulo=gestioneutenti&azione=del&utente=$utente\">Cancella</a></h2>";  
    }
  if ($azione=="del") 
  	// sezione per la cancellazione dell'utente
  	$db->query ("delete from utenti where ID=$utente ");
  
  /*
  parte comune del modulo: qui viene mostrata la lista degli utenti disponibili e viene mostrato il form 
  per l'aggiunta di altri utenti
  */
  include ("list.php");
  include ("addform.php");  
	}
?>



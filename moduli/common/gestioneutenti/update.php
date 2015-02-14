<?
/*sezione che contiene lo script di modifica dell'utente nel database*/
	 //controllo che la password sia inserita nel modo corretto
if (($_POST['password'])==($_POST['checkpassword']))
	{
	//seleziono l'utente da modificare...
	$utentedamod=$db->get_row("select * from utenti where ID=$utente");
	@$username=$utentedamod->UserName;
	@$livello=$_POST['livello'];
	//calcolo l'hash della password...
	$pw=md5($username.$_POST['password']);
	// aggiorno il DB...
	$OK=$db->query("update utenti set password='$pw',livello=$livello where ID=$utente");
	if (!$OK)
			{
			//se l'aggiornamento non è riuscito restituisco un errore
			Echo "<p align=\"center\">Problemi di connessione al server: ritentare più tardi</p>";
			echo "<p align=\"center\"><a href=\"index.php?modulo=gestioneutenti\"> Indietro..</a></p>";
			}
	}
else 
	{
	//se la password non è digitata correttamente restituisco un errore
	echo "<p align=\"center\">Errore nella digitazione della password:</p>";
	echo "<p align=\"center\"> <a href=\"index.php?modulo=gestioneutenti\"> Indietro..</a></p>";
	}
?>
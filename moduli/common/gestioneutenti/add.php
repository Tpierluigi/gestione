<?php
//sezione dche contiene lo script di aggiunta di un utente al database 
//controllo che la password sia digitata correttamente...
if (($_POST['password'])==($_POST['checkpassword'])){
	//preparo i dati da inserire nel database: nome, livello e hash della password. 
	@$username=$_POST['username'];
	@$livello=$_POST['livello'];
	$pw=md5($username.$_POST['password']);
	// controllo che non vi sia un altro utente con lo stesso nome nel DB:
	$dati=$db->get_row("SELECT * FROM utenti where username='$username'");
	if (!$dati) 
		//se non c'è un utente duplicato porto a termine l'inserimento 
		$db->query("insert into utenti(username,password,livello) values ('$username','$pw',$livello)");
	else
		{
		// altrimenti restituisco un errore
		Echo "<p align=\"center\">Esiste già un utente con lo stesso nome. scegliere un nome utente diverso</p>";
		echo "<p align=\"center\"><a href=\"gestioneutenti.php\"> Indietro..</a></p>";
		}
	}
else {
		// se la password non è digitata correttamente restuisco un errore
		echo "<p align=\"center\">Errore nella digitazione della password:</p>";
		echo "<p align=\"center\"> <a href=\"gestioneutenti.php\"> Indietro..</a></p>";
		}

?>

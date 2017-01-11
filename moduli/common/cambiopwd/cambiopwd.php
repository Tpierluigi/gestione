<?php
/* 
*******************MODULO PER LA GESTIONE DELLA PROPRIA PASSWORD: CONSENTE DI **
*******************CAMBIARE LA PASSWORD PERSONALE*******************************
*/

if (verificalivello(6))
	{

  /*
  se il modulo è stato caricato dall'action della form, cioè se sta funzionando la parte della
  modifica vera e propria, ALMENO UNA delle tre password inserite non è vuota, quindi eseguo
  lo script di modifica
  */
  if (($_POST['oldpwd']!="")||($_POST['newpwd']!="")||($_POST['chkpwd']!=""))
  	 {
  	 	//Calcolo l'hash delle password passate al modulo..
      $oldpwdenc=md5($_datiutente->UserName.$_POST['oldpwd']);
      $newpwdenc=md5($_datiutente->UserName.$_POST['newpwd']);
      $chkpwdenc=md5($_datiutente->UserName.$_POST['chkpwd']);
  		// controllo che l'utente abbia inserito correttamente la vecchia password.
  		if ($db->get_row("select * from utenti where ID=$_codusr and password='$oldpwdenc'"))
  			  {
  				//se l'utente ha inserito correttamente la vecchia password eseguo l'aggiornamento del DB
  				//e aggiorno una variabile che mi contiene il messaggio di stato che sarà poi visualizzato
  				
          if ($newpwdenc==$chkpwdenc)
          		{
  						
          		$ok=$db->query("update utenti set password='$newpwdenc' where id=$_codusr and password='$oldpwdenc'");
          	  if ($ok)
          			 $messaggio="Aggiornamento password riuscito!";
          		else
          			 $messaggio="problemi di collegamento con il database: impossibile cambiare password!";
          		}
  				//altrimenti lo avverto
  				else 
  	        	$messaggio="Impossibile cambiare password: <br> Nuova password digitata in maniera sbagliata";
  
      	  }
  		 // se l'utente ha sbagliato la vecchia  password, viene avvertito 		
       else 
         	$messaggio="Impossibile cambiare password: <br> Vecchia password non corretta";
  		 }
  // sezione che disegna la form della modifica password
  echo "
  <form action=\"index.php?modulo=cambiopwd\" method=\"post\">
  			<table>
  						 <tr>
  						 		 <td> Vecchia Password:</td> 
  								 <td> <input type=\"password\" name=\"oldpwd\" size=20> </td>
  						 </tr>
  						 <tr>
  								 <td> Nuova Password:</td>
  								 <td> <input type=\"password\" name=\"newpwd\" size=20> </td>
  						 </tr>
  						 <tr>
  								 <td> Riscrivi nuova Password:</td>
  								 <td> <input type=\"password\" name=\"chkpwd\" size=20> </td>
  						 </tr>
  						 <tr>
  								 <td> </td>
  								 <td> <input class=\"bottone\" type=\"submit\" value=\"cambia password\"> </td>
  						 </tr>						
  			</table>
  </form>
  ";
  // se c'è il messaggio di stato (quello della avvenuta o meno modifica password), lo mostro 
  if ($messaggio!="") 
  	echo"<h2>$messaggio</h2>";
	}
?>

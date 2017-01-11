<?php
if (verificalivello(1))
	{
  @$id=(int)$_GET['id'];
  @$codusr=$_COOKIE['id'];
  @$azione=$_POST['azione'];
  @$tipo=(int)$_POST['tipo'];
  @$Descrizione=$_POST['Descrizione'];
  
  $menubar=new barramenu;
  
  switch($azione)
  	{
  	case "scrivinuova":
      $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('inseriscinuova','frmScript')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "confcanc":
      $menubar->add("CONFERMA CANCELLAZIONE","","eseguiAzione('cancella','frmScript')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "edit":
      $menubar->add("APPLICA LE MODIFICHE","","eseguiAzione('update','frmScript')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "esegui":
      $menubar->add("TORNA INDIETRO","","history.back()");
  		break;	
  	default:
      $menubar->add("ESEGUI","","eseguiAzione('esegui','frmScript')");
      $menubar->add("MODIFICA","","eseguiAzione('edit','frmScript')");
      $menubar->add("CANCELLA","","eseguiAzione('confcanc','frmScript')");
      $menubar->add("NUOVO SCRIPT","","eseguiAzione('scrivinuova','frmScript')");
  		break;
  	}
  $menubar->show();
  
  stampatitolo("GESTIONE SCRIPT AMMINISTRATIVI");
  
  printf( "<form action=\"index.php?modulo=doscript\" id=frmScript method=post>\n");
  printf( "<input type=\"hidden\" name=\"azione\">\n" );
  
  
  switch($azione)
  	{
  	case "":
  		include_once("elenco.inc");
  		break;
  	case "confcanc":
  		include_once("confermacanc.inc");
  		break;
  	case"cancella":
  		include_once("cancella.inc");
  		break;
  	case "scrivinuova":
  		include_once("scrivinuova.inc");
  		break;
  	case "inseriscinuova":
  		include_once("inserisci.inc");
  		break;
  	case "edit":
  		include_once("modifica.inc");
  		break;
  	case "update":
  		include_once("aggiorna.inc");
  		break;
  	case "esegui":
  		include_once("esegui.inc");
  		break;
  	}
  printf( "</form>" );
	}
?>

<?php
if (verificalivello(3))
	{

  @$id=(int)$_GET['id'];
  @$codusr=$_SESSION['id'];
  @$azione=$_POST['azione'];
  @$tipo=(int)$_POST['tipo'];
  @$descrizione=$_POST['descrizione'];
  ?>
  <script language="javascript">
  
  function showQuery(val)
  		{
  		document.elenco.QueryArea.value=val;
  		}
  function switchview(ogg,inizio,fine)
  		{
  		for(i=inizio;i<=fine;i++)
  			{		
    		oggetto=document.getElementById(ogg+i);
    		if (oggetto.style.display=='none')
    			  oggetto.style.display='block';
    		else
    				oggetto.style.display='none';
  
  			}
  		}
  
  </script>
  
  <?php
  $menubar=new barramenu;
  
  switch($azione)
  	{
  	case "scrivinuova":
      $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('inseriscinuova','frmQuery')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "confcanc":
      $menubar->add("CONFERMA CANCELLAZIONE","","eseguiAzione('cancella','frmQuery')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "edit":
      $menubar->add("APPLICA LE MODIFICHE","","eseguiAzione('update','frmQuery')");
      $menubar->add("ANNULLA","","history.back()");
  		break;
  	case "esegui":
      $menubar->add("TORNA INDIETRO","","history.back()");
  		break;	
  	default:
      $menubar->add("ESEGUI","","eseguiAzione('esegui','frmQuery')");
      $menubar->add("MODIFICA","","eseguiAzione('edit','frmQuery')");
      $menubar->add("CANCELLA","","eseguiAzione('confcanc','frmQuery')");
      $menubar->add("NUOVA INTERROGAZIONE","","eseguiAzione('scrivinuova','frmQuery')");
  		break;
  	}
  
  
  $menubar->show();
  
  stampatitolo("ELENCO QUERY DEFINITE DALL'UTENTE");
  
  printf( "<form name='elenco' action=\"index.php?modulo=interrogazioni\" id=frmQuery method=post>\n");
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
  printf( "</form>\n" );
	}
?>

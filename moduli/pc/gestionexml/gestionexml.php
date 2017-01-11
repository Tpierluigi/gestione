<?php
if (verificalivello(3))
	{
  //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
  //recupero e controllo le eventuali variabili in  ingresso dalla form 
  @$azione=$_POST['azione'];
  @$codice=$_POST['codice'];
  @$data=$_POST['datag'].'/'.$_POST['datam'].'/'.$_POST['dataa']; //costruisco la data
  @$commento=stripslashes(str_replace("'","''",$_POST['commento']));  //serve per inserire correttamente gli apici in SQL server 
  $id=$_GET['id'];
  $menubar= new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE","index.php?modulo=computer&app=PC&id=$id","");
  if ($azione=="add")
  	 include ("insertxml.php");

  if ($azione=="del") 
  	 {
  	 //cancello SOLO il record, non il file.
     //controllo vs SQL injection
     //if (preg_match("/a{1,}/i",$codice))
  	    $db->query("delete from monitorxml where ID='$codice'");
  	 }
  if (($azione=="add")||($azione=="del")||($azione=="")) 
  	{
  	$menubar->add("AGGIUNGI MONITORAGGIO","","eseguiAzione('write','frmDocumenti')");
  	if (verificalivello(0))
      $menubar->add("ELIMINA SELEZIONATO","","eseguiAzione('del','frmDocumenti')");
  	$menubar->add("VISUALIZZA","","eseguiAzione('view','frmDocumenti')");
  	}
  if ($azione=="write") 
  	{
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmDocumenti')");
  	}
  if ($azione=="view") 
  	{
  	$menubar->add("TORNA A ELENCO","","eseguiAzione('','frmDocumenti')");
  	}
  $menubar->show();	 
  stampatitolo("ELENCO MONITORAGGI ESEGUITI PER LA MACCHINA #$id");
  echo "<form action=\"index.php?modulo=gestionexml&app=PC&id=$id\" method=\"post\" enctype=\"multipart/form-data\" id=\"frmDocumenti\">\n"; 
  echo "<input type=\"hidden\" name=\"azione\">\n" ;
  //parte per la visualizzazione. 
  if (($azione=="add")||($azione=="del")||($azione=="")) 
    include ("list.php");
  if ($azione=="write") 
    include ("form.php");
  echo "</form>\n" ;
  if ($azione=="view")
    { 
    $cont=0;
    $riga=$db->get_row("select XML  from monitorxml where id='$codice'");
    $xmldoc =& new DOMIT_lite_Document();
    $success = $xmldoc->parseXML(gzuncompress(base64_decode($riga->XML)));
    $tree=new clstree;
    $tree->readXMLmonitor($xmldoc->documentElement);
    printf( "<a href=\"#\" onclick=\"javascript:d.openAll()\">espandi tutto</a> - <a href=\"#\" onclick=\"javascript:d.closeAll()\">chiudi tutto</a>" );
 
    $tree->dtree(true,$cont);
    }
  printf( "Scarica da <a href=\"lib/monitor-install.exe\">QUI</a> l programma di monitoraggio (file autoestraente) \n" );
	}

?>


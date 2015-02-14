<?
if (verificalivello(3))
	{
  //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
  //recupero e controllo le eventuali variabili in  ingresso dalla form 
  @$azione=$_POST['azione'];
  @$codice=(int)$_POST['codice'];
  @$data=$_POST['datag'].'/'.$_POST['datam'].'/'.$_POST['dataa']; //costruisco la data
  @$commento=stripslashes(str_replace("'","''",$_POST['commento']));  //serve per inserire correttamente gli apici in SQL server 
  $id=$_GET['id'];
  $menubar= new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE","index.php?modulo=computer&app=PC&id=$id","");
  
  if ($azione=="add")
  	 include ("insertdoc.php");
  if ($azione=="del") 
  	 {
  	 //cancello SOLO il record, non il file.
  	 $db->query("delete from documenti where ID=$codice");
  	 }
  if (($azione=="add")||($azione=="del")||($azione=="")) 
  	{
  	$menubar->add("AGGIUNGI DOCUMENTAZIONE","","eseguiAzione('write','frmDocumenti')");
  	$menubar->add("ELIMINA SELEZIONATO","","eseguiAzione('del','frmDocumenti')");
  	}
  if ($azione=="write") 
  	{
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmDocumenti')");
  	}
  $menubar->show();	 
  stampatitolo("ELENCO DOCUMENTAZIONE PER LA MACCHINA #$id");
  echo "<form action=\"index.php?modulo=gestionedoc&app=PC&id=$id\" method=\"post\" enctype=\"multipart/form-data\" id=\"frmDocumenti\">\n"; 
  echo "<input type=\"hidden\" name=\"azione\">\n" ;
  //parte per la visualizzazione. 
  if (($azione=="add")||($azione=="del")||($azione=="")) 
    include ("list.php");
  if ($azione=="write") 
    include ("form.php");
  echo "</form>\n" ;
	}

?>


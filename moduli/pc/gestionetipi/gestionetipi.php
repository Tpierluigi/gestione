<?php
if (verificalivello(3))
	{
  @$id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  @$tipo=(int)$_POST['tipo'];
  @$descrizione=$_POST['descrizione'];
  
  if ($azione=="add") 
  	 $db->query("insert into tipiapparecchi	(descrizione) values ('$descrizione')");
  if ($azione=="del") 
  	 $db->query ("delete from tipiapparecchi where ID=$tipo ");
  
  printf( "<form action=\"index.php?modulo=gestionetipi&app=PC&id=$id\" method=\"post\" id=frmTipi>" );
  printf( "<input type=hidden name=azione>\n" );
  	 
  $menubar= new barramenu;
  
  $menubar->add("TORNA ALLA CONFIGURAZIONE PC","index.php?modulo=computer&app=PC&id=$id","");
  if ($azione=='write')
    {
    $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmTipi')");
    $menubar->add("ANNULLA","","eseguiAzione('','frmTipi')");
    }
  else
  	{
    $menubar->add("AGGIUNGI TIPO","","eseguiAzione('write','frmTipi')");
    $menubar->add("ELIMINA","","eseguiAzione('del','frmTipi')");
  	}
  
  $menubar->show();
  
  
  stampatitolo("GESTIONE TIPI APPARECCHIATURA");
  
  if (($azione=="")||($azione=="del")||($azione=="add")) 
  	include ("elenco.php");
  if ($azione=="write") 
  	echo "DESCRIZIONE: <input type=\"text\" name=\"descrizione\" size=30>";
  
  
  printf ("</form>");
	}
?>

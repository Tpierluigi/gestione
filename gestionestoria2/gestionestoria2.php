<?php
include ("check.php");
include ("gestionestoria2.funzgenerali.php");
verificalivello(0);
include ("intpagina.php");
$id=(int)$_GET['id'];
$conn=mssql_connect("srvlotti","sa","");
mssql_select_db("PC");
@$azione=$_POST['azione'];
@$codice=(int)$_POST['codice'];
@$data=$_POST['datag'].'/'.$_POST['datam'].'/'.$_POST['dataa'];
@$evento=stripslashes(str_replace("'","''",$_POST['evento']));

$menubar=new barramenu;
$menubar->add("TORNA ALLA CONFIGURAZIONE PC","computer.php?id=$id","");

switch ($azione)
	{
	case "add" :
/*
		$cond['campi'][]="apparecchio";
		$cond['campi'][]="data";
		$cond['valori'][]=$id;
		$cond['valori'][]="convert(datetime,'$data',103)";
		EseguiAggCampi("apparecchi","posizione","'$evento'",$cond,"del");
*/
  	mssql_query ("insert into cronologia(apparecchio,data,evento) values ($id,convert(datetime,'$data',103),'$evento')");
  	break;
	case "del" : 
  	mssql_query ("delete from cronologia where ID=$codice");
  	break;
	case "write" : 
		break;
	case "";
	}
if(($azione=="add")||($azione=="del")||($azione==""))
	{ 
  $menubar->add("AGGIUNGI EVENTO","","eseguiAzione('write','frmEventi')");
  $menubar->add("ELIMINA","","eseguiAzione('del','frmEventi')");
	}
if($azione=="write2")
	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmEventi')");
if($azione=="write1")
	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('write1','frmEventi')");

$menubar->show();
stampatitolo("GESTIONE CRONOLOGIA PER LA MACCHINA #$id");
echo "<form action=\"gestionestoria2.php?id=$id\" method=\"post\" id=\"frmEventi\">";
printf( "<input type=\"hidden\" name=\"azione\">\n" );

if(($azione=="add")||($azione=="del")||($azione==""))
	{ 
	include ("gestionestoria2.list.php");
	}
if($azione=="write1")
	{
	include ("gestionestoria2.form1.php");
	}
if($azione=="write2")
	{
	include ("gestionestoria2.form2.php");
	}
echo "</form>";
include ("piepagina.php");
?>

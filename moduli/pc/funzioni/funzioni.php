<?php
if (verificalivello(3))
	{
  @$azione=$_POST['azione'];
  @$chiave=$_POST['chiave'];
  @$funzioni=(int)$_POST['funzioni'];
  @$listafunzioni=(int)$_POST['listafunzioni'];
  $id=(int)$_GET['id'];
  switch($azione)
  	{
  	case "add" : 
			$newordine=TrovaPrimoIDLibero("select ordine from pc_funzioni where id_apparecchi=$id","ordine");
  		$db->query("insert into pc_funzioni values ($id,$listafunzioni,$newordine)");
  		break;
  	case "del" : 
			$partichiave=split("-",$chiave);
			$id_apparecchi_del=(int)$partichiave[0];
			$id_pc_tipifunzione_del=(int)$partichiave[1];
			$ordine_del=(int)$partichiave[2];
  		$db->query("delete from pc_funzioni where id_apparecchi=$id_apparecchi_del and id_pc_tipifunzione=$id_pc_tipifunzione_del and ordine=$ordine_del");
  		break;
  	}
  		
  
  $menubar=new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE PC","index.php?modulo=computer&app=PC&id=$id","");
  
  if(($azione=="add")||($azione=="del")||($azione=="upd")||($azione==""))
  	{ 
    $menubar->add("AGGIUNGI NUOVA FUNZIONE","","eseguiAzione('write','frmFnc')");
    $menubar->add("ELIMINA","","eseguiAzione('del','frmFnc')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmFnc')");
  
  $menubar->show();
  stampatitolo( "FUNZIONI DEL PC - MACCHINA # $id\n" );
  
  
  echo "<form action=\"index.php?modulo=funzioni&app=PC&id=$id\" method=\"post\" id=\"frmFnc\">";
  printf( "<input type=\"hidden\" name=\"azione\" value=\"del\">" );
  
  if(($azione=="add")||($azione=="del")||($azione==""))
  	include ("list.php");
  if($azione=="write")
  	include ("form.php");
  
  echo "</form>";
	}
?>


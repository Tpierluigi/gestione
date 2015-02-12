
<?
if (verificalivello(3))
	{
  
  $id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  @$codice=(int)$_POST['codice'];
 // @$data=$_POST['dataa'].'-'.$_POST['datam'].'-'.$_POST['datag'];
	@$data=explode("/",$_POST['dataevt']);
	$data="'".$data[2].'-'.$data[1].'-'.$data[0]."'";
	//se la data è errata la mette uguale a oggi
	$check=preg_match("/\d\d\d\d-\d\d?-\d\d?/",$data);
	if (strtotime($data)==1) 
		$data="now()";
  @$evento=stripslashes(str_replace("'","''",$_POST['evento']));
  
  $menubar=new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE PC","index.php?modulo=computer&app=PC&id=$id","");
  
  switch ($azione)
  	{
  	case "add" : 
    	$db->query("insert into cronologia(apparecchio,data,evento) values ($id,$data,'$evento')");
    	break;
  	case "del" : 
    	$db->query ("delete from cronologia where ID=$codice");
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
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmEventi')");
  
  $menubar->show();
  stampatitolo("GESTIONE CRONOLOGIA PER LA MACCHINA #$id");
  echo "<form action=\"index.php?modulo=gestionestoria&app=PC&id=$id\" method=\"post\" id=\"frmEventi\">";
  printf( "<input type=\"hidden\" name=\"azione\">\n" );
  
  if(($azione=="add")||($azione=="del")||($azione==""))
  	{ 
  	include ("list.php");
  	}
  if($azione=="write")
  	{
  	include ("form.php");
  	}
  
  echo "</form>";
	}
?>

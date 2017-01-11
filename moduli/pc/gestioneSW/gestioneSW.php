<?php
if (verificalivello(3))
	{
  @$azione=$_POST['azione'];
  @$software=(int)$_POST['software'];
  @$listasoftware=(int)$_POST['listasoftware'];
  @$seriale=$_POST['seriale'];
  @$versione=$_POST['fVersione'];
  @$licenza=$_POST['fLicenza'];
  $id=(int)$_GET['id'];
  switch($azione)
  	{
  	case "add" : 
      //NOTA: la variabile licenza se arriva dalla form è un valore; se arriva dalla lista è un array
  		$db->query("insert into elencosw(computer,software,versione,licenza)	values ($id,$listasoftware,'$versione',$licenza)");
  		break;
  	case "del" : 
  		$db->query("delete from elencosw where computer=$id and software=$software");
  		printf( "<div class=\"statusbarf\">cancellazione eseguita</div>" );
      break;
  	case "upd" :
      //fermete($_POST['fLicenza']);
      foreach ($versione as $swcode=>$swver)
        {
    	  $db->query("update elencosw set Versione='$swver' where computer=$id and software=$swcode");
    	  $swlic=(int)$licenza[$swcode];
        $db->query("update elencosw set Licenza=$swlic where computer=$id and software=$swcode");
        }
      //fermete ($licenza);
      printf( "<div class=\"statusbarf\"> aggiornamento versioni e licenze eseguito </div>" );
  		break;
  	}
  		
  
  $menubar=new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE PC","index.php?modulo=computer&app=PC&id=$id","");
  
  if(($azione=="add")||($azione=="del")||($azione=="upd")||($azione==""))
  	{ 
    $menubar->add("AGGIUNGI NUOVO SOFTWARE","","eseguiAzione('write','frmSoft')");
    $menubar->add("MODIFICA VERSIONE","","eseguiAzione('upd','frmSoft')");
    $menubar->add("ELIMINA","","eseguiAzione('del','frmSoft')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmSoft')");
  
  $menubar->show();
  stampatitolo( "ELENCO SOFTWARE INSTALLATI - MACCHINA # $id\n" );
  
  
  echo "<form action=\"index.php?modulo=gestioneSW&app=PC&id=$id\" method=\"post\" id=\"frmSoft\">";
  printf( "<input type=\"hidden\" name=\"azione\" value=\"del\">" );
  
  if(($azione=="add")||($azione=="del")||($azione=="")||($azione=="upd"))
  	include ("list.php");
  if($azione=="write")
  	include ("form.php");
  
  echo "</form>";
	}
?>


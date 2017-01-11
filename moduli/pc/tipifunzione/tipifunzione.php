<?php

if (verificalivello(2))
	{

  @$id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  @$id_tipo=(int)$_POST['id_tipo'];
  @$funzione=$_POST['funzione'];
  
	$ultimo=$db->get_row("select max(id)+1 as val from pc_tipifunzione");
	$newid=$ultimo->val;
	
  if ($azione=="add") 
  	 $db->query ("insert into pc_tipifunzione	values ($newid,'$funzione')");
  if ($azione=="del") 
  	 $db->query ("delete from pc_tipifunzione where ID=$id_tipo ");
  
  $menubar=new barramenu;
  if(($azione=="add")||($azione=="del")||($azione=="upd")||($azione==""))
  	{ 
    $menubar->add("NUOVA FUNZIONE","","eseguiAzione('write','frmTipiFunzione')");
    $menubar->add("ELIMINA","","eseguiAzione('del','frmTipiFunzione')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmTipiFunzione')");
  	 
  $menubar->show();
  
  
  stampatitolo("ELENCO FUNZIONI DEFINITW");
  
  echo "<form action=\"index.php?modulo=tipifunzione&app=PC&id=$id\" method=\"post\" id=\"frmTipiFunzione\">";
  printf( "<input type=\"hidden\" name=\"azione\">" );
  	 
  if(($azione=="add")||($azione=="del")||($azione==""))
  	{
    $i=0;
    $dati=$db->get_results("SELECT ID,funzione FROM pc_tipifunzione ORDER BY funzione");
  	printf( "<div align=\"center\"><div id=\"scroller\">" );
    echo "<table class=\"software\"> ";
    echo "<tr><th></th><th align='left'>CODICE</th><th align='left'>funzione</th></tr>";
    foreach ($dati as $riga)
    				{
    				if (($i%2)==0) $stile="pari"; else $stile="dispari";
    				echo "<tr>";
    				echo "			<td class=\"$stile\"><input type=\"radio\" name=\"id_tipo\" value=\"$riga->ID\"></td>";
    				echo "			<td class=\"$stile\">$riga->ID</td>";
    				echo "			<td class=\"$stile\">$riga->funzione</td>";
    				echo "</tr>";
    				$i++;
   				}
    echo "</table>";
  	printf( "</div></div>" );
  	}
  if($azione=="write")
  	{
    echo "<h3>Aggiungi nuova fuzione</h3>";
    echo "  funzione: <input type=\"text\" name=\"funzione\" size=50>";
  	}
  echo "</form>";
	}
?>

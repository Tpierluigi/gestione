<?php

if (verificalivello(2))
	{

  @$id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  @$codSW=(int)$_POST['codSW'];
  @$codsez=(int)$_POST['codsez'];
  @$Descrizione=$db->escape($_POST['Descrizione']);
  @$tipologia=$db->escape($_POST['tipologia']);
  
  if ($azione=="add") 
  	 $db->query ("insert into software	(Descrizione,tipologia, parent) values ('$Descrizione','$tipologia', $codsez)");
  if ($azione=="addcat")
     { 
     $esiste=$db->get_row("select * from software where descrizione='$Descrizione'");
     if (!$esiste) 
  	    $db->query("insert into software	(Descrizione,parent) values ('$Descrizione',0)");
     else 
        echo "<div class='statusbarerr' ><h1> CATEGORIA GIA' PRESENTE!!</h1></div> ";
     }
  if ($azione=="del") 
  	 $db->query ("delete from software where ID=$codSW ");
  
  $menubar=new barramenu;
  if(($azione=="add")||($azione=="addcat")||($azione=="del")||($azione=="upd")||($azione==""))
  	{ 
    $menubar->add("AGGIUNGI NUOVA CATEGORIA","","eseguiAzione('writecat','frmPacchetti')");
    $menubar->add("AGGIUNGI NUOVO PACCHETTO","","eseguiAzione('write','frmPacchetti')");
    $menubar->add("ELIMINA","","eseguiAzione('del','frmPacchetti')");
  	}
  if($azione=="write")
    {
    $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmPacchetti')");
    $menubar->add("ANNULLA","","eseguiAzione('','frmPacchetti')");
    }
  if($azione=="writecat")
    {
    $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmPacchetti')");
    $menubar->add("ANNULLA","","eseguiAzione('','frmPacchetti')");
    }
 	 
  $menubar->show();
  
  
  stampatitolo("ELENCO PACCHETTI DEFINITI");
  
  echo "<form action=\"index.php?modulo=gestionetipisw&app=PC&id=$id\" method=\"post\" id=\"frmPacchetti\">";
  printf( "<input type=\"hidden\" name=\"azione\">" );
  	 
  if(($azione=="add")||($azione=="addcat")||($azione=="del")||($azione==""))
  	{
    $i=0;
    $dati=$db->get_results("SELECT ID,Descrizione,tipologia,parent FROM software where parent >0 ORDER BY Descrizione");
  	printf( "<div align=\"center\">" );
  	printf( "<div id=\"scroller\">" );
    echo "<table class=\"software\"> ";
    echo "<tr><th></th><th align='left'>CODICE</th><th align='left'>Descrizione</th><th>CATEGORIA</th></tr>";
    foreach ($dati as $riga)
    				{
    				if (($i%2)==0) $stile="pari"; else $stile="dispari";
    				echo "<tr>";
    				echo "			<td class=\"$stile\"><input type=\"radio\" name=\"codSW\" value=\"$riga->ID\"></td>";
    				echo "			<td class=\"$stile\">$riga->ID</td>";
    				echo "			<td class=\"$stile\">$riga->Descrizione</td>";
    				echo "			<td class=\"$stile\">$riga->tipologia</td>";
    				echo "			<td class=\"$stile\">";
            $famiglia=$db->get_row("SELECT Descrizione FROM software where id=$riga->parent");
            echo "<b>$famiglia->Descrizione</b>";
            echo "			</td>";
    				echo "</tr>";
    				$i++;
   				}
    echo "</table>";
  	printf( "</div>" );
  	}
  if($azione=="write")
  	{
    $sezioni=$db->get_results("SELECT ID,Descrizione FROM software where parent=0 ORDER BY Descrizione");
    printf( "<div class=generico>" );
    echo "<h3>Aggiungi nuovo pacchetto</h3>";
    printf( "    <table>\n" );
    printf( "    <tr>\n" );
    echo "  <td>Descrizione: </td><td><input type=\"text\" name=\"Descrizione\" size=30></td>";
    printf( "    </tr>\n" );
    printf( "    <tr>\n" );
    echo "  <td>Tipologia: </td><td><input type=\"text\" name=\"tipologia\" size=60></td>";
    printf( "    </tr>\n" );
    printf( "    <tr>\n" );
    echo "  <td>Sezione: </td><td><select name=\"codsez\">";
    foreach ($sezioni as $sezione)
      {
      printf( "      <option value=$sezione->ID>$sezione->Descrizione</option>\n" );
      }
    echo "  </select></td>";
    printf( "    </tr>\n" );
    printf( "    <table>\n" );
    printf( "</div>\n" );
  	}
  if($azione=="writecat")
  	{
    printf( "<div class=generico>" );
    echo "<h3>Aggiungi nuova categoria </h3>";
    echo "  Categoria: <input type=\"text\" name=\"Descrizione\" size=30><br>";
    printf( "</div>\n" );
    printf( "</div>\n" );
    }
  echo "</form>";
	}
?>

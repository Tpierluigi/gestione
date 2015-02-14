<?

if (verificalivello(2))
	{

  @$azione=$_POST['azione'];
  @$idpaese=$_POST['idpaese'];
  @$Descrizione=$_POST['Descrizione'];
  @$icona=$_POST['icona'];
  
  if ($azione=="add") 
  	 $db->query ("insert into paesi	(id_paese,Descrizione,icona) values ('$idpaese','$Descrizione','$icona')");
  
  $menubar=new barramenu;
  if(($azione=="add")||($azione=="upd")||($azione==""))
  	{ 
    $menubar->add("NUOVO PAESE","","eseguiAzione('write','frmPaesi')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmPaesi')");
  	 
  $menubar->show();
  
  
  stampatitolo("PAESI INSERITI");
  
  echo "<form action=\"index.php?modulo=paesi\" method=\"post\" id=\"frmPaesi\">";
  printf( "<input type=\"hidden\" name=\"azione\">" );
  	 
  if(($azione=="add")||($azione==""))
  	{
    $i=0;
    $dati=$db->get_results("SELECT * FROM paesi ORDER BY descrizione");
  	printf( "<div align=\"center\">" );
    echo "<table class=\"software\"> ";
    echo "<tr><th align='left'>CODICE</th><th align='left'>Descrizione</th></tr>";
    foreach ($dati as $riga)
    				{
    				if (($i%2)==0) $stile="pari"; else $stile="dispari";
    				echo "<tr>";
    				echo "			<td class=\"$stile\">$riga->id_paese</td>";
    				echo "			<td class=\"$stile\">$riga->descrizione</td>";
    				echo "			<td class=\"$stile\"><img src=\"$riga->icona\"></td>";
    				echo "</tr>";
    				$i++;
   				}
    echo "</table>";
  	printf( "</div>" );
  	}
  if($azione=="write")
  	{
    echo "<h3>Nuovo Paese</h3>";
    echo "  Codice: <input type=\"text\" name=\"idpaese\" size=2 maxlenght=2><br>";
    echo "  Descrizione: <input type=\"text\" name=\"Descrizione\" size=30><br>";
    echo "  icona: <input type=\"text\" name=\"icona\" value=\"icons/flags/unknown.gif\" size=30>";

  	}
  echo "</form>";
	}
?>

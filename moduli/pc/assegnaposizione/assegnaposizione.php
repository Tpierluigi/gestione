<?

if (verificalivello(3))
	{

  @$id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  @$funzione=$_POST['funzione'];
  
	$ultimo=$db->get_row("select max(id)+1 as val from pc_tipifunzione");
	$newid=$ultimo->val;
	
  if ($azione=="add") 
  	 $db->query ("insert into pc_tipifunzione	values ($newid,'$funzione')");
  if ($azione=="del") 
  	 $db->query ("delete from pc_tipifunzione where ID=$id_tipo ");
  
  $menubar=new barramenu;
  if ($azione!="assign")
		$menubar->add("ASSEGNA","","eseguiAzione('assign','frmTipiFunzione')");
  $menubar->add("ANNULLA","index.php?modulo=computer&app=PC&id=$id","");
  $menubar->show();
  
  
  stampatitolo("POSIZIONI DEFINITE");
  
  echo "<form action=\"index.php?modulo=assegnaposizione&app=PC&id=$id\" method=\"post\" id=\"frmTipiFunzione\">";
  printf( "<input type=\"hidden\" name=\"azione\">" );
  $i=0;
  $dati=$db->get_results("
	SELECT paesi.descrizione as paese,paesi.id_paese,aziende.id_azienda,aziende.sito,impianti.*
	FROM 
		impianti inner join aziende on impianti.id_aziende=aziende.id_azienda
		inner join paesi on aziende.id_paesi=paesi.id_paese
	ORDER BY paesi.descrizione,sito,impianti.descrizione");

/*  printf( "d.add(0,-1,'My example tree');\n" );
  printf( "d.add(1,0,'Node 1','example01.html');\n" );
  printf( "d.add(2,0,'Node 2','example01.html');\n" );
  printf( "d.add(3,1,'Node 1.1','example01.html');\n" );
  printf( "d.add(4,0,'Node 3','example01.html');\n" );
  printf( "d.add(5,3,'Node 1.1.1','example01.html');\n" );
  printf( "d.add(6,5,'Node 1.1.1.1','example01.html');\n" );
  printf( "d.add(7,0,'Node 4','example01.html');\n" );
  printf( "d.add(8,1,'Node 1.2','example01.html');\n" );
  printf( "d.add(9,0,'My Pictures','example01.html','Pictures I\\'ve taken over the years','','','img/imgfolder.gif');\n" );
  printf( "d.add(10,9,'The trip to Iceland','example01.html','Pictures of Gullfoss and Geysir');\n" );
  printf( "d.add(11,9,'Mom\\'s birthday','example01.html');\n" );
  printf( "d.add(12,0,'Recycle Bin','example01.html','','','img/trash.gif');\n" );
*/
	$cont=0;
/*	
  foreach ($dati as $riga)
		{
	}
*/
		

	fermete ($dati,false);

$root=new clsTree;
$root->value="Sedi San Benedetto";

foreach ($dati as $riga)
	{
	if (!isset ($root->subtree[$riga->id_paese]))
		{
		$root->subtree[$riga->id_paese]=new clsTree;
		$root->subtree[$riga->id_paese]->value=$riga->paese;
		}
	if (!isset ($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]))
		{
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]=new clsTree;
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->value=$riga->sito;
		}
	if (!isset ($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]))
		{
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]=new clsTree;
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->value=$riga->descrizione;
		}
	}


printf( "	<div class=\"finestrina\">\n" );
	$root->dtree(true,$cont);	
printf( "</div>\n" );
	/*
	$sedi=new clsTree;
  foreach ($dati as $riga)
		{
		$sedi->subtree[$riga->id_paese]=new clsTree;
		$sedi->subtree[$riga->id_paese]->root=$riga->paese
		
		$sedi[$riga->id_paese][$riga->id_azienda][$riga->progressivoimpianto]="$riga->id_aziende - $riga->progressivoimpianto";
	$cont=0;
	for($contpaese=0;$contpaese<sizeof($sedi);$contpaese++)
		{
		$descpaese=$sedi[]
		printf( "d.add($cont,-1,'$','example01.html');\n" );
		foreach ($paese as $azienda)
				foreach ($azienda as $impianto)
					  printf( "d.add($cont,0,'Node 1','example01.html');\n" );
		*/

/*
	fermete ($sedi);		
  echo "<table class=\"software\"> ";
  echo "<tr><th></th><th align='left'>PAESE</th><th align='left'>funzione</th></tr>";
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
	printf( "</div>" );
  if($azione=="assign")
  	{
    echo "<h3>POSIZIONE ASSEGNATA</h3>";
  	}
  */
	echo "</form>";
	}
?>

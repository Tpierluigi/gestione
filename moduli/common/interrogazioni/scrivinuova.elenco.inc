<?

// 13.7.04 HO DOVUTO CAMBIARE IL NOME DELLA FORM IN 'ELENCO' ALTRIMENTI NON AGGIUNGEVA
// IL TESTO 

$strsql ="";
$strsql.="select * from elencocolonne "; 
$strsql.="where table_name <> 'Utenti' "; 
$strsql.="and table_name <> 'AdminScript' "; 
$strsql.="and table_name not like 'sys%' ";
$strsql.="and table_name not like 'dt%' ";
$strsql.="order by table_name, column_name";
//echo $strsql;
$dati=$db->get_results($strsql);

foreach ($dati as $riga)
	$albero[$riga->TABLE_NAME][]=$riga->COLUMN_NAME;

while ($livello = each($albero))
	{
	printf( "<img src='icons/freccia.png' onclick=switchview('%s',0,%d)>\n",$livello['key'],sizeof($livello['value'])-1 );
	printf( "<b>".$livello['key']."</b><ul class='query'>" );
	$i=0;
	foreach ($livello['value'] as $campo)
		print( "<li class='query' id='".$livello['key'].$i++."' onclick='document.elenco.fTestoQuery.value=document.elenco.fTestoQuery.value+\"".$livello['key'].".".$campo." \"'>$campo</li>\n" );
	print( "</ul>\n" );
	}
reset ($albero);
print( "<script>" );

while ($livello = each($albero))
	{
	$i=0;
	foreach ($livello['value'] as $campo)
		printf( "document.getElementById('%s').style.display='none';\n",$livello['key'].$i++ );
	}
print( "</script>" );
?>

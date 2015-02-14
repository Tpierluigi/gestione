<?
unset($dati);
$dati=$db->get_results("SELECT  * from pc_tipifunzione order by funzione");
printf( "<h3>AGGIUNGI NUOVA FUNZIONE</h3>\n" );
printf( "<p>\n" );
printf( "FUNZIONE:\n" );
printf( "<select name=\"listafunzioni\">\n" );
foreach ($dati as $riga)
	printf( "	<option value=\"$riga->ID\">$riga->funzione</option>\n" );
printf( "</select>\n" );
printf( "</p>\n" );

?>


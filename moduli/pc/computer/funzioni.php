<?php
printf( "	<div id=\"sceltapos\" style=\"top:200px;left:500px; \">\n" );
printf( "	<div><input type='radio' name=\"Posizione\" value=\"0\">Seleziona..</div>\n" );
  $dati=$db->get_results("SELECT 	*	FROM pc_tipifunzione ORDER BY funzione");

foreach ($dati as $riga)
	printf( "	<div><input type='radio'name=\"Posizione\" value=\"$riga->ID\">$riga->funzione</div>\n" );
printf( "</div>\n" );

?>

<?php
	 $id=(int)$_POST['idquery'];
	 $DatiQuery=$db->get_row("select * from queryutente where id=$id");
	 echo "<br><b class=query>DESCRIZIONE DELLA QUERY</b>";
	 echo $DatiQuery->Descrizione.'<br>';
	 echo "<br><b class=query>TESTO DELLA QUERY</b>";
	 echo $DatiQuery->Testo.'<br>';
	 echo "<br><b class=query>RISULTATO</b>";
	 $dati=$db->get_results($DatiQuery->Testo,ARRAY_A);
	 if (sizeof($dati)>0)
	 		{
			print( "<table cellpadding=4> \n" );
			print( "<tr>\n" );
      $colonne=$dati[0];
			foreach ($colonne as $sNomeColonna => $valore)
				print( "<th>$sNomeColonna</th> \n" );
			print( "</tr> \n" );
			foreach ($dati as $riga)
				{
  			print( "<tr> \n" );
  			foreach ($riga as $valore)
  				print( "<td>$valore</td> \n" );
  			print( "</tr> \n" );
				}
			print( "</table>\n" );
			}
	 else
			print ("<h3>NESSUN RISULTATO</h3>");

?>
<?
$dati=$db->get_results("
SELECT aziende.id_azienda, paesi.descrizione, 
    aziende.sito
FROM paesi INNER JOIN
    aziende ON 
    paesi.id_paese = aziende.id_paesi
");
if (sizeof ($dati)>0)
	{
	printf( "<div align=\"center\">" );
  echo "<table border=0 class=\"software\">";
  echo "<tr><th>ID</th><th>SITO</th><th>NAZIONE</th></tr>";
  $i=0;
  foreach ($dati as $riga)
  				{
  				if (($i%2)==0) $stile="pari"; else $stile="dispari";
  				echo "<tr>";
  				echo "			<td class=\"$stile\">$riga->id_azienda</td>";
  				echo "			<td class=\"$stile\">$riga->sito</td>";
  				echo "			<td class=\"$stile\">$riga->descrizione</td>";
  				echo "</tr>";
  				$i++;
  				}
  echo "</table>";
	printf( "<div>" );

	}
else
	printf( "<h3>NESSUNA SEDE PRESENTE</h3><hr noshade>	\n" );
?>
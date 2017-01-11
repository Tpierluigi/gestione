<?php
$query="
SELECT  pc_funzioni.*, pc_tipifunzione.funzione 
FROM pc_funzioni INNER JOIN pc_tipifunzione ON pc_tipifunzione.id = pc_funzioni.id_pc_tipifunzione
where pc_funzioni.id_apparecchi=$id
ORDER BY pc_funzioni.ordine
";
//fermete($query);
$dati=$db->get_results($query);
if (sizeof ($dati)>0)
	{
  echo "<table border=0 class=\"software\">";
  echo "<tr><th></th><th>ORDINE</th><th>FUNZIONE</th></tr>";
  $i=0;
  foreach ($dati as $riga)
  				{
  				if (($i%2)==0) $stile="pari"; else $stile="dispari";
					$link=$riga->id_apparecchi."-".$riga->id_pc_tipifunzione."-".$riga->ordine;
  				echo "<tr>";
  				echo "			<td class=\"$stile\"><input type=\"radio\" name=\"chiave\" value=\"$link\"></td>";
  				echo "			<td class=\"$stile\">$riga->ordine</td>";
  				echo "			<td class=\"$stile\">$riga->funzione</td>";
  				echo "</tr>";
  				$i++;
  				}
  echo "<tr><td colspan=3 align=\"center\">";
	echo "</td></tr>";
  echo "</table></td></tr></table>";
	}
else
	printf( "<h3>FUNZIONI ANCORA DA DEFINIRE</h3><hr noshade>	\n" );
?>
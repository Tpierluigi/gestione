<?
$dati=$db->get_results("
SELECT  elencosw.software, elencosw.Licenza, elencosw.Versione, software.Descrizione, software.ID
FROM elencosw INNER JOIN software ON elencosw.software = software.ID where elencosw.computer=$id
ORDER BY software.Descrizione
");
if (sizeof ($dati)>0)
	{
  printf( "<div align=\"center\"><div id=\"scroller\">\n" );
  echo "<table border=0 class=\"software\">";
  echo "<tr><th></th><th>DESCRIZIONE</th><th>VERSIONE</th><th>LICENZA</th></tr>";
  $i=0;
  foreach ($dati as $riga)
  				{
  				if (($i%2)==0) $stile="pari"; else $stile="dispari";
  				if ($riga->Licenza) $checked="checked"; else $checked="";
  				echo "<tr>";
  				echo "			<td class=\"$stile\"><input type=\"radio\" name=\"software\" value=\"$riga->software\"></td>";
  				echo "			<td class=\"$stile\">$riga->Descrizione</td>";
  				echo "			<td class=\"$stile\"><input type=\"text\" name=\"fVersione[".$riga->software."]\" value=\"$riga->Versione\"></td>";
  				echo "			<td class=\"$stile\"><input type=\"checkbox\" name=\"fLicenza[".$riga->software."]\" value=1 $checked></td>";
  				echo "</tr>";
  				$i++;
  				}
  echo "<tr><td colspan=3 align=\"center\">";
	echo "</td></tr>";
  echo "</table></td></tr></table>";
	echo "</div></div>";
  }
else
	printf( "<h3>NESSUN SOFTWARE INSTALLATO</h3><hr noshade>	\n" );
?>
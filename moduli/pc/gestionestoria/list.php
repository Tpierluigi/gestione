<?php
$dati=$db->get_results("SELECT  ID,date_format(data,'%d/%m/%Y') as datac, evento  FROM cronologia WHERE apparecchio=$id ORDER BY data desc,id desc");

if (sizeof($dati)>0)
	{
  echo "<table class=\"software\" > ";
  echo "<tr><th></th><th>DATA</th><th>EVENTO</th></tr>";
  $i=0;
  foreach ($dati as $riga)
		{
		if (($i%2)==0) $stile="pari"; else $stile="dispari";
		echo "<tr>";
		echo "			<td class=\"$stile\"><input type=\"radio\" name=\"codice\" value=\"$riga->ID\"></td>";
		echo "			<td class=\"$stile\">$riga->datac</td>";
		echo "			<td class=\"$stile\">$riga->evento</td>";
		echo "</tr>";
		$i++;
		}
	echo "</table>";
	}				
else
	echo "<h2>NON CI SONO EVENTI</h2>";

?>
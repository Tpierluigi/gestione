<?
$dati=$db->get_results("SELECT ID,descrizione FROM tipiapparecchi ORDER BY Descrizione");
echo "<div align=\"center\"><div id=\"scroller\">";
echo "<table class=\"software\"> ";
echo "<tr><th></th><th align='left'>CODICE</th><th align='left'>DESCRIZIONE</th></tr>";
if (sizeof($dati)>0)
  {
  foreach ($dati as $riga)
    {
    if (($i%2)==0) $stile="pari"; else $stile="dispari";
    echo "<tr>";
    echo "			<td class=\"$stile\"><input type=\"radio\" name=\"tipo\" value=\"$riga->ID\"></td>";
    echo "			<td class=\"$stile\">$riga->ID</td>";
    echo "			<td class=\"$stile\">$riga->descrizione</td>";
    echo "</tr>";
    $i++;
    }
  }
else
  {
  echo "<tr>";
  echo "			<td colspan=3><h2 align=center>NON CI SONO RISULTATI</h2></td>";
  echo "</tr>";
  }
echo "</table>";
printf( "</div></div>\n" );
?>
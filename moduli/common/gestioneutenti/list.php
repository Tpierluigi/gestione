<?
$dati=$db->get_results("SELECT * FROM utenti ORDER BY Username");
echo "<p align=\"center\"><table border=\"1\" ><tr><td><table> ";
echo "<tr><th align='left'>User Name</th><th></th><th align='left'></th></tr>";
foreach ($dati as $riga)
  {
  echo "<tr>";
  echo "			<td>$riga->UserName</td>";
  echo "			<td><a href=\"index.php?modulo=gestioneutenti&utente=$riga->ID&azione=edit\">Modifica</a></td>";
  echo "			<td><a href=\"index.php?modulo=gestioneutenti&utente=$riga->ID&azione=confirm\">Elimina</a></td>";
  echo "</tr>";
  }

echo "</table></td></tr></table>";
?>
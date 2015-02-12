<?
  echo "<hr><h3>Aggiungi nuovo utente</h3>";
  echo "<form action=\"index.php?modulo=gestioneutenti&azione=add\" method=\"post\"><table>"; 
  echo "    <tr><td align=\"right\">User Name</td>";
  echo "    <td><input type=\"text\" name=\"username\" size=20></td></tr>";
  echo "    <tr><td align=\"right\">password</td>";
  echo "    <td><input type=\"password\" name=\"password\" size=20></td></tr>";
  echo "    <tr><td align=\"right\">Riscrivi la Password</td>";
  echo "    <td><input type=\"password\" name=\"checkpassword\" size=20></td></tr>";
  echo "    <tr><td align=\"right\">livello</td>";
  echo "    <td><input type=\"text\" name=\"livello\" size=2></td></tr>";
  echo "    <tr><td colspan=2><input type=\"submit\" value=\"Aggiungi\"></td></tr>";
  echo "</table></form></p>";
?>
<?
/*
sezione che mostra la form di modifica di un utente del gestionale
vengono estratti i dati utente e caricati sulla form
*/

$dati=$db->get_row("SELECT * FROM utenti where ID=$utente");
echo "<hr><h3>Modifica dati utente</h3>";
echo "<form action=\"index.php?modulo=gestioneutenti&azione=update&utente=$utente\" method=\"post\"><table>";
echo "    <tr><td align=\"right\">User Name</td>";
echo "    <td>$dati->UserName</td></tr>";
echo "    <tr><td align=\"right\">password</td>";
echo "    <td><input type=\"password\" name=\"password\" size=20></td></tr>";
echo "    <tr><td align=\"right\">Riscrivi la Password</td>";
echo "    <td><input type=\"password\" name=\"checkpassword\" size=20></td></tr>";
echo "    <tr><td align=\"right\">livello</td>";
echo "    <td><input type=\"text\" name=\"livello\" value=\"$dati->Livello\" size=2></td></tr>";
echo "    <tr><td colspan=2><input type=\"submit\" value=\"Modifica\"></td></tr>";
echo "</table></form>";
?>
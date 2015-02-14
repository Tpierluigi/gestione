<?

$dati=$db->get_results("SELECT *,date_format(data,'%d/%m/%Y') as data from monitorxml WHERE PC=$id ");
echo "<table class=\"software\">";
echo "<tr><th></th><th>CLICCARE SULLA DATA PER INGRANDIRE</th></tr>";
if (!isset($dati)) 
	echo "<tr><td></td><td><h2>NESSUN MONITORAGGIO INSERITO</h2></td></tr>";
else 
	{
  foreach ($dati as $riga)
  	{
   	echo "<tr>";
    echo "			<td><input type=\"radio\" name=\"codice\" value=\"$riga->ID\"></td>";
    echo "			<td align='left'>";
    echo "					$riga->data";
    echo "			</td>";
    echo "</tr>";
		}
	}
echo "</table>";
?>
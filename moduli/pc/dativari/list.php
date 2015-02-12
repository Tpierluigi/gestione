<?

$_DIMX=200;

$dati=$db->get_results("SELECT  pc_campi.id,pc_campi.descrizione,pc_varie.pc,pc_varie.voce,pc_varie.valore FROM pc_campi left join pc_varie on pc_campi.id=pc_varie.voce and pc_varie.pc=$id ");
echo "<div align=\"center\"><table class=\"software\">";
echo "<tr><th>VOCE</th><th>VALORE</th></tr>";
if (!isset($dati)) 
	echo "<tr><td></td><td><h2>NON CI SONO INFORMAZIONI SUPPLEMENTARI</h2></td></tr>";
else 
	{
      foreach ($dati as $riga)
      	{
           	echo "<tr>";
            echo "			<td>$riga->descrizione</td>";
            echo "			<td><input type=\"text\" name=\"voce[$riga->id]\" value=\"$riga->valore\"></td>";
            echo "</tr>";
    	}
	}
echo "</table></div>";

?>

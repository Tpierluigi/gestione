<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<?
include ("check.php");
verificalivello(3);
$conn=mssql_connect("srvlotti","sa","");
mssql_select_db("PC");
$ord=$_GET['ord'];
if ($ord=="") $ord="Apparecchi.ID";
$testoqry="";
$testoqry.="SELECT Apparecchi.ID, TipiApparecchi.descrizione AS tipo,Apparecchi.posizione,"; 
$testoqry.="Apparecchi.SN,apparecchi.ipaddress,Apparecchi.Descrizione, Apparecchi.IDrete,apparecchi.COA ";
$testoqry.="FROM Apparecchi INNER JOIN TipiApparecchi ON Apparecchi.Tipo = TipiApparecchi.ID order by $ord";
$ris=mssql_query($testoqry);
while ($riga=mssql_fetch_object($ris))$dati[]=$riga;
include ("intpagina.php");
echo "<table>";
echo "<tr>";
echo "<th><a href=\"elencopc.php?ord=Apparecchi.ID\">ID</a></th>";
echo "<th><a href=\"elencopc.php?ord=TipiApparecchi.descrizione\">TIPO</a></th>";
echo "<th><a href=\"elencopc.php?ord=Apparecchi.Descrizione\">DESCRIZIONE</a></th>";
echo "<th><a href=\"elencopc.php?ord=IDRETE\">IDRETE</a></th>";
echo "<th><a href=\"elencopc.php?ord=SN\">SN</a></th>";
echo "<th><a href=\"elencopc.php?ord=COA\">COA</a></th>";
echo "<th><a href=\"elencopc.php?ord=Apparecchi.posizione\">POSIZIONE</a></th>";
echo "<th><a href=\"elencopc.php?ord=Apparecchi.ipaddress\">POSIZIONE</a></th>";
echo "</tr>";
foreach ($dati as $riga)
				{
				echo "<tr>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->ID</a></td>";
				echo "			<td>$riga->tipo</td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->Descrizione</a></td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->IDrete</a></td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->SN</a></td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->COA</a></td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->posizione</a></td>";
				echo "			<td><a href=\"dettagli.php?id=$riga->ID\">$riga->ipaddress</a></td>";
				echo "</tr>";
				}
echo "</table>";
include ("piepagina.php");
?>
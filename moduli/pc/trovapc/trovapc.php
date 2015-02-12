 <?
session_start();
verificalivello(3);


if (sizeof($_POST)>0)
    fermete($_POST,false);
else
    {
    $campi=array ("id"=>"ID","descrizione"=>"DESCRIZIONE","sn"=>"SERIALE","ipaddress"=>"INDIRIZZO IP");
    $html=new smartypc;
    $html->assign("campi",$campi);
    $html->display("pc/trova.tpl");
  }
  /*
$testoqry=
"SELECT apparecchi.ID, tipiapparecchi.descrizione AS tipo,apparecchi.posizione,apparecchi.SN,apparecchi.Descrizione, apparecchi.IPAddress,apparecchi.COA, apparecchi.id_aziende,apparecchi.progressivoimpianto FROM apparecchi INNER JOIN tipiapparecchi ON apparecchi.Tipo = tipiapparecchi.ID ";

$dati=$db->get_results($testoqry);

$menubar=new barramenu;
$menubar->add("AGGIUNGI UN NUOVO PC","index.php?modulo=computer&app=PC","");
$menubar->show();


echo "<div class=\"submenu\"> RICERCA COMPUTER </div>";

echo "<table rules=\"cols\"  cellspacing=\"0\" width=\"100%\">";
echo "<tr>";
echo "<th><a href=\"index.php?modulo=sfogliapc&app=PC&ord=apparecchi.ID\">ID</a></th>";
echo "<th><a href=\"index.php?modulo=sfogliapc&app=PC&ord=tipiapparecchi.descrizione\">TIPO</a></th>";
echo "<th><a href=\"index.php?modulo=sfogliapc&app=PC&ord=apparecchi.Descrizione\">FUNZIONE</a></th>";
echo "<th><a href=\"index.php?modulo=sfogliapc&app=PC&ord=IPAddress\">IP Address</a></th>";
echo "<th><a href=\"index.php?modulo=sfogliapc&app=PC&ord=apparecchi.id_aziende, apparecchi.progressivoimpianto\">POSIZIONE</a></th>";
echo "</tr>";
for ($i=0;($i<NREC)&&(($activepage-1)*NREC+$i<$nrows);$i++)
				{
				$riga=$dati[($activepage-1)*NREC+$i];
				echo "<tr>";
				echo "			<td class='riga'>$riga->ID</td>";
				echo "			<td class='riga'>$riga->tipo</td>";

				echo "			<td class='riga'>";
        
$elenco=$db->get_results("
  Select pc_funzioni.ordine, pc_tipifunzione.funzione 
  from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id 
  where pc_funzioni.id_apparecchi=$riga->ID
  ");
  
if (sizeof ($elenco)>0)
   {
   foreach ($elenco as $funzione) printf( "$funzione->ordine : $funzione->funzione <br>\n" );
   }
else  printf( "DA DEFINIRE \n" );
				echo "			</td>";
				echo "			<td class='riga'>$riga->IPAddress</td>";
        $posizione=$db->get_row("
SELECT aziende.sito,impianti.descrizione AS impianto
FROM apparecchi INNER JOIN impianti ON apparecchi.id_aziende = impianti.id_aziende AND 
     apparecchi.progressivoimpianto = impianti.progressivoimpianto INNER JOIN aziende 
     ON impianti.id_aziende = aziende.id_azienda
WHERE apparecchi.ID = $riga->ID
");
        if ( !isset($riga->progressivoimpianto) && !isset($riga->id_aziende))
          $posdesc="DA DEFINIRE"; 
        else
          {
          if ($riga->progressivoimpianto==-1)
            $posdesc="GENERICA<br>(".htmlentities("$posizione->sito: $riga->posizione").")";
          else
            $posdesc=htmlentities("$posizione->sito: $posizione->impianto");
          }
				echo "			<td class='riga'>$posdesc</td>";
				echo "			<td class='riga'>";
				echo "				<a href=\"index.php?modulo=computer&app=PC&id=$riga->ID\">".bottone('EDIT','#33ff99','#009933')."</a> ";
				echo "				<a href=\"index.php?modulo=schedapc&app=PC&id=$riga->ID\">".bottone('VIEW','#ffffff','#4682b4')."</a>";
				echo "			</td>";
				echo "</tr>";
				}
echo "<tr>";
echo "<td align='center' colspan=6>";

printf( "<a href=\"index.php?modulo=sfogliapc&app=PC&page=$rewpage\">[ << prec 10 ]</a>\n" );
printf( "<a href=\"index.php?modulo=sfogliapc&app=PC&page=$prevpage\">[ << prec ]</a>\n" );
printf( "[Pagina ".($activepage)." di $npages ]\n" );
printf( "<a href=\"index.php?modulo=sfogliapc&app=PC&page=$nextpage\">[ >> succ ]</a>\n" );
printf( "<a href=\"index.php?modulo=sfogliapc&app=PC&page=$ffpage\">[ >> succ 10 ]</a>\n" );

echo "</td>";
echo "</tr>";
echo "</table>";
*/

?>

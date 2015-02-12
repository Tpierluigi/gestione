	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
	<!-- plugin jqgrid -->
	<link rel="stylesheet" type="text/css" media="screen" href="lib/jquery/css/ui-lightness/ui.jqgrid.css" />
	<script src="lib/jquery/js/grid.locale-it.js" type="text/javascript"></script>
	<script src="lib/jquery/js/jquery.jqGrid.min.js" type="text/javascript"></script>

 <?
session_start();
verificalivello(3);
    
if (isset ($_GET['ord']))
	{ 
	$activeorder=$_GET['ord'];
  $_SESSION['activeorder']=$activeorder;
	}
else
	$activeorder=$_SESSION['activeorder'];

if ($activeorder=="") 
	$activeorder="apparecchi.ID";








$testoqry="";
$testoqry.="SELECT apparecchi.ID, tipiapparecchi.descrizione AS tipo,apparecchi.posizione,apparecchi.SN,"; 
$testoqry.="apparecchi.Descrizione, apparecchi.IPAddress,apparecchi.COA, apparecchi.id_aziende,apparecchi.progressivoimpianto "; 
$testoqry.="FROM apparecchi INNER JOIN tipiapparecchi ON apparecchi.Tipo = tipiapparecchi.ID order by $activeorder";
$dati=$db->get_results($testoqry);
echo "<div class=\"submenu\"> Seleziona il computer desiderato </div>"; 
printf( "<div align=\"center\" style=\"height:80%%;\">" );
echo "<table width=\"100%\" id=\"listapc\" border=1>";
echo "<thead>";
echo "<tr>";
echo "<th>ID</th>";
echo "<th>TIPO</th>";
echo "<th>FUNZIONE</th>";
echo "<th>IP ADDRESS </TH>";
echo "<th>POSIZIONE</th>";
echo "</tr>";
echo "</thead>";
echo "<tbody>";
foreach ($dati as $riga)
				{
				echo "<tr>";
				echo "			<td>" .sprintf("%04d", $riga->ID) . "</td>";
				echo "			<td>$riga->tipo</td>";
				echo "			<td>";
        
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
				echo "			<td>$riga->IPAddress</td>";
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
				echo "			<td >$posdesc</td>";
				echo "</tr>";
				}
echo "</tbody>";
echo "</table>";
echo "</div>";

?>

<div id="gridpager"></div> 
<div id="messaggi" title="seleziona un PC"><p>SELEZIONA UN PC DA EDITARE/MODIFICARE</p></div>

<script>
//inizializzo il dialog box per i messaggi
$("#messaggi").dialog(
	{  autoOpen: false, 
	modal: true, 
	show:'drop', 
	hide:'drop', 
	resizable:false,
	buttons: { "Ok": function() { $(this).dialog("close"); } } });
// creo la grid dalla tabella caricata..
// come opzioni specifico il DIV relativo al pager e le opzioni del pager...
tableToGrid("#listapc",{pager: '#gridpager',pgtext : "",recordtext: "",pgbuttons:false}); 
$("#listapc").setGridHeight("80%");
//aggiungo al pager i botto ni del navigatr (solo search e refresh alla fine..)
$("#listapc").navGrid('#gridpager',{view:false, del:false, edit:false, add:false}); 
//dato che quelli predefiniti non mi servono aggiungo i tre bottoni aggiungi, vedi, edita
$("#listapc").navButtonAdd("#gridpager",
	{caption:'Vedi dati', 
	buttonicon:'ui-icon-search', 
	onClickButton:function(){callerEdit(0);}, //notare la maniera di passare il gestore evento con dei parametri
	position: "first", 
	title:"Vedi dati'"});
$("#listapc").navButtonAdd("#gridpager",
	{caption:'Modifica', 
	buttonicon:'ui-icon-pencil', 
	onClickButton:function(){callerEdit(1);}, 
	position: "first", 
	title:"Modifica'"});
$("#listapc").navButtonAdd("#gridpager",
	{caption:'Aggiungi PC', 
	buttonicon:'ui-icon-plusthick', 
	onClickButton:function(){callerEdit(2);}, 
	position: "first", 
	title:"Aggiungi PC'"});

function callerAdd(){
	window.location.href="index.php?modulo=computer&app=PC&id=";
}

function callerEdit(mode){
	var id = $("#listapc").getGridParam('selrow'); 
	if( mode==2)
		//aggiunta
		window.location.href="index.php?modulo=computer&app=PC";
	else{
		if (id) { 
			var ret = $("#listapc").getRowData(id); 
			if (mode==1)
				//modifica
				window.location.href="index.php?modulo=computer&app=PC&id=" + ret.ID;
			if (mode==0)
				//visualizzazione
				window.location.href="index.php?modulo=schedapc&app=PC&id=" + ret.ID;
		} 
		else { 
			$("#messaggi").dialog( 'open');
			
		} 
	}
}
</script>
<?
printf( "<div class=titolo>IDENTIFICAZIONE MACCHINA</div>\n" );
printf( "<table>\n" );
printf( "<tr>\n" );
printf( "<td>codice</td>\n" );
printf( "<td><input type=\"text\" size=3 maxlength=4 name=\"ID\" value=\"$dati->ID\"></td>\n" );
printf( "</tr>\n" );
printf( "<tr>\n" );
printf( "<td>\n" );
printf( "Data di registrazione:<b>\n" );
printf( "</td>\n" );
printf( "<td>\n" );
printf( ReverseDate($dati->Datainst)."</b>\n" );
printf( "</td>\n" );
printf( "</tr>\n" );
printf( "<tr>\n" );
printf( "<td>\n" );
printf( "Tipo:\n" );
printf( "</td>\n" );
printf( "<td>\n" );
printf( "<select name=\"Tipo\">\n" );
printf( " <option value=\"0\">Seleziona..</option>\n" );
$elenco=$db->get_results("select * from tipiapparecchi");
foreach ($elenco as $riga)
				{
				if ($dati->Tipo==$riga->ID) 
					 $sel="selected"; 
				else 
					 $sel="";
printf( "						   <option value=\"$riga->ID\" $sel>$riga->descrizione</option>\n" );
			  }
printf( "				 		</select>\n" );
printf( "													</td>\n" );
printf( "			 </tr>\n" );
printf( "				<tr>\n" );
printf( "														<td>\n" );
printf( "						Funzione:\n" );
printf( "														</td>\n" );
printf( "														<td>\n" );
if ($dati->ID>0)
  {
  $elenco=$db->get_results("Select pc_funzioni.ordine, pc_tipifunzione.funzione from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id where pc_funzioni.id_apparecchi=$dati->ID");
  if (sizeof ($elenco)>0)
     {
     foreach ($elenco as $riga)
     printf( "						    <strong> $riga->ordine : $riga->funzione </strong><br>\n" );
     }
  }
else
   printf( "						    <strong> DA DEFINIRE</strong>\n" );
printf( "													</td>\n" );
printf( "			 </tr>\n" );
printf( "						<tr>\n" );
printf( "							<td>Posizionamento Attuale:</td>\n" );
printf( "							<td>\n" );
printf( "							<input type=\"hidden\" name=\"id_aziende\" value=\"$dati->id_aziende\">\n" );
printf( "							<input type=\"hidden\" name=\"progressivoimpianto\" value=\"$dati->progressivoimpianto\">\n" );

$riga=$db->get_row("
SELECT aziende.sito, 
    impianti.descrizione AS impianto
FROM apparecchi INNER JOIN impianti ON 
    apparecchi.id_aziende = impianti.id_aziende AND 
    apparecchi.progressivoimpianto = impianti.progressivoimpianto
     INNER JOIN aziende ON impianti.id_aziende = aziende.id_azienda
WHERE apparecchi.ID = $id
");
if ($riga->sito!="")
	printf( "						<strong>".htmlentities("$riga->sito: $riga->impianto")."</strong> &nbsp;&nbsp;<img src=\"icons/prova.gif\" onclick='finestraposizione()'/>\n" );
else
	printf( "						<strong>DA DEFINIRE</strong> &nbsp;&nbsp;<img src=\"icons/prova.gif\" onclick='finestraposizione()'/>\n" );

printf( "														</td>\n" );
printf( "												</tr>\n" );

if ($dati->progressivoimpianto==-1)
   {
   printf( "						<tr>\n" );
   printf( "						<td>Descrizione della pos. generica:</td>\n" );
   printf( "						<td><input type=\"text\" size=40 name=\"posizione\" value=\"$dati->posizione\"></td>\n" );
   printf( "						</tr>\n" );
   }
   
printf( "												<tr>\n" );
printf( "            						 		<td>Commessa</td>\n" );
printf( "            						 		<td><input type=\"text\" name=\"commessa\" value=\"$dati->commessa\"></td>" );
printf( "						 		 				</tr>\n" );
printf( "												<tr>\n" );
printf( "            						 		<td>Marca PC</td>\n" );
printf( "            						 		<td><input type=\"text\" name=\"marca\" value=\"$dati->marca\"></td>" );
printf( "    						 				</tr> \n" );
printf( "    						 				<tr>\n" );
printf( "    						 		 				<td>Modello PC</td>\n" );
printf( "    						 		 				<td><input type=\"text\" name=\"modello\" value=\"$dati->modello\"></td>\n" );
printf( "    						 				</tr> \n" );
printf( "    						 				<tr>\n" );
printf( "    						 		 				<td>Numero di serie</td>\n" );
printf( "    				<td> \n" );
printf( "    				<input type=\"text\" size=\"30\" name=\"SN\" value=\"$dati->SN\">\n" );
printf( "    				</td>\n" );
printf( "    						 				</tr> \n" );
printf( "    						 				<tr>\n" );
printf( "        						 		 		<td> Etichetta COA: </td>\n" );
printf( "        		<td> \n" );
/*
$coa1=substr($dati->COA,0,5);
$coa2=substr($dati->COA,6,3);
$coa3=substr($dati->COA,10,3);
$coa4=substr($dati->COA,14,3);
printf ("<input type=\"text\" size=\"5\" maxlength=\"5\" name=\"COA1\" value=\"$coa1\">-");
printf ("<input type=\"text\" size=\"3\" maxlength=\"3\" name=\"COA2\" value=\"$coa2\">-");
printf ("<input type=\"text\" size=\"3\" maxlength=\"3\" name=\"COA3\" value=\"$coa3\">-");
printf ("<input type=\"text\" size=\"3\" maxlength=\"3\" name=\"COA4\" value=\"$coa4\">");
*/
printf ("<input type=\"text\" size=\"18\" name=\"COA\">");
printf( "        		</td>\n" );
printf( "    						 				</tr>\n" );
printf( "</table>\n" );
?>
<script language="JavaScript" type="text/javascript">
<!--
	$(":input[name=COA]").mask("99999-999-999-999").val('<?echo $dati->COA;?>');
//-->
</script>

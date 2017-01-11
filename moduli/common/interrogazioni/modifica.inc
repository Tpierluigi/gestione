<?php

$id=(int)$_POST['idquery'];
$DatiQuery=$db->get_row("select * from queryutente where id=$id");
print( "<table summary=\"\" width='100%'>\n" );
print( "	<tr>\n" );
print( "		<td valign='top' width='80%'>" );
print( "			<p>\n" );
print( "						 <input type='hidden' size=40 name='fID' value=\"$id\">\n" );
print( "						 <b>Nome della query:</b>\n" );
print( "						 <input type='text' size=40 name='fNomeQuery' value=\"$DatiQuery->Descrizione\">\n" );
print( "			</p>\n" );
print( "			<p><b>Testo della query:</b></p>\n" );
print( "			<p>\n" );
print( "				 <textarea name=\"fTestoQuery\" rows=8 cols=60>$DatiQuery->Testo</textarea>\n" );
print( "			</p>\n" );
print( "			<p>\n" );
echo   "					Pubblica: <input type=\"checkbox\" name=\"fPubblica\"";
if ((int)$DatiQuery->Pubblica==1) echo "checked"; else echo"";
echo  ">\n";

print( "			</p>\n" );
print( "</td>\n" );
print( "<td>\n" );
print( "	<table summary=\"1\">\n" );
print( "		<tr>\n" );
print( "			<td class=\"bordocella\"> \n" );
				include_once ("scrivinuova.elenco.inc");
print( "			</td>\n" );
print( "		</tr>\n" );
print( "	</table>\n" );
print( "</td>\n" );
print( "</tr>\n" );
print( "</table>\n" );
?>
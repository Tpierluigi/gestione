<?
$id=(int)$_POST['idscript'];
$Dati=$db->get_row("select * from AdminScript where id=$id");
print( "<table summary=\"\" width='100%'>\n" );
print( "	<tr>\n" );
print( "		<td valign='top' width='80%'>" );
print( "			<p>\n" );
print( "						 <input type='hidden' name='idscript' value=$id>\n" );
print( "						 <b>Nome dello script:</b>\n" );
print( "						 <input type='text' size=40 name='fNomeScript' value=\"$Dati->Descrizione\">\n" );
print( "			</p>\n" );
print( "			<p><b>Testo dello script:</b></p>\n" );
print( "			<p>\n" );
print( "				 <textarea class=\"script\" name=\"fTestoScript\" rows=8 cols=120>$Dati->Testo</textarea>\n" );
print( "			</p>\n" );
print( "		</td>\n" );
print( "</tr>\n" );
print( "</table>\n" );
?>
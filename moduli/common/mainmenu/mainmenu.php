<?
if (verificalivello(3))
	{
	?>
	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>	
	<!-- plugin jqgrid -->
	<link rel="stylesheet" type="text/css" media="screen" href="lib/jquery/css/ui-lightness/ui.jqgrid.css" />
	<script src="lib/jquery/js/grid.locale-en.js" type="text/javascript"></script>
	<script src="lib/jquery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<?
	printf( "<table width=\"100%%\">\n" );
	printf( "<tr>\n" );
	printf( "<td valign=top>\n" );
  printf( "<fieldset>\n" );
  printf( "		<legend>PC</legend>\n" );
  printf( "    <ul> \n" );
  printf( "    <li><a href=\"index.php?modulo=sfogliapc&app=PC\">Gestione PC</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=gestionetipisw&app=PC\">Gestione software</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=tipifunzione&app=PC\">Gestione funzionalit&agrave;</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=gestionetipi&app=PC\">Gestione tipi apparecchiature</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=interrogazioni\">Interrogazioni SQL</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=doscript\">Esecuzione script programma</a> \n" );
  printf( "		</ul>\n" );
  printf( "</fieldset>\n" );
	printf( "</td>\n" );
	printf( "<td valign=top>\n" );
	printf( "<fieldset>\n" );
  printf( "		<legend>CONFIGURAZIONE</legend>\n" );
  printf( "    <ul> \n" );
  printf( "    <li><a href=\"index.php?modulo=gestioneutenti\">Gestione utenti</a> \n" );
  printf( "		<li><a href=\"index.php?modulo=cambiopwd\">Cambio password</a>\n" );
  printf( "    <li><a href=\"index.php?modulo=logout\">Logout</a>\n" );
  printf( "    </ul>\n" );
  printf( "</fieldset>		\n" );
	printf( "</td>\n" );
	printf( "</tr>\n" );
	printf( "<tr>\n" );
	printf( "<td valign=top>\n" );
  printf( "<fieldset>\n" );
  printf( "		<legend>STAMPANTI</legend>\n" );
  printf( "    <ul> \n" );
  printf( "		<li><a href=\"index.php?modulo=sfoglia&app=stampanti\">Gestione Stampanti</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=posizioni&app=stampanti\">Gestione posizioni stampante</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=opzioni&app=stampanti\">Gestione opzioni stampante</a>\n" );
  printf( "    <li><a href=\"index.php?modulo=modelli&app=stampanti\">Gestione modelli stampante</a>\n" );
  printf( "    <li><a href=\"index.php?modulo=tipiintervento&app=stampanti\">Gestione tipi intervento</a>\n" );
  printf( "		</ul>\n" );
  printf( "</fieldset>		" );
	printf( "</td> \n" );
	printf( "<td valign=top>\n" );
  printf( "<fieldset>\n" );
  printf( "		<legend>INDIRIZZI IP</legend>\n" );
  printf( "    <ul> \n" );
  printf( "			<li><a href=\"index.php?modulo=sfoglia&app=ipaddress\">Gestione Indirizzi</a> \n" );
  printf( "   	<li><a href=\"index.php?modulo=search&app=ipaddress\">Cerca indirizzo</a> \n" );
  printf( "		</ul>\n" );
  printf( "</fieldset>		" );
	printf( "</td>\n" );
	printf( "</tr>\n" );
	printf( "<tr>\n" );
	printf( "<td valign=top>\n" );
  printf( "<fieldset>\n" );
  printf( "		<legend>POSIZIONI E LINEE</legend>\n" );
  printf( "    <ul> \n" );
  printf( "		 <li><a href=\"index.php?modulo=sedi\">Gestione Sedi</a> \n" );
  printf( "		 <li><a href=\"index.php?modulo=impianti\">Gestione Impianti</a> \n" );
  printf( "    <li><a href=\"index.php?modulo=paesi\">Paesi</a> \n" );
  printf( "		</ul>\n" );
  printf( "</fieldset>		" );
	printf( "</td>\n" );
	printf( "</tr></table>\n" );
	}

?>


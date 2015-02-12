	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
<?
printf( "<h1 class=login>GESTIONE PC INDUSTRIALI</h1>\n" );
printf( "\n" );
printf( "<h2 class=login>AUTORIZZAZIONE INGRESSO</h2>\n" );
printf( "\n" );
printf( "<h3 class=login>(Premere il tasto 'LOGIN' per entrare come ospite)</h3>\n" );
printf( "<br>\n" );
printf( "<form action=\"index.php?modulo=login&azione=verify\" method=\"post\" name=\"login\">\n" );
printf( "<div align=\"center\">User Name</div>\n" );
printf( "<div align=\"center\"><input class=login type=\"text\" name=\"username\" value=\"guest\"></div>\n" );
printf( "<div align=\"center\">Password</div>\n" );
printf( "<div align=\"center\"><input class=login type=\"password\" name=\"password\"></div><br>\n" );
printf( "<div align=\"center\">".bottone('LOGIN','#ffffff','blue'," onclick=\"document.login.submit()\"")."</div>\n" );
printf( "<input style=\"display: none;\" type=\"submit\">\n" ); // l'ho messo x fregare il browser in maniera da abilitarmi submit con il tasto di INVIO 

?>
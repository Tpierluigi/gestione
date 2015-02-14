<?

if (verificalivello(2))
	{
?>
	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery.maskedinput.js"></script>
	
  <script language="JavaScript" type="text/javascript">
  <!--
  function aggiorna(ind)
  		{
  		document.frmComputer.fNuovaURL.value=ind;
  		document.frmComputer.submit();
  		}
  function finestraposizione()
  	{		
		rif=document.getElementById('finestrina');
  	if (rif.style.display=='none')
  		rif.style.display='block';
  	else
  		rif.style.display='none';
  	}
		function assegna(sede,impianto)
			{
  		document.frmComputer.id_aziende.value=sede;
  		document.frmComputer.progressivoimpianto.value=impianto;
  		document.frmComputer.submit();
  		rif=document.getElementById('finestrina');
  		rif.style.display='none';
			}
  	function visualizza(numero)
  		{
			for(i=1;i<6;i++)
				{
				nomescheda='scheda'+i.toString();
				nomelinguetta='linguetta'+i.toString();
  			document.getElementById(nomescheda).style.display='none';
  			document.getElementById(nomelinguetta).style.backgroundColor='#cccccc';
				}
  		document.getElementById('scheda'+numero).style.display='block';
  		document.getElementById('linguetta'+numero).style.backgroundColor='yellow';
  		
  		}
  //-->
  </script>
<? 
	
  @$id=(int)$_GET['id'];
  @$azione=$_POST['azione'];
  
  /*---------------------------*/
  	 reset($_POST);
  	 do{
  	 		$name_posted=key($_POST);		
  	 		$$name_posted=SQLparse(current($_POST));
  			}
  	 while(each($_POST)!=false);
  /*---------------------------*/
	/*
  	 if (($COA1!="")||($COA2!="")||($COA3!="")||($COA4!=""))
  	 		$COA=$COA1."-".$COA2."-".$COA3."-".$COA4;
  	 else $COA="";
  */
	function NormalizeIP($ip)
	{	
  		if ($ip!="") { 
  		$ip=explode(".",$ip);
  		for($i=0;$i<4;$i++)
  			$ip[$i]=sprintf("%03d",$ip[$i]);
  		$ip=implode(".",$ip);
  
  		return $ip;
		}
		else{
			return "";
		}
	}	
	switch ($azione) 
  	{
  	case "add":
			include ("addpc.php"); 
			if ($successo==1){	
				$id=$nuovoID;
				$azione="upd";
			}
			break;
  	case "upd": include ("updpc.php"); break;
  	}
  if ($fNuovaURL!="")
  	{
    print( "<script language=\"JavaScript\" type=\"text/javascript\">\n" );
    print( "		document.location.href='$fNuovaURL';\n" );
    print( "</script>\n" );
  	}
  
  if ($azione!="add"){
		if ($id != "")
      $dati=@$db->get_row("Select *,DATE_FORMAT(Datainst,'%d/%m/%Y')as Datainst from apparecchi where id=$id");
    print( "<form action=\"index.php?modulo=computer&app=PC&id=$dati->ID\" method=\"post\" name=\"frmComputer\">\n" );
    include ("menutop.php");
    print( "<div class=\"submenu\">inserimento/modifica computer</div>\n" );
    printf( "<div id=\"titolo\">\n" );
    printf( "<div id=\"linguetta1\" onclick=\"javascript: visualizza('1')\">DESCRIZIONE</div>\n" );
    printf( "<div id=\"linguetta2\" onclick=\"javascript: visualizza('2')\">CARATTERISTICHE</div>\n" );
    printf( "<div id=\"linguetta3\" onclick=\"javascript: visualizza('3')\">RETE</div>\n" );
    printf( "<div id=\"linguetta4\" onclick=\"javascript: visualizza('4')\">SOFTWARE</div>\n" );
    printf( "<div id=\"linguetta5\" onclick=\"javascript: visualizza('5')\">NOTE</div>\n" );
    printf( "<hr />	" );

    printf( "</div>	" );
		//print( "<div id=\"schede\">");
		
		printf( "<div id=\"scheda1\">" );
		include ("descrizione.php");
    print( "</div>\n" );
		
		printf( "<div id=\"scheda2\">" );
    include ("caratteristiche.php");
    print( "</div>\n" );
		printf( "<div id=\"scheda3\">" );
    include ("rete.php");
    print( "</div>\n" );
		printf( "<div id=\"scheda4\">" );
    include ("software.php");
    print( "</div>\n" );
		printf( "<div id=\"scheda5\">" );
    print( "	<div class=titolo>NOTE</div>\n" );
    print( "	<textarea name=\"fNote\" rows=3 cols=100>$dati->Note</textarea>\n");
    print( "</div> \n" );
			
    print("<input type=\"text\" name=\"azione\" value=\"$val\">");		 
    print( "<input type=\"text\" name=\"fNuovaURL\">\n" );
    
		print( "</form>\n" );

		}
		
		include ("posizioni.php");
		//include ("funzioni.php");
		
  switch ($successo){
    case 1:
			allarme("NOTA: Dati aggiunti correttamente");
      break;
    case 2:
			allarme("NOTA: Dati aggiornati correttamente");
      break;
    case 3:
		  allarme ( "ERRORE:PROBLEMI NELL'INSERIMENTO DATI !" );
      break;
    case 4:
		  allarme ( "ERRORE:IL TIPO COMPUTER E' OBBLIGATORIO !" );
      break;
  }  
 }
?>


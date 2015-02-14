{if $_codusr > 0}
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
      <TITLE>Gestione PC e apparecchi industriali v. {$app_version}</TITLE>
      <META http-equiv=Content-Type content="text/html; charset=windows-1252">
      <META content="MSHTML 6.00.2800.1106" name=GENERATOR>

      <link rel="stylesheet" type="text/css" href="layout/stile.css" media="screen">
      <link rel="stylesheet" type="text/css" href="layout/schede.css" media="screen">
      <link rel="stylesheet" type="text/css" href="stilep.css"  media="print">
 
    <link rel="StyleSheet" href="lib/dtree/dtree.css" type="text/css" />
    <script type="text/javascript" src="lib/dtree/dtree.js"></script>
    <script type='text/javascript' src='dFilter.js'></script>

  {literal}
    <script type="text/javascript" language="javascript">
      function eseguiAzione(val,nomeform)
      	{
      	scheda=document.getElementById(nomeform);
      	scheda.azione.value=val;
      	scheda.submit();
      	}
    </script>


  {/literal}
  </HEAD>
  <BODY>
  <div class="titolo">
  <STRONG>Gestione PC e apparecchi industriali V.{$SWver} Utente: {$_datiutente->UserName}</STRONG>
  <STRONG>pagina:{$_SESSION[activepage]} ordine:{$_SESSION[activeorder]}</STRONG>
  </div>
  <div class="menugenerale">
  <b>MENU GENERALE &gt;&gt; </b>
  <a href="index.php?modulo=mainmenu">Vai a menu generale</a><br>
  <b>GESTIONE PC &gt;&gt; </b>
    <a href="index.php?modulo=sfogliapc&app=PC">Gestione PC</a> -
    <a href="index.php?modulo=gestionetipisw&app=PC">Gestione software</a> -
    <a href="index.php?modulo=tipifunzione&app=PC">Gestione funzioni</a> -
    <a href="index.php?modulo=gestionetipi&app=PC">Gestione tipi apparecchiature</a> -
    <a href="index.php?modulo=interrogazioni">Interrogazioni SQL</a> -
    <a href="index.php?modulo=doscript">Esecuzione script programma</a> <br>
  
	<b>GESTIONE STAMPANTI &gt;&gt; </b>
    <a href="index.php?modulo=sfoglia&app=stampanti">Stampanti</a> -
    <a href="index.php?modulo=posizioni&app=stampanti">Posizioni stampante</a> -
    <a href="index.php?modulo=opzioni&app=stampanti">Opzioni stampante</a> -
    <a href="index.php?modulo=modelli&app=stampanti">Modelli stampante</a> -
    <a href="index.php?modulo=tipiintervento&app=stampanti">Tipi intervento</a> <br>
 
	<b>GESTIONE IP &gt;&gt; </b>
  	 <a href="index.php?modulo=sfoglia&app=ipaddress">Gestione Indirizzi</a> -
    <a href="index.php?modulo=search&app=ipaddress">Cerca indirizzo</a> <br>
  <b>GESTIONE POSIZIONI &gt;&gt; </b>
  	 <a href="index.php?modulo=impianti">Gestione impianti</a> -
  	 <a href="index.php?modulo=sedi">Gestione sedi</a> -
    <a href="index.php?modulo=paesi">Elenco nazioni</a> <br>
  <b>GESTIONE UTENTI &gt;&gt; </b>
    <a href="index.php?modulo=gestioneutenti">Gestione utenti</a> -
    <a href="index.php?modulo=cambiopwd">Cambio password</a> -
    <a href="index.php?modulo=logout">Logout</a>
  </div>
{else}
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
      <TITLE>Gestione PC e apparecchi industriali v. {$SWver}</TITLE>
      <META http-equiv=Content-Type content="text/html; charset=windows-1252">
      <META content="MSHTML 6.00.2800.1106" name=GENERATOR>
  
      <link rel="stylesheet" type="text/css" href="layout/stile.css" media="screen">
      <link rel="stylesheet" type="text/css" href="layout/schede.css" media="screen">
      <link rel="stylesheet" type="text/css" href="stilep.css"  media="print">
  
  </HEAD>
  <BODY>
{/if}  

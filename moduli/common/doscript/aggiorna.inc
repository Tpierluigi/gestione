<?php
$id=(int)$_POST['idscript'];
$NomeScript=$_POST['fNomeScript'];
$TestoScript=stripslashes($_POST['fTestoScript']);
$TestoScript=str_replace("'","''",$TestoScript);
if ($NomeScript=="")
	die("<h3 align='center'>E' NECESSARIO DARE UN NOME ALLO SCRIPT</h3><div align='center'><a href=\"javascript:history.back()\">indietro..</a></div>");
if ($TestoScript=="")
	die("<h3 align='center'>E' NECESSARIO INSERIRE IL TESTO DELLO SCRIPT</h3><div align='center'><a href=\"javascript:history.back()\">indietro..</a></div>");
$link= new DBLink($db);
$link->SetTbl("AdminScript");
$link->SetID($id);
$link->AddLink('NomeScript','Descrizione','s');
$link->AddLink('TestoScript','Testo','s');
$link->SetOpt("upd");
$link->DoSQL();
print( "<h3 align='center'>script aggiornato correttamente</h3>\n" );
print( "	 <h3 align='center'><a href=\"index.php?modulo=doscript\">aggiorna l'elenco...</a></h3>\n" );
?>
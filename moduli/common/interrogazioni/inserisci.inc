<?
$NomeQuery=$_POST['fNomeQuery'];
$TestoQuery=stripslashes($_POST['fTestoQuery']);
$TestoQuery=str_replace("'","''",$TestoQuery);
$Pubblica=(int)isset($_POST['fPubblica']);
$TestoQuery=stri_replace("INSERT","",$TestoQuery);
$TestoQuery=stri_replace("UPDATE","",$TestoQuery);
$TestoQuery=stri_replace("INTO","",$TestoQuery);
$TestoQuery=stri_replace("ALTER","",$TestoQuery);
$TestoQuery=stri_replace("CREATE","",$TestoQuery);
$TestoQuery=stri_replace("DROP","",$TestoQuery);
if ($NomeQuery=="")
	die("<h3 align='center'>E' NECESSARIO DARE UN NOME ALLA QUERY</h3><div align='center'><a href=\"javascript:history.back()\">indietro..</a></div>");
if ($TestoQuery=="")
	die("<h3 align='center'>E' NECESSARIO INSERIRE IL TESTO DELLA QUERY</h3><div align='center'><a href=\"javascript:history.back()\">indietro..</a></div>");

$link= new DBLink($db);
$link->SetTbl("queryutente");
$link->AddLink('NomeQuery','Descrizione','s');
$link->AddLink('TestoQuery','Testo','s');
$link->AddLink('codusr','IDUtente','n');
$link->AddLink('Pubblica','Pubblica','n');
$link->SetOpt("add");
$link->SetID(0);
$link->DoSQL();
print( "<h3 align='center'>query inserita correttamente</h3>\n" );
 print( "	 <h3 align='center'><a href=\"index.php?modulo=interrogazioni\">aggiorna l'elenco...</a></h3>\n" );

?>
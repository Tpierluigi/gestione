<?
require_once("../../../lib/ez_sql.php");
require_once("../../../lib/generali.php");
require_once("../../../lib/check.php");
require_once('../../../lib/smarty/libs/Smarty.class.php');
$settaggi=parse_ini_file("../../../config.ini",true);

class smartypc extends Smarty
{
  function smartypc()
  {
    global $settaggi;
    $this->Smarty();
    $this->template_dir = $settaggi['smarty config']['dirTemplate'];
    $this->compile_dir =  $settaggi['smarty config']['dirCompilati'];
    $this->config_dir =   $settaggi['smarty config']['dirConfigurazione'];
    $this->cache_dir =    $settaggi['smarty config']['dirCache'];
    $this->caching =      $settaggi['smarty config']['cachingAttivo'];
    $this->debugging =    $settaggi['smarty config']['debugAttivo'];
    $this->force_compile =$settaggi['smarty config']['forzaCompilazione'];
    $this->assign('app_name',     $settaggi['generale']['Applicazione']);
    $this->assign('app_version',  $settaggi['generale']['Versione']);
  }
}

$db=new DB($settaggi['database']['Utente'],$settaggi['database']['Password'],$settaggi['database']['Database'],$settaggi['database']['Server']);
$stampante=new smartypc;
$codice=$_GET['codice'];
$stampante->assign("dati",$db->get_row("select * from stampanti where id='$codice' "));
$stampante->assign("modelli",ResultToArray($db->get_results("select * from ModelliStampante "),"id","descrizione"));
$stampante->assign("posizioni",ResultToArray($db->get_results("select * from Elencoposizioni order by Descrizione"),"id","descrizione"));
$stampante->assign("opzionidisp",ResultToArray($db->get_results("SELECT * from opzionistampanti"),"id","descrizione"));

if ($codice!=""){
  $query="SELECT idopzione FROM elencoopzionistampanti  WHERE elencoopzionistampanti.idstampante = '$codice'";
  $opzioniinst=$db->get_results($query);
	if ($opzioniinst){
    foreach ($opzioniinst as $val){
    	$opzioni_id[]=$val->idopzione;
    }
	}
  $stampante->assign("opzioni_id",$opzioni_id);
}
$stampante->display("stampanti/editdlg.tpl");

<?php

require_once("lib/ez_sql.php");
require_once("lib/database.class.php");
require_once("lib/generali.php");
require_once("lib/check.php");
require_once("lib/barramenu.php");
require_once("lib/clsDBlink.php");
require_once("lib/clstree.php");
require_once('lib/smarty/libs/Smarty.class.php');
require_once('lib/JSON.php');
require_once('lib/registry.class.php');

/*
 * MODELLO APP
 */

require_once ("model/Computer.class.php");
require_once ("model/Posizione.class.php");

/*
 * controllers
 */
$elencoController = elencoController('controller');
foreach ($elencoController as $nome) {
    include ($nome);
}
/* * ***CONFIG**** */
$settaggi = parse_ini_file("config.ini", true);
/* * ***END CONFIG**** */


$SWver = $settaggi['generale']['Versione'];
$uploaddir = $settaggi['generale']['directoryUpload'];
$URLuploaddir = $settaggi['generale']['UrlUpload'];
$viewDir = $settaggi['generale']['viewDir'];
$db = new DB(
        $settaggi['database']['Utente'], $settaggi['database']['Password'], $settaggi['database']['Database'], $settaggi['database']['Server']
);
$nDb = new Database($settaggi['database']['Utente'], $settaggi['database']['Password'], $settaggi['database']['Database'], $settaggi['database']['Server'], $settaggi['database']['Port']);

class smartypc extends Smarty {

    function smartypc() {
        global $settaggi;
        $this->Smarty();
        $this->template_dir = $settaggi['smarty config']['dirTemplate'];
        $this->compile_dir = $settaggi['smarty config']['dirCompilati'];
        $this->config_dir = $settaggi['smarty config']['dirConfigurazione'];
        $this->cache_dir = $settaggi['smarty config']['dirCache'];
        $this->caching = $settaggi['smarty config']['cachingAttivo'];
        $this->debugging = $settaggi['smarty config']['debugAttivo'];
        $this->force_compile = $settaggi['smarty config']['forzaCompilazione'];
        $this->assign('app_name', $settaggi['generale']['Applicazione']);
        $this->assign('app_version', $settaggi['generale']['Versione']);
    }

}
$registry=new Registry();
session_start();
$imgpath = "icone/doctypes/";
$moduliPC = elencomoduli('moduli/pc');
$modulicomuni = elencomoduli('moduli/common');
$moduliStampanti = elencomoduli('moduli/stampanti');
$moduliIP = elencomoduli('moduli/ipaddress');
$app = setWithDefault($_GET['app'], "");
$nomeModulo = getGlobalVarValue($_GET, 'modulo');
$nomeController = getGlobalVarValue($_GET, 'c');
$nomeFunzione = getGlobalVarValue($_GET, 'f');
$_codusr = getGlobalVarValue($_SESSION, 'id');
$activepage = (int) getGlobalVarValue($_SESSION, 'activepage', 0);
$activeorder = (int) getGlobalVarValue($_SESSION, 'activeorder', 0);
if (isset($_codusr)) {
    $_datiutente = $db->get_row("select * from utenti where ID=$_codusr");
}
Registry::data-[idUtente]=$_codusr;
Registry::data->datiUtente=$_datiutente;

switch ($app) {
    case '':
        $modulo = $modulicomuni[$nomeModulo];
        break;
    case 'PC':
        $modulo = $moduliPC[$nomeModulo];
        break;
    case 'stampanti':
        $modulo = $moduliStampanti[$nomeModulo];
        break;
    case 'ipaddress':
        $modulo = $moduliIP[$nomeModulo];
        break;
}
if (isset($nomeController)) {
    $nomeController .= 'Controller';
    $controller = new $nomeController($nDb);
    if ($nomeFunzione!="") {
        $controller->$nomeFunzione();
    }
} else {
    ob_start();
    if ($modulo != "") {
        include ($modulo['file']);
    } else {
        if (isset($_SESSION['id']) && $_SESSION['id'] != "") {
            include ($modulicomuni['mainmenu']['file']);
        } else {
            include ($modulicomuni['login']['file']);
        }
    }
    $contenuto = ob_get_contents();
    ob_end_clean();
    include("layout/intpagina.php");
    echo $contenuto;
    include("layout/piepagina.php");
}
?>

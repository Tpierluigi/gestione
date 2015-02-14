<?
verificalivello(3);
define("NREC",12);
if (isset ($_GET['page']))
	$activepage=(int)$_GET['page'];
if (isset ($_GET['ord']))
	{ 
	$activeorder=$_GET['ord'];
	$activepage=1;
	}
if ($activeorder=="") 
	$activeorder="ipaddr_ip.ip";
$testoqry="
SELECT ipaddr_ip.ip, ipaddr_ip.livello, 
    ipaddr_reparti.descrizione, ipaddr_aziende.sito
FROM 
	ipaddr_aziende INNER JOIN ipaddr_ip ON ipaddr_aziende.id = ipaddr_ip.fkazienda 
	INNER JOIN ipaddr_reparti ON ipaddr_ip.reparto = ipaddr_reparti.id
";

$dati=$db->get_results($testoqry);
$nrows=sizeof($dati);
$npages=$nrows/NREC;
$npages=(int)$npages;
if ($nrows%NREC) $npages++;

$activepage=limita($activepage,1,$npages);
$ffpage=  limita($activepage+10,1,$npages);
$rewpage= limita($activepage-10,1,$npages);
$nextpage=limita($activepage+1,1,$npages);
$prevpage=limita($activepage-1,1,$npages);

setcookie('activepage',$activepage);
setcookie('activeorder',$activeorder);


$menubar=new barramenu;
$menubar->add("AGGIUNGI UN NUOVO INDIRIZZO","index.php?modulo=edit&app=ipaddress","");
$menubar->show();

$html=new smartypc;
$html->assign('dati',$dati);
$html->assign('nrec',NREC);
$html->display('ipaddr/sfoglia.tpl');

?>

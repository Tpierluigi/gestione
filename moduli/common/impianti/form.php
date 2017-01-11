<?php
unset($dati);
$dati=$db->get_results("SELECT  * from paesi order by Descrizione");
foreach ($dati as $dato)
	$paesi[$dato->id_paese]=$dato->descrizione; //lo trasformo in un array associativo x il template smarty
$html=new smartypc;
$html->assign('paesi',$paesi);
$html->display('ipaddr/sedi.tpl');

?>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<?
$ord=$_GET['ord'];
if ($ord=="") $ord="stampanti.id";
$testoqry="";
$testoqry.="select stampanti.id, stampanti.sn,modellistampante.descrizione, "; 
$testoqry.="elencoposizioni.descrizione as posizione,stampanti.firmware ";
$testoqry.="from modellistampante inner join stampanti on  modellistampante.id = stampanti.modello ";
$testoqry.="inner join  elencoposizioni on stampanti.posizione = elencoposizioni.id order by $ord";
$dati=$db->get_results($testoqry);
if (autorizzato(0))
	$autorizzato="ok";
else
	$autorizzato="no";
$menubar=new barramenu;
$menubar->add("AGGIUNGI NUOVA STAMPANTE","index.php?modulo=stampante&app=stampanti&azione=add","");
$menubar->add("MENU GENERALE","index.php","");
$menubar->show();
stampatitolo( "SELEZIONA LA STAMPANTE DESIDERATA" );

$html=new smartypc;
$html->assign('dati',$dati);
$html->assign('autorizzato',$autorizzato);
$html->display('stampanti/sfoglia.tpl');

?>

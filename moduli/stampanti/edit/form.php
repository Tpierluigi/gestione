<?
$codice=$_GET['codice'];
$stampante=new oggetto("stampanti","stampanti/edit.tpl","codice");
$stampante->oSmarty=new smartypc;
$stampante->read($codice);
$stampante->addTable('posizioni',"select * from Elencoposizioni order by Descrizione");
$stampante->oSmarty->assign('posizioni',$stampante->oTabSec['posizioni']);
$stampante->addTable('modelli',"select * from ModelliStampante ");
$stampante->oSmarty->assign('modelli',$stampante->oTabSec['modelli']);

if ($codice!="")
  {
  $query="SELECT OpzioniStampanti.ID,OpzioniStampanti.Descrizione
  FROM ElencoOpzioniStampanti INNER JOIN OpzioniStampanti ON 
       ElencoOpzioniStampanti.IDOpzione = OpzioniStampanti.ID
  WHERE (ElencoOpzioniStampanti.CodStampante = '$codice')";
	$stampante->addTable('opzioni',$query);
	$stampante->oSmarty->assign('opzioni',$stampante->oTabSec['opzioni']);
	}
$stampante->show();

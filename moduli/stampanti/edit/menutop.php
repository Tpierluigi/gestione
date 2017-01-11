<?php
$menubar=new barramenu;
if ($codice!="")
	{
    $menubar->add( "MODIFICA OPZIONI", "","aggiorna('index.php?modulo=gestionestoria&app=stampanti&id=$codice')");
    $menubar->add( "GESTIONE INTERVENTI", "", "aggiorna('index.php?modulo=gestionedoc&app=stampanti&id=$codice')");
    }
$menubar->add( "TORNA ALLA LISTA", "","aggiorna('index.php?modulo=sfoglia&app=stampanti')");
if ($codice!='')
  	{
	$val="upd"; 
	$capt="APPLICA LE MODIFICHE";
	}
  else
  	{
		$capt="AGGIUNGI LA STAMPANTE";
		$val="add";
		}
  $menubar->add( $capt, "","document.frmStampante.submit()");
  $menubar->show();
?>

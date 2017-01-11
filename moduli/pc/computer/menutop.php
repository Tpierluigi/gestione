<?php
$menubar=new barramenu;

if ($dati->ID>0)
	{
  $menubar->add( "GESTIONE CRONOLOGIA", "","aggiorna('index.php?modulo=gestionestoria&app=PC&id=$dati->ID')");
  $menubar->add( "DATI ULTERIORI", "","aggiorna('index.php?modulo=dativari&app=PC&id=$dati->ID')");
  $menubar->add( "GESTIONE DOCUMENTI", "", "aggiorna('index.php?modulo=gestionedoc&app=PC&id=$dati->ID')");
  $menubar->add( "SOFTWARE INSTALLATO", "","aggiorna('index.php?modulo=gestioneSW&app=PC&id=$dati->ID')");
  $menubar->add( "FUNZIONALITA", "","aggiorna('index.php?modulo=funzioni&app=PC&id=$dati->ID')");
  $menubar->add( "MONITORAGGI", "","aggiorna('index.php?modulo=gestionexml&app=PC&id=$dati->ID')");
  }
$menubar->add( "TORNA ALLA LISTA", "","aggiorna('index.php?modulo=sfogliapc&app=PC')");
if ($dati->ID>0)
	  {$val="upd"; $capt="AGGIORNA";}
else
		{$capt="AGGIUNGI IL PC";$val="add";}
$menubar->add( $capt, "","document.frmComputer.submit()");
$menubar->show();
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Gestione PC e apparecchi industriali v.0.90</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<link rel="stylesheet" type="text/css" href="stile.css" />
</HEAD>
<BODY>

<?php
include_once("ez_sql.php");
$_codusr=$_COOKIE['id'];

$_datiutente=@$db->get_row("select * from utenti where ID=$_codusr"); 

?>
<P align=center><STRONG>Gestione PC e apparecchi industriali V.1.0<br> Utente: <?=$_datiutente->UserName;?></STRONG></P>
<hr noshade>

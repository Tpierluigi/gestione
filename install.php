<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>installazione Dbase PC e stampanti</title>
</head>
<body>
<?php
include ("lib\ez_sql.php");
include ("lib\generali.php");
 
if (sizeof($_POST)>1)
	{
	$db = new db($_POST['fUserName'],$_POST['fPassword'],$_POST['fNomeDB'],$_POST['fServer']);
	$query=file_get_contents("install.sql");
	$db->query($query);
	printf( "<h2 align=center>OPERAZIONE COMPLETATA</h2>\n" );
	printf( "<div align=center><a href=\"index.php\">menu principale..</a></div>\n" );
	die();
	}
 ?>

 
<form action=install.php method="post">
<fieldset>
<legend><b>installazione Dbase PC e stampanti</b></legend>
<div style="background-color: #006699; color:white;"><i>Inserisci i dati di installazione e premi su 'procedi'</i></div>
<table>
	<tr>
		<td>Server (ip o nome):</td>
		<td><input name="fServer"></td>
	</tr>
	<tr>
		<td>Nome del Database:</td>
		<td><input name="fNomeDB"></td>
	</tr>
	<tr>
		<td>username (deve avere i diritti di amministrazione sul database):</td>
		<td><input name="fUserName"></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" name="fPassword"></td>
	</tr>
	<tr>
		<td><input type="reset" value="annulla"></td>
		<td><input type="submit" value="PROCEDI >>"></td>
	</tr>

</table>
</fieldset>
</form>
</body>
</html>

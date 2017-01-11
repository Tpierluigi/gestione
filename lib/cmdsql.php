<?php
include ("ez_sql.php");
include ("generali.php");

$settaggi=parse_ini_file("..\config.ini",true);
$db=new DB(
$settaggi['database']['Utente'],
$settaggi['database']['Password'],
$settaggi['database']['Database'],
$settaggi['database']['Server']);


$command = $_GET["command"];
$table= $_GET["table"];
$field= $_GET["field"];
$value=stripslashes( $_GET["value"]);
$where=stripslashes( $_GET["where"]);
$var=$_GET["var"];
$query=stripslashes($_GET["query"]);

if (preg_match("/^sel$/i",$command)){
	$dati=DBSelect($db,$table,$field,$where);
	echo $var."=".JSON_string($dati).";";
}
if (preg_match("/^del$/i",$command)){
	//$dati=DBDelete($db,$table,$where);
}
else if (preg_match("/^upd$/i",$command)){
	$fields=explode(",",$field);
	$values=explode(",",$value);
	if (sizeof($fields)==sizeof($values)){
  	for ($i=0;$i<sizeof($fields);$i++)
			$arr[$fields[$i]]=$values[$i];
	}
	DBUpdate($db,$table,$arr,$where);
}
else if (preg_match("/^ins$/i",$command)){
	$fields=explode(",",$field);
	$values=explode(",",$value);
	if (sizeof($fields)==sizeof($values)){
  	for ($i=0;$i<sizeof($fields);$i++)
			$arr[$fields[$i]]=$values[$i];
	}
	print_r($arr);
	//DBInsert($db,$table,$arr);
}
else if (preg_match("/^passthru$/i",$command)){
	$db->query($sql);
}


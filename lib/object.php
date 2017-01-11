<?php 
include_once('Smarty.class.php');
include_once('ez_sql.php');

class SecTableType
	{
	var $val;
	var $desc;
	var $nrec;
	}
class oggetto
	{
	var $sTabella;
	var $oDati;
	var $oSmarty;
	var $sTemplate;
	var $sPKname;
	var $oTabSec;
	function oggetto($tabella,$template,$chiave)
		{
		$this->sTabella=$tabella;
		$this->sTemplate=$template;
		$this->sPKname=$chiave;
		}
	function read ($id)
		{
		global $db;
		if (!isset($this->oSmarty)) 
			die("ERRORE [oggetto::read()]: Smarty non attivata!");
		$this->oDati=$db->get_row("select * from ".$this->sTabella." where ".$this->sPKname."='$id'");
		$this->oSmarty->assign('dati',$this->oDati);
		}
	function add ()
		{
		global $db;
		global $_POST;
		foreach ($_POST as $chiave=>$valore)
			{
			if (strtolower(substr($chiave,0,4))=='fld_')
				{
				$parametri[substr($chiave,4)]=$valore;
				}
			}
		foreach ($parametri as $chiave=>$valore)
			{
			$elencocampi.="$chiave, ";
			$elencovalori.="'$valore', ";
			}
		$elencocampi=rtrim($elencocampi,', ');
		$elencovalori=rtrim($elencovalori,', ');
		
		$sql="insert into $this->sTabella ($elencocampi) values($elencovalori)";
		$db->query($sql);
		}

	function upd ($id='')
		{
		global $db;
		global $_POST;
		foreach ($_POST as $chiave=>$valore)
			{
			if (strtolower(substr($chiave,0,4))=='fld_')
				{
				$nome=substr($chiave,4);
				$parametri[$nome]=$valore;
				if ($nome==$this->sPKname) $autoid=$valore;
				}
			}
		if (!isset($autoid)) 
			$autoid=$id;
		
		foreach ($parametri as $chiave=>$valore)
			{
			$elenco.="$chiave='$valore', ";
			}
		$elenco=rtrim($elenco,', ');
		
		$sql="update $this->sTabella set $elenco where $this->sPKname='$autoid'";
		$db->query($sql);
		}
	function del ($id='')
		{
		global $db;
		global $_POST;
		foreach ($_POST as $chiave=>$valore)
			{
			if (strtolower(substr($chiave,0,4))=='fld_')
				{
				$nome=substr($chiave,4);
				$parametri[$nome]=$valore;
				if ($nome==$this->sPKname) $autoid=$valore;
				}
			}
		if (!isset($autoid)) 
			$autoid=$id;

		$sql="delete from $this->sTabella where $this->sPKname='$autoid'";
		$db->query($sql);
		}
	function show ()
		{
		if (!isset($this->oSmarty)) 
			die("ERRORE [oggetto::show()]: Smarty non attivata!");
		$this->oSmarty->display($this->sTemplate);
		}
  function addTable($nometab,$sql)
  	{
		global $db;
		$elenco=$db->get_results($sql,ARRAY_N);
		if (sizeof ($elenco)>0)
			{
    	$this->oTabSec[$nometab]=new SecTableType;
  		foreach ($elenco as $pos)
    		{
    		$this->oTabSec[$nometab]->val[]= $pos[0];
    		$this->oTabSec[$nometab]->desc[]=$pos[1];
    		}
    	$this->oTabSec[$nometab]->nrec=sizeof($this->oTabSec[$nometab]->val);
			return true;
			}
		else
			return false;
  	}
	};		
	
 ?>
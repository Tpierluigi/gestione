<?php
/*
	This SQL query will create the table to store your object.

	CREATE TABLE `t_config_righe` (
	`t_config_righeid` int(11) NOT NULL auto_increment,
	`id_pc` INT NOT NULL,
	`id_configurazione` INT NOT NULL,
	`id_voce` VARCHAR(255) NOT NULL,
	`num_voce` int NOT NULL,
	`val_voce` TEXT NOT NULL, PRIMARY KEY  (`t_config_righeid`)) ENGINE=MyISAM;
*/

/**
* <b>t_config_righe</b> class with integrated CRUD methods.
* @author Php Object Generator
* @version POG 3.0d / PHP4
* @copyright Free for personal & commercial use. (Offered under the BSD license)
* @link http://www.phpobjectgenerator.com/?language=php4&wrapper=pog&objectName=t_config_righe&attributeList=array+%28%0A++0+%3D%3E+%27id_pc%27%2C%0A++1+%3D%3E+%27id_configurazione%27%2C%0A++2+%3D%3E+%27id_voce%27%2C%0A++3+%3D%3E+%27num_voce%27%2C%0A++4+%3D%3E+%27val_voce%27%2C%0A%29&typeList=array+%28%0A++0+%3D%3E+%27INT%27%2C%0A++1+%3D%3E+%27INT%27%2C%0A++2+%3D%3E+%27VARCHAR%28255%29%27%2C%0A++3+%3D%3E+%27int%27%2C%0A++4+%3D%3E+%27TEXT%27%2C%0A%29
*/
include_once('class.pog_base.php');
class t_config_righe extends POG_Base
{
	var $t_config_righeId = '';

	/**
	 * @var INT
	 */
	var $id_pc;
	
	/**
	 * @var INT
	 */
	var $id_configurazione;
	
	/**
	 * @var VARCHAR(255)
	 */
	var $id_voce;
	
	/**
	 * @var int
	 */
	var $num_voce;
	
	/**
	 * @var TEXT
	 */
	var $val_voce;
	
	var $pog_attribute_type = array(
		"t_config_righeId" => array('db_attributes' => array("NUMERIC", "INT")),
		"id_pc" => array('db_attributes' => array("NUMERIC", "INT")),
		"id_configurazione" => array('db_attributes' => array("NUMERIC", "INT")),
		"id_voce" => array('db_attributes' => array("TEXT", "VARCHAR", "255")),
		"num_voce" => array('db_attributes' => array("NUMERIC", "INT")),
		"val_voce" => array('db_attributes' => array("TEXT", "TEXT")),
		);
	var $pog_query;
	
	
	/**
	* Getter for some private attributes
	* @return mixed $attribute
	*/
	function __get($attribute, &$value)
	{
		@eval('$result = $this->_'.$attribute.';');
		if ($result == null)
		{
			$value = false;
		}
		$value = $result;
		return true;
	}
	
	function t_config_righe($id_pc='', $id_configurazione='', $id_voce='', $num_voce='', $val_voce='')
	{
		$this->id_pc = $id_pc;
		$this->id_configurazione = $id_configurazione;
		$this->id_voce = $id_voce;
		$this->num_voce = $num_voce;
		$this->val_voce = $val_voce;
	}
	
	
	/**
	* Gets object from database
	* @param integer $t_config_righeId 
	* @return object $t_config_righe
	*/
	function Get($t_config_righeId)
	{
		$connection = Database::Connect();
		$this->pog_query = "select * from `t_config_righe` where `t_config_righeid`='".intval($t_config_righeId)."' LIMIT 1";
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$this->t_config_righeId = $row["t_config_righeid"];
			$this->id_pc = $this->Unescape($row["id_pc"]);
			$this->id_configurazione = $this->Unescape($row["id_configurazione"]);
			$this->id_voce = $this->Unescape($row["id_voce"]);
			$this->num_voce = $this->Unescape($row["num_voce"]);
			$this->val_voce = $this->Unescape($row["val_voce"]);
		}
		return $this;
	}
	
	
	/**
	* Returns a sorted array of objects that match given conditions
	* @param multidimensional array {("field", "comparator", "value"), ("field", "comparator", "value"), ..} 
	* @param string $sortBy 
	* @param boolean $ascending 
	* @param int limit 
	* @return array $t_config_righeList
	*/
	function GetList($fcv_array = array(), $sortBy='', $ascending=true, $limit='')
	{
		$connection = Database::Connect();
		$sqlLimit = ($limit != '' ? "LIMIT $limit" : '');
		$this->pog_query = "select * from `t_config_righe` ";
		$t_config_righeList = Array();
		if (sizeof($fcv_array) > 0)
		{
			$this->pog_query  = $this->pog_query . " where ";
			for ($i=0, $c=sizeof($fcv_array); $i<$c; $i++)
			{
				if (sizeof($fcv_array[$i]) == 1)
				{
					$this->pog_query  = $this->pog_query . " ".$fcv_array[$i][0]." ";
					continue;
				}
				else
				{
					if ($i > 0 && sizeof($fcv_array[$i-1]) != 1)
					{
						$this->pog_query  = $this->pog_query . " AND ";
					}
					if (isset($this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes']) && $this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes'][0] != 'NUMERIC' && $this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes'][0] != 'SET')
					{
						if ($GLOBALS['configuration']['db_encoding'] == 1)
						{
							$value = POG_Base::IsColumn($fcv_array[$i][2]) ? "BASE64_DECODE(".$fcv_array[$i][2].")" : "'".$fcv_array[$i][2]."'";
							$this->pog_query  = $this->pog_query . "BASE64_DECODE(`".$fcv_array[$i][0]."`) ".$fcv_array[$i][1]." ".$value;
						}
						else
						{
							$value =  POG_Base::IsColumn($fcv_array[$i][2]) ? $fcv_array[$i][2] : "'".$this->Escape($fcv_array[$i][2])."'";
							$this->pog_query  = $this->pog_query . "`".$fcv_array[$i][0]."` ".$fcv_array[$i][1]." ".$value;
						}
					}
					else
					{
						$value = POG_Base::IsColumn($fcv_array[$i][2]) ? $fcv_array[$i][2] : "'".$fcv_array[$i][2]."'";
						$this->pog_query  = $this->pog_query . "`".$fcv_array[$i][0]."` ".$fcv_array[$i][1]." ".$value;
					}
				}
			}
		}
		if ($sortBy != '')
		{
			if (isset($this->pog_attribute_type[$sortBy]['db_attributes']) && $this->pog_attribute_type[$sortBy]['db_attributes'][0] != 'NUMERIC' && $this->pog_attribute_type[$sortBy]['db_attributes'][0] != 'SET')
			{
				if ($GLOBALS['configuration']['db_encoding'] == 1)
				{
					$sortBy = "BASE64_DECODE($sortBy) ";
				}
				else
				{
					$sortBy = "$sortBy ";
				}
			}
			else
			{
				$sortBy = "$sortBy ";
			}
		}
		else
		{
			$sortBy = "t_config_righeid";
		}
		$this->pog_query  = $this->pog_query . " order by ".$sortBy." ".($ascending ? "asc" : "desc")." $sqlLimit";
		$thisObjectName = get_class($this);
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$t_config_righe = new $thisObjectName();
			$t_config_righe->t_config_righeId = $row['t_config_righeid'];
			$t_config_righe->id_pc = $this->Unescape($row['id_pc']);
			$t_config_righe->id_configurazione = $this->Unescape($row['id_configurazione']);
			$t_config_righe->id_voce = $this->Unescape($row['id_voce']);
			$t_config_righe->num_voce = $this->Unescape($row['num_voce']);
			$t_config_righe->val_voce = $this->Unescape($row['val_voce']);
			$t_config_righeList[] = $t_config_righe;
		}
		return $t_config_righeList;
	}
	
	
	/**
	* Saves the object to the database
	* @return integer $t_config_righeId
	*/
	function Save()
	{
		$connection = Database::Connect();
		$this->pog_query = "select `t_config_righeid` from `t_config_righe` where `t_config_righeid`='".$this->t_config_righeId."' LIMIT 1";
		$rows = Database::Query($this->pog_query, $connection);
		if ($rows > 0)
		{
			$this->pog_query = "update `t_config_righe` set 
			`id_pc`='".$this->Escape($this->id_pc)."', 
			`id_configurazione`='".$this->Escape($this->id_configurazione)."', 
			`id_voce`='".$this->Escape($this->id_voce)."', 
			`num_voce`='".$this->Escape($this->num_voce)."', 
			`val_voce`='".$this->Escape($this->val_voce)."' where `t_config_righeid`='".$this->t_config_righeId."'";
		}
		else
		{
			$this->pog_query = "insert into `t_config_righe` (`id_pc`, `id_configurazione`, `id_voce`, `num_voce`, `val_voce` ) values (
			'".$this->Escape($this->id_pc)."', 
			'".$this->Escape($this->id_configurazione)."', 
			'".$this->Escape($this->id_voce)."', 
			'".$this->Escape($this->num_voce)."', 
			'".$this->Escape($this->val_voce)."' )";
		}
		$insertId = Database::InsertOrUpdate($this->pog_query, $connection);
		if ($this->t_config_righeId == "")
		{
			$this->t_config_righeId = $insertId;
		}
		return $this->t_config_righeId;
	}
	
	
	/**
	* Clones the object and saves it to the database
	* @return integer $t_config_righeId
	*/
	function SaveNew()
	{
		$this->t_config_righeId = '';
		return $this->Save();
	}
	
	
	/**
	* Deletes the object from the database
	* @return boolean
	*/
	function Delete()
	{
		$connection = Database::Connect();
		$this->pog_query = "delete from `t_config_righe` where `t_config_righeid`='".$this->t_config_righeId."'";
		return Database::NonQuery($this->pog_query, $connection);
	}
	
	
	/**
	* Deletes a list of objects that match given conditions
	* @param multidimensional array {("field", "comparator", "value"), ("field", "comparator", "value"), ..} 
	* @param bool $deep 
	* @return 
	*/
	function DeleteList($fcv_array)
	{
		if (sizeof($fcv_array) > 0)
		{
			$connection = Database::Connect();
			$pog_query = "delete from `t_config_righe` where ";
			for ($i=0, $c=sizeof($fcv_array); $i<$c; $i++)
			{
				if (sizeof($fcv_array[$i]) == 1)
				{
					$pog_query  = $pog_query . " ".$fcv_array[$i][0]." ";
					continue;
				}
				else
				{
					if ($i > 0 && sizeof($fcv_array[$i-1]) !== 1)
					{
						$pog_query  = $pog_query . " AND ";
					}
					if (isset($this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes']) && $this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes'][0] != 'NUMERIC' && $this->pog_attribute_type[$fcv_array[$i][0]]['db_attributes'][0] != 'SET')
					{
						$pog_query  = $pog_query . "`".$fcv_array[$i][0]."` ".$fcv_array[$i][1]." '".$this->Escape($fcv_array[$i][2])."'";
					}
					else
					{
						$pog_query  = $pog_query . "`".$fcv_array[$i][0]."` ".$fcv_array[$i][1]." '".$fcv_array[$i][2]."'";
					}
				}
			}
			return Database::NonQuery($pog_query, $connection);
		}
	}
}overload('t_config_righe');
?>
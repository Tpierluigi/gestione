<?php
/*
	This SQL query will create the table to store your object.

	CREATE TABLE `t_config_configurazioni` (
	`t_config_configurazioniid` int(11) NOT NULL auto_increment,
	`id_pc` INT NOT NULL,
	`num_conf` INT NOT NULL,
	`desc_conf` VARCHAR(255) NOT NULL,
	`valida` TINYINT NOT NULL, PRIMARY KEY  (`t_config_configurazioniid`)) ENGINE=MyISAM;
*/

/**
* <b>t_config_configurazioni</b> class with integrated CRUD methods.
* @author Php Object Generator
* @version POG 3.0d / PHP4
* @copyright Free for personal & commercial use. (Offered under the BSD license)
* @link http://www.phpobjectgenerator.com/?language=php4&wrapper=pog&objectName=t_config_configurazioni&attributeList=array+%28%0A++0+%3D%3E+%27id_pc%27%2C%0A++1+%3D%3E+%27num_conf%27%2C%0A++2+%3D%3E+%27desc_conf%27%2C%0A++3+%3D%3E+%27valida%27%2C%0A%29&typeList=array+%28%0A++0+%3D%3E+%27INT%27%2C%0A++1+%3D%3E+%27INT%27%2C%0A++2+%3D%3E+%27VARCHAR%28255%29%27%2C%0A++3+%3D%3E+%27TINYINT%27%2C%0A%29
*/
include_once('class.pog_base.php');
class t_config_configurazioni extends POG_Base
{
	var $t_config_configurazioniId = '';

	/**
	 * @var INT
	 */
	var $id_pc;
	
	/**
	 * @var INT
	 */
	var $num_conf;
	
	/**
	 * @var VARCHAR(255)
	 */
	var $desc_conf;
	
	/**
	 * @var TINYINT
	 */
	var $valida;
	
	var $pog_attribute_type = array(
		"t_config_configurazioniId" => array('db_attributes' => array("NUMERIC", "INT")),
		"id_pc" => array('db_attributes' => array("NUMERIC", "INT")),
		"num_conf" => array('db_attributes' => array("NUMERIC", "INT")),
		"desc_conf" => array('db_attributes' => array("TEXT", "VARCHAR", "255")),
		"valida" => array('db_attributes' => array("NUMERIC", "TINYINT")),
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
	
	function t_config_configurazioni($id_pc='', $num_conf='', $desc_conf='', $valida='')
	{
		$this->id_pc = $id_pc;
		$this->num_conf = $num_conf;
		$this->desc_conf = $desc_conf;
		$this->valida = $valida;
	}
	
	
	/**
	* Gets object from database
	* @param integer $t_config_configurazioniId 
	* @return object $t_config_configurazioni
	*/
	function Get($t_config_configurazioniId)
	{
		$connection = Database::Connect();
		$this->pog_query = "select * from `t_config_configurazioni` where `t_config_configurazioniid`='".intval($t_config_configurazioniId)."' LIMIT 1";
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$this->t_config_configurazioniId = $row["t_config_configurazioniid"];
			$this->id_pc = $this->Unescape($row["id_pc"]);
			$this->num_conf = $this->Unescape($row["num_conf"]);
			$this->desc_conf = $this->Unescape($row["desc_conf"]);
			$this->valida = $this->Unescape($row["valida"]);
		}
		return $this;
	}
	
	
	/**
	* Returns a sorted array of objects that match given conditions
	* @param multidimensional array {("field", "comparator", "value"), ("field", "comparator", "value"), ..} 
	* @param string $sortBy 
	* @param boolean $ascending 
	* @param int limit 
	* @return array $t_config_configurazioniList
	*/
	function GetList($fcv_array = array(), $sortBy='', $ascending=true, $limit='')
	{
		$connection = Database::Connect();
		$sqlLimit = ($limit != '' ? "LIMIT $limit" : '');
		$this->pog_query = "select * from `t_config_configurazioni` ";
		$t_config_configurazioniList = Array();
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
			$sortBy = "t_config_configurazioniid";
		}
		$this->pog_query  = $this->pog_query . " order by ".$sortBy." ".($ascending ? "asc" : "desc")." $sqlLimit";
		$thisObjectName = get_class($this);
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$t_config_configurazioni = new $thisObjectName();
			$t_config_configurazioni->t_config_configurazioniId = $row['t_config_configurazioniid'];
			$t_config_configurazioni->id_pc = $this->Unescape($row['id_pc']);
			$t_config_configurazioni->num_conf = $this->Unescape($row['num_conf']);
			$t_config_configurazioni->desc_conf = $this->Unescape($row['desc_conf']);
			$t_config_configurazioni->valida = $this->Unescape($row['valida']);
			$t_config_configurazioniList[] = $t_config_configurazioni;
		}
		return $t_config_configurazioniList;
	}
	
	
	/**
	* Saves the object to the database
	* @return integer $t_config_configurazioniId
	*/
	function Save()
	{
		$connection = Database::Connect();
		$this->pog_query = "select `t_config_configurazioniid` from `t_config_configurazioni` where `t_config_configurazioniid`='".$this->t_config_configurazioniId."' LIMIT 1";
		$rows = Database::Query($this->pog_query, $connection);
		if ($rows > 0)
		{
			$this->pog_query = "update `t_config_configurazioni` set 
			`id_pc`='".$this->Escape($this->id_pc)."', 
			`num_conf`='".$this->Escape($this->num_conf)."', 
			`desc_conf`='".$this->Escape($this->desc_conf)."', 
			`valida`='".$this->Escape($this->valida)."' where `t_config_configurazioniid`='".$this->t_config_configurazioniId."'";
		}
		else
		{
			$this->pog_query = "insert into `t_config_configurazioni` (`id_pc`, `num_conf`, `desc_conf`, `valida` ) values (
			'".$this->Escape($this->id_pc)."', 
			'".$this->Escape($this->num_conf)."', 
			'".$this->Escape($this->desc_conf)."', 
			'".$this->Escape($this->valida)."' )";
		}
		$insertId = Database::InsertOrUpdate($this->pog_query, $connection);
		if ($this->t_config_configurazioniId == "")
		{
			$this->t_config_configurazioniId = $insertId;
		}
		return $this->t_config_configurazioniId;
	}
	
	
	/**
	* Clones the object and saves it to the database
	* @return integer $t_config_configurazioniId
	*/
	function SaveNew()
	{
		$this->t_config_configurazioniId = '';
		return $this->Save();
	}
	
	
	/**
	* Deletes the object from the database
	* @return boolean
	*/
	function Delete()
	{
		$connection = Database::Connect();
		$this->pog_query = "delete from `t_config_configurazioni` where `t_config_configurazioniid`='".$this->t_config_configurazioniId."'";
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
			$pog_query = "delete from `t_config_configurazioni` where ";
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
}overload('t_config_configurazioni');
?>
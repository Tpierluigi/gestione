<?php
/*
	This SQL query will create the table to store your object.

	CREATE TABLE `t_config_voci` (
	`t_config_vociid` int(11) NOT NULL auto_increment,
	`id_voce` VARCHAR(255) NOT NULL,
	`desc_voce` VARCHAR(255) NOT NULL,
	`nome_tab` VARCHAR(255) NOT NULL, PRIMARY KEY  (`t_config_vociid`)) ENGINE=MyISAM;
*/

/**
* <b>t_config_voci</b> class with integrated CRUD methods.
* @author Php Object Generator
* @version POG 3.0d / PHP4
* @copyright Free for personal & commercial use. (Offered under the BSD license)
* @link http://www.phpobjectgenerator.com/?language=php4&wrapper=pog&objectName=t_config_voci&attributeList=array+%28%0A++0+%3D%3E+%27id_voce%27%2C%0A++1+%3D%3E+%27desc_voce%27%2C%0A++2+%3D%3E+%27nome_tab%27%2C%0A%29&typeList=array+%28%0A++0+%3D%3E+%27VARCHAR%28255%29%27%2C%0A++1+%3D%3E+%27VARCHAR%28255%29%27%2C%0A++2+%3D%3E+%27VARCHAR%28255%29%27%2C%0A%29
*/
include_once('class.pog_base.php');
class t_config_voci extends POG_Base
{
	var $t_config_vociId = '';

	/**
	 * @var VARCHAR(255)
	 */
	var $id_voce;
	
	/**
	 * @var VARCHAR(255)
	 */
	var $desc_voce;
	
	/**
	 * @var VARCHAR(255)
	 */
	var $nome_tab;
	
	var $pog_attribute_type = array(
		"t_config_vociId" => array('db_attributes' => array("NUMERIC", "INT")),
		"id_voce" => array('db_attributes' => array("TEXT", "VARCHAR", "255")),
		"desc_voce" => array('db_attributes' => array("TEXT", "VARCHAR", "255")),
		"nome_tab" => array('db_attributes' => array("TEXT", "VARCHAR", "255")),
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
	
	function t_config_voci($id_voce='', $desc_voce='', $nome_tab='')
	{
		$this->id_voce = $id_voce;
		$this->desc_voce = $desc_voce;
		$this->nome_tab = $nome_tab;
	}
	
	
	/**
	* Gets object from database
	* @param integer $t_config_vociId 
	* @return object $t_config_voci
	*/
	function Get($t_config_vociId)
	{
		$connection = Database::Connect();
		$this->pog_query = "select * from `t_config_voci` where `t_config_vociid`='".intval($t_config_vociId)."' LIMIT 1";
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$this->t_config_vociId = $row["t_config_vociid"];
			$this->id_voce = $this->Unescape($row["id_voce"]);
			$this->desc_voce = $this->Unescape($row["desc_voce"]);
			$this->nome_tab = $this->Unescape($row["nome_tab"]);
		}
		return $this;
	}
	
	
	/**
	* Returns a sorted array of objects that match given conditions
	* @param multidimensional array {("field", "comparator", "value"), ("field", "comparator", "value"), ..} 
	* @param string $sortBy 
	* @param boolean $ascending 
	* @param int limit 
	* @return array $t_config_vociList
	*/
	function GetList($fcv_array = array(), $sortBy='', $ascending=true, $limit='')
	{
		$connection = Database::Connect();
		$sqlLimit = ($limit != '' ? "LIMIT $limit" : '');
		$this->pog_query = "select * from `t_config_voci` ";
		$t_config_vociList = Array();
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
			$sortBy = "t_config_vociid";
		}
		$this->pog_query  = $this->pog_query . " order by ".$sortBy." ".($ascending ? "asc" : "desc")." $sqlLimit";
		$thisObjectName = get_class($this);
		$cursor = Database::Reader($this->pog_query, $connection);
		while ($row = Database::Read($cursor))
		{
			$t_config_voci = new $thisObjectName();
			$t_config_voci->t_config_vociId = $row['t_config_vociid'];
			$t_config_voci->id_voce = $this->Unescape($row['id_voce']);
			$t_config_voci->desc_voce = $this->Unescape($row['desc_voce']);
			$t_config_voci->nome_tab = $this->Unescape($row['nome_tab']);
			$t_config_vociList[] = $t_config_voci;
		}
		return $t_config_vociList;
	}
	
	
	/**
	* Saves the object to the database
	* @return integer $t_config_vociId
	*/
	function Save()
	{
		$connection = Database::Connect();
		$this->pog_query = "select `t_config_vociid` from `t_config_voci` where `t_config_vociid`='".$this->t_config_vociId."' LIMIT 1";
		$rows = Database::Query($this->pog_query, $connection);
		if ($rows > 0)
		{
			$this->pog_query = "update `t_config_voci` set 
			`id_voce`='".$this->Escape($this->id_voce)."', 
			`desc_voce`='".$this->Escape($this->desc_voce)."', 
			`nome_tab`='".$this->Escape($this->nome_tab)."' where `t_config_vociid`='".$this->t_config_vociId."'";
		}
		else
		{
			$this->pog_query = "insert into `t_config_voci` (`id_voce`, `desc_voce`, `nome_tab` ) values (
			'".$this->Escape($this->id_voce)."', 
			'".$this->Escape($this->desc_voce)."', 
			'".$this->Escape($this->nome_tab)."' )";
		}
		$insertId = Database::InsertOrUpdate($this->pog_query, $connection);
		if ($this->t_config_vociId == "")
		{
			$this->t_config_vociId = $insertId;
		}
		return $this->t_config_vociId;
	}
	
	
	/**
	* Clones the object and saves it to the database
	* @return integer $t_config_vociId
	*/
	function SaveNew()
	{
		$this->t_config_vociId = '';
		return $this->Save();
	}
	
	
	/**
	* Deletes the object from the database
	* @return boolean
	*/
	function Delete()
	{
		$connection = Database::Connect();
		$this->pog_query = "delete from `t_config_voci` where `t_config_vociid`='".$this->t_config_vociId."'";
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
			$pog_query = "delete from `t_config_voci` where ";
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
}overload('t_config_voci');
?>
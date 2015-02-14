<?
include_once ("ez_sql.php");
include ("debug.php");
class DBLink
		{
		var $sVariabili;
		var $sTipiVariabili;
		var $sCampi;
		var $sTabella;
		var $sOperazione;
		var $nID;
		var $oDB;
		function DBLink($db)
			{
			if (!isset($db))
				{
				echo "DBLink: manca collegamento al DB";
				debug();
				}
			else
				$this->oDB=$db;
			}	
		//----------------------------------------------
		function AddLink($var,$fld="",$tfld="s")
			{
			if  (($tfld=="s")||($tfld=="n")||($tfld=="d"))
				{
  			if ($fld=="") $fld=$var;
  			$this->sVariabili[]=$var;
  			$this->sCampi[]=$fld;
  			$this->sTipiVariabili[]=$tfld;
				}
			else
				{
				echo "Addlink: tipo della variabile non corretto: possibili valori sono (s)tringa,(d)ata,(n)umerico";
				debug();
				}
			}
		function RemoveLink($var)
			{
			for($i=0;$i<=sizeof($this->sVariabili);$i++)
				{
				if ($this->sVariabili[$i]==$var)
					{
					unset($this->sVariabili[$i]);
					unset($this->sCampi[$i]);
					unset($this->sTipiVariabili[$i]);
					}
				}
			}
		function SetID($id)
			{
			$this->nID=$id;
			}
		function SetOpt($opt)
			{
			if (($opt=="add")||($opt=="upd")||($opt=="del")||($opt=="sel"))
				$this->sOperazione=$opt;
			else
				{
				echo "SetOpt: operazione non corretta<br>";
				debug();
				}
			}
		function SetTbl($tbl)
			{
			$this->sTabella=$tbl;
			}

		function DoSQL()
			{
			if (!is_integer ($this->nID))
				{
				echo "DoSQL: ID non definito:";
				debug();
				die();
				}
			if($this->sOperazione=="")
				{
				echo "DoSQL: operazione non definita:";
				debug();
				die();
				}
			if($this->sTabella=="")
				{
				echo "DoSQL: tabella dati non definita:";
				debug();
				die();
				}
			switch ($this->sOperazione)
				{
				case 'sel':
					$SQL="Select ";
					for($i=0;$i<(sizeof($this->sCampi)-1);$i++)
						{
						$SQL.=$this->sCampi[$i].', ';
						}
					$i++;
					$SQL.=$this->sCampi[sizeof($this->sCampi)-1];
					$SQL.=" from ".$this->sTabella . " where id = ".$this->nID;
					$riga=$this->oDB->get_row($SQL,ARRAY_A);
					if (!$riga)
						{
						echo "DoSQL: Errore in SELECT ($SQL) ";
						debug();
						die();
						}

					for($i=0;$i<sizeof($this->sCampi);$i++)
						{
						$tempv=$this->sVariabili[$i];
						$tempc=$this->sCampi[$i];
						$GLOBALS[$tempv]=$riga[$tempc];
						}
					break;

				case "upd":
					$SQL="Update ".$this->sTabella. " set ";
					for($i=0;$i<(sizeof($this->sCampi)-1);$i++)
						{
						$tempv=$this->sVariabili[$i];
						$tempc=$this->sCampi[$i];
						$tempt=$this->sTipiVariabili[$i];
						if ($tempt=="s")
							$SQL.=sprintf("%s='%s', ",$tempc,$GLOBALS[$tempv]);
						if ($tempt=="n")
							$SQL.=sprintf("%s=%s, ",$tempc,$GLOBALS[$tempv]);
						}

					//processo l'ultimo campo
					$tempv=$this->sVariabili[$i];
					$tempc=$this->sCampi[$i];
					$tempt=$this->sTipiVariabili[$i];
					if ($tempt=="s")
						$SQL.=sprintf("%s='%s'",$tempc,$GLOBALS[$tempv]);
					if ($tempt=="n")
						$SQL.=sprintf("%s=%s",$tempc,$GLOBALS[$tempv]);

					$SQL.=" where id = ".$this->nID;
					$ok=$this->oDB->query($SQL);
					if ($this->oDB->rows_affected!=1)
						{
						echo "DoSQL: Errore in UPDATE ($SQL)";
						debug();
						die();
						}
					break;
				case "del":
					$SQL="delete from ".$this->sTabella." where id=". $this->nID;
					$ok=$this->oDB->query($SQL);
					if ($this->oDB->rows_affected!=1)
						{
						echo "DoSQL: Errore in DELETE ($SQL)";
						debug();
						die();
						}
					break;
				case "add":
					if ($this->nID==0) 
						{
  					$massimo=$this->oDB->get_row("select max(id) as val from ".$this->sTabella);
  					$massimo->val++;
						}
					else
						$massimo=$this->nID;
					$SQL="insert into ".$this->sTabella. " (";
					for($i=0;$i<sizeof($this->sCampi);$i++)
						{
						$tempc=$this->sCampi[$i];
						$SQL.="$tempc, ";
						}
					$SQL.="ID) values (";

					for($i=0;$i<sizeof($this->sCampi);$i++)
						{
						$tempv=$this->sVariabili[$i];
						$tempt=$this->sTipiVariabili[$i];
						if ($tempt=="s") $SQL.="'".$GLOBALS[$tempv]."', ";
						if ($tempt=="n") $SQL.=$GLOBALS[$tempv].", ";
						}
					$tempv=$this->sVariabili[$i];
					$SQL.=$massimo->val.")";
					$this->oDB->query($SQL);
					if ($this->oDB->rows_affected!=1)
						{
						echo "DoSQL: Errore in INSERT ($SQL)";
						debug();
						die();
						}
					break;
				default: break;
				}
			}
		};



?>

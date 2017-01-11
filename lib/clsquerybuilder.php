<?php
class qb_join
  {
  var $tabella1;
  var $tabella2;
  var $campo1;
  var $campo2;
  var $tipo;
  function qb_join($tab1,$tab2,$campo1,$campo2="",$tipo="")
    {
    $this->tabella1=strtoupper($tab1);
    $this->tabella2=strtoupper($tab2);
    $this->campo1=strtoupper($campo1);
    if ($campo2!="") $this->campo2=strtoupper($campo2); 
    else $this->campo2=strtoupper($campo1);
    if ($tipo!="") $this->tipo=strtoupper($tipo); 
    else $this->tipo='INNER';
    }

  }
class queryBuilder
  {
  var $tabelle;
  var $joins_ta;
  var $joins_tb;
  var $joins_ca;
  var $joins_cb;
  var $campi;
  var $tipo;
  }
 
 $a=new qb_join("t1","t2","c1");
 $b=new qb_join("t3","t4","c1");
 echo $a->sql();
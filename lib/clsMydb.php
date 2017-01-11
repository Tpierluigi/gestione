<?php

require_once 'DB.php';

class mydb extends DB{

  function mydb($utente,$password,$database,$server)
  {
  $dsn = "mysql://$utente:$password@$server/$database";
  $this =& DB::connect($dsn);
  if (PEAR::isError($this)) 
      die($this->getMessage());
  
  }
  
  function get_results($query)
  {
  print_r($this);
  $ris= & parent::getAll($query,array(),DB_FETCHMODE_OBJECT);
    if (PEAR::isError($this)) 
      die($this->getMessage());
  return $ris;
  }
  
};
$prv= new mydb("gestione","computer","pc","localhost");
print_r($prv->get_results("select * from apparecchi"));

?>
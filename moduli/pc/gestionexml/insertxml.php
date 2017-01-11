<?php
	//inserisco il record sul DB. Il come del file viene poi calcolato successivamente dal campo ID del record 
	//appena inserito. L'univocità è garantita dalla selezione dell'utente 
	  $db->query("insert into monitorxml(ID,PC,data,XML) values ('".md5_file($_FILES['Documento']['tmp_name'])."',$id,unix_timestamp(),'".base64_encode(gzcompress(file_get_contents($_FILES['Documento']['tmp_name'])))."')");
    //$val=$db->get_row("select * from  monitorxml where id='".md5_file($_FILES['Documento']['tmp_name'])."'");
    //fermete($val);			
	
?>
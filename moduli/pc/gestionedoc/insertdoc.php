<?
	//recupero ID dell'utente che sta eseguendo l'operazione, l'estensione del file passato e il MIME type
	$codutente=$_SESSION["id"]; 
	$estensione=substr($_FILES['Documento']['name'],strrpos($_FILES['Documento']['name'],'.'));
	$tipo=$_FILES['Documento']['type'];
	//inserisco il record sul DB. Il come del file viene poi calcolato successivamente dal campo ID del record 
	//appena inserito. L'univocità è garantita dalla selezione dell'utente 
	$nuovoID=TrovaPrimoIdLibero('documenti','ID');
	$Documento=strtolower($nuovoID.$estensione);	

	if (move_uploaded_file($_FILES['Documento']['tmp_name'], $uploaddir.$Documento))
    {
		$db->query("insert into documenti(ID,PC,IDUtente,Commento,Tipo,Documento) values ($nuovoID,$id,$codutente,'$commento','$tipo','$Documento')");
		print "File accettato";
    }
	else {
		print "Problemi nel trasferimento file!!\n";
		fermete($_FILES,false);
		fermete($Documento,false);    
	}
	
?>
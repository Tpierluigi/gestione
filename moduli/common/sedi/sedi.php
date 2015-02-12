<?
if (verificalivello(3))
	{
  @$azione=$_POST['azione'];
  @$sito=$_POST['sito'];
  @$cnaz=$_POST['fkpaese'];
  @$netmask=$_POST['netmask'];
  @$gateway=$_POST['gateway'];
  @$gatewayaz=$_POST['gatewayazienda'];
  $html=new smartypc;
  switch($azione)
  	{
  	case "add" : 
  		$newid=TrovaPrimoIDLibero('select * from aziende','id_azienda');
			$strsql="
				insert into aziende(id_azienda,id_paesi,sito,netmask,gateway,gatewayazienda)	
				values ($newid,'$cnaz','$sito','$netmask','$gateway','$gatewayaz')
				";
			$db->query($strsql);
			break;
  	}
  		
  
  $menubar=new barramenu;
  
  if(($azione=="add")||($azione==""))
  	{ 
    $menubar->add("NUOVA SEDE","","eseguiAzione('write','frmSedi')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmSedi')");
  
  $menubar->show();
  stampatitolo( "ELENCO SEDI REGISTRATE\n" );
  
  
  echo "<form action=\"index.php?modulo=sedi\" method=\"post\" id=\"frmSedi\">";
  printf( "<input type=\"hidden\" name=\"azione\" value=\"add\">" );
  
  if(($azione=="add")||($azione==""))
  	{
		$dati=$db->get_results("
		SELECT aziende.id_azienda, paesi.descrizione,aziende.sito
		FROM paesi INNER JOIN aziende ON
    paesi.id_paese = aziende.id_paesi
		");
    $html->assign('dati',$dati);
    $html->display('listasedi.tpl');	
		}
  if($azione=="write")
		{
    $dati=$db->get_results("SELECT  * from paesi order by Descrizione");
    foreach ($dati as $dato)
    	$paesi[$dato->id_paese]=$dato->descrizione; //lo trasformo in un array associativo x il template smarty
    $html->assign('paesi',$paesi);
    $html->display('sedi.tpl');
 		} 
  echo "</form>";
	}
?>


<?php
if (verificalivello(3))
	{
  @$azione=$_POST['azione'];
  @$sito=$_POST['sito'];
  @$impianto=$_POST['impianto'];	
  @$prgimpianto=$_POST['prgimpianto'];	
  $html=new smartypc;
  switch($azione)
  	{
  	case "add" : 
			$strsql="
				insert into impianti(id_aziende,progressivoimpianto,descrizione)	
				values ($sito,$prgimpianto,'$impianto')
				";
			$db->query($strsql);
			break;
  	}
  		
  
  $menubar=new barramenu;
  
  if(($azione=="add")||($azione==""))
  	{ 
    $menubar->add("NUOVO IMPIANTO","","eseguiAzione('write','frmImpianti')");
  	}
  if($azione=="write")
  	$menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmImpianti')");
  
  $menubar->show();
  stampatitolo( "ELENCO IMPIANTI INSERITI\n" );
  
  
  echo "<form action=\"index.php?modulo=impianti\" method=\"post\" id=\"frmImpianti\">";
  printf( "<input type=\"hidden\" name=\"azione\" value=\"add\">" );
  
  if(($azione=="add")||($azione==""))
  	{
		$dati=$db->get_results("
    SELECT impianti.progressivoimpianto, 
        impianti.descrizione, impianti.id_aziende,aziende.sito, 
        paesi.descrizione AS paese
    FROM impianti INNER JOIN
        aziende ON 
        impianti.id_aziende = aziende.id_azienda INNER JOIN
        paesi ON aziende.id_paesi = paesi.id_paese
		order by paesi.descrizione,aziende.id_azienda,impianti.progressivoimpianto
		");
    $html->assign('dati',$dati);
    $html->display('listaimpianti.tpl');	
		}
  if($azione=="write")
		{
    $dati=$db->get_results("
		SELECT 
		aziende.id_azienda,aziende.sito,paesi.descrizione as paese 
		from paesi inner join aziende on paesi.id_paese=aziende.id_paesi 
		order by paesi.descrizione,aziende.id_azienda
		");
		//fermete($dati);
    foreach ($dati as $dato)
    	$siti[$dato->id_azienda]="$dato->paese: $dato->sito"; //lo trasformo in un array associativo x il template smarty
    $html->assign('siti',$siti);
    $html->display('impianti.tpl');
 		} 
  echo "</form>";
	}
?>


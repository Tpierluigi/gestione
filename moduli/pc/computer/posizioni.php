<?
  $dati=$db->get_results("
	SELECT paesi.descrizione as paese,paesi.icona,paesi.id_paese,aziende.id_azienda,aziende.sito,impianti.*
	FROM 
		impianti inner join aziende on impianti.id_aziende=aziende.id_azienda
		inner join paesi on aziende.id_paesi=paesi.id_paese
	ORDER BY paesi.descrizione,sito,impianti.descrizione");

	$cont=0;

$root=new clsTree;
$root->value="Sedi San Benedetto";

foreach ($dati as $riga)
	{
	if (!isset ($root->subtree[$riga->id_paese]))
		{
		$root->subtree[$riga->id_paese]=new clsTree;
		$root->subtree[$riga->id_paese]->value=htmlentities($riga->paese);
		$root->subtree[$riga->id_paese]->icon="$riga->icona";
		}
	if (!isset ($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]))
		{
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]=new clsTree;
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->value=htmlentities($riga->sito);
		}
	if (!isset ($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]))
		{
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]=new clsTree;
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->value=htmlentities($riga->descrizione);
		$root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->link="javascript: assegna(\'$riga->id_aziende\',\'$riga->progressivoimpianto\')";
		
		}
	}

printf( "	<div id=\"finestrina\" style=\"top:200px;left:400px;\">\n" );
	printf( "<div class=\"titolo\" onclick=\"javascript:finestraposizione()\">CHIUDI</div>" );
	$root->dtree(true,$cont);	
printf( "</div>\n" );

?>

<?

function EseguiAggCampi($sTabella,$sCampo,$uValore,$aFiltro,$sAzione)
	{
	$sCondizione=' (';
	for($i=0;$i<sizeof($aFiltro['campi']);$i++)
		{
		if ($i!=0)
			$sCondizione.=' AND';
		$sCondizione.=' ('.$aFiltro['campi'][$i].' = '.$aFiltro['valori'][$i].')';
		}
	$sCondizione.=' )';
	if ($sCondizione==" ( )") 
		$sCondizione="";
	else
		$sCondizione=" WHERE".$sCondizione;
	switch ($sAzione)
		{
		case 'add':
			//aggiunge anche i filtri
			$sCampiUlteriori=implode(',',$aFiltro['campi']);
			$sValoriUlteriori=implode(',',$aFiltro['valori']);
			if ($sCampiUlteriori!="")
				$sCampiUlteriori=" ,".$sCampiUlteriori;
			if ($sValoriUlteriori!="")
				$sValoriUlteriori=" ,".$sValoriUlteriori;
			$sQuery="insert into $sTabella ($sCampo $sCampiUlteriori) values ($uValore $sValoriUlteriori)";
			break;
		case 'upd':
			$sQuery="update $sTabella set $sCampo=$uValore $sCondizione";
			break;
		case 'del':
			$sQuery="delete from $sTabella $sCondizione";
			break;
		}
	mssql_query($sQuery);
	//die($sQuery);	 
	}
	
function CreaControllo ($sNomeControllo,$sTipo,$sDescrizione,$vValore,$sQuery)
	{
	switch (sTipo)
		{
		case 'a':
			printf( "$sDescrizione :\n <textarea name=$nNomeControllo>$vValore</textarea>\n" );
			break;
		case 'f':
			printf( "$sDescrizione :\n <input type=text name=$sNomeControllo value=\"$vValore\">\n" );
			break;
		case 's':
			printf( "$sDescrizione :\n <select name=$sNomeControllo>\n" );
			$ris=mssql_query($sQuery);
			while($riga=mssql_fetch_array($ris)) $dati[]=$riga;
			foreach ($dati as $riga)
				{	
				$cod=$riga[0];
				$des=$riga[1];
				$sel=($cod==$vValore)? "selected":"";
				printf( "	<option value=\"$cod\" $sel>$des</option>\n" );
				}
			printf( "</select>\n" );
			break;
		}
	}
			
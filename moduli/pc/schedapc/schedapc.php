<?

if (verificalivello(3))
	{

  @$id=(int)$_GET['id'];
	
	$html=new smartypc;
  $dati=@$db->get_row("Select *, date_format(datainst,'%d/%m/%Y') as Datains from apparecchi where id=$id");
	$elenco=@$db->get_row("Select * from tipiapparecchi where id=$dati->Tipo");
  $funzioni=$db->get_results("
    SELECT 
      pc_funzioni.ordine, 
      pc_tipifunzione.ID, 
      pc_tipifunzione.funzione 
    FROM pc_tipifunzione INNER JOIN pc_funzioni ON pc_tipifunzione.ID = pc_funzioni.id_pc_tipifunzione 
    WHERE pc_funzioni.id_apparecchi=$id
    ORDER BY pc_funzioni.ordine
    ");
  $posizione=$db->get_row("
    SELECT aziende.sito, 
      impianti.descrizione AS impianto
    FROM apparecchi INNER JOIN impianti ON 
      apparecchi.id_aziende = impianti.id_aziende AND 
      apparecchi.progressivoimpianto = impianti.progressivoimpianto
       INNER JOIN aziende ON impianti.id_aziende = aziende.id_azienda
    WHERE apparecchi.ID = $id
    ");  
    
  if ($dati->ID>0)
		{
		$elencosw=$db->get_results("SELECT software.ID, software.Descrizione,elencosw.Versione FROM software INNER JOIN elencosw ON software.ID = elencosw.software WHERE elencosw.computer=$dati->ID");
		$html->assign('numsw',sizeof($elencosw));
		$html->assign('elencosw',$elencosw);
		$elencoint=$db->get_results("SELECT *,date_format(data,'%d/%m/%Y') as data FROM cronologia WHERE apparecchio=$dati->ID order by cronologia.data");
		$html->assign('numint',sizeof($elencoint));
		$html->assign('elencoint',$elencoint);
		$html->assign('funzioni',$funzioni);
    $html->assign('numfun',sizeof($funzioni));
		$html->assign('posizione',$posizione);
		}
	$html->assign('dati',$dati);
	$html->assign('tipo',$elenco);
	$html->display('schedapc/scheda.tpl');
	}
?>


<? if (verificalivello(2)): ?>	
    <script language="JavaScript" type="text/javascript">
        function aggiorna(ind)
        {
            document.frmComputer.fNuovaURL.value = ind;
            document.frmComputer.submit();
        }
        function finestraposizione()
        {
            rif = document.getElementById('finestrina');
            if (rif.style.display == 'none')
                rif.style.display = 'block';
            else
                rif.style.display = 'none';
        }
        function assegna(sede, impianto)
        {
            document.frmComputer.id_aziende.value = sede;
            document.frmComputer.progressivoimpianto.value = impianto;
            document.frmComputer.submit();
            rif = document.getElementById('finestrina');
            rif.style.display = 'none';
        }
        function visualizza(numero)
        {
            for (i = 1; i < 6; i++)
            {
                nomescheda = 'scheda' + i.toString();
                nomelinguetta = 'linguetta' + i.toString();
                document.getElementById(nomescheda).style.display = 'none';
                document.getElementById(nomelinguetta).style.backgroundColor = '#cccccc';
            }
            document.getElementById('scheda' + numero).style.display = 'block';
            document.getElementById('linguetta' + numero).style.backgroundColor = 'yellow';

        }
    </script>
    <?php
//creazione elenco posizioni
    $dati = $db->get_results("
	SELECT paesi.descrizione as paese,paesi.icona,paesi.id_paese,aziende.id_azienda,aziende.sito,impianti.*
	FROM 
		impianti inner join aziende on impianti.id_aziende=aziende.id_azienda
		inner join paesi on aziende.id_paesi=paesi.id_paese
	ORDER BY paesi.descrizione,sito,impianti.descrizione");

    $cont = 0;

    $root = new clsTree;
    $root->value = "Sedi San Benedetto";
    foreach ($dati as $riga) {
        if (!isset($root->subtree[$riga->id_paese])) {
            $root->subtree[$riga->id_paese] = new clsTree;
            $root->subtree[$riga->id_paese]->value = htmlentities($riga->paese);
            $root->subtree[$riga->id_paese]->icon = "$riga->icona";
        }
        if (!isset($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda])) {
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda] = new clsTree;
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->value = htmlentities($riga->sito);
        }
        if (!isset($root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto])) {
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto] = new clsTree;
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->value = htmlentities($riga->descrizione);
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->link = "javascript: assegna(\'$riga->id_aziende\',\'$riga->progressivoimpianto\')";
        }
    }


    @$id = (int) $_GET['id'];
    @$azione = $_POST['azione'];
    reset($_POST);
    do {
        $name_posted = key($_POST);
        $$name_posted = SQLparse(current($_POST));
    } while (each($_POST) != false);

    function NormalizeIP($ip) {
        if ($ip != "") {
            $ip = explode(".", $ip);
            for ($i = 0; $i < 4; $i++)
                $ip[$i] = sprintf("%03d", $ip[$i]);
            $ip = implode(".", $ip);

            return $ip;
        } else {
            return "";
        }
    }

    switch ($azione) {
        case "add":
            include ("addpc.php");
            if ($successo == 1) {
                $id = $nuovoID;
                $azione = "upd";
            }
            break;
        case "upd": include ("updpc.php");
            break;
    }
    if ($fNuovaURL != ""):?>
        <script language="JavaScript" type="text/javascript">
            document.location.href = '<?=$fNuovaURL?>';
        </script>
        <?php
    endif;
    if ($azione != "add"):
        if ($id != "")
            $dati = @$db->get_row("Select *,DATE_FORMAT(Datainst,'%d/%m/%Y')as Datainst from apparecchi where id=$id");
        ?>
        <form action="index.php?modulo=computer&app=PC&id=<?= $dati->ID ?>" 
              method="post" name="frmComputer">
        <?php include ("menutop.php"); ?>
            <div class="submenu">inserimento/modifica computer</div>
            <div id="titolo">
                <div id="linguetta1" onclick="javascript: visualizza('1')">DESCRIZIONE</div>
                <div id="linguetta2" onclick="javascript: visualizza('2')">CARATTERISTICHE</div>
                <div id="linguetta3" onclick="javascript: visualizza('3')">RETE</div>
                <div id="linguetta4" onclick="javascript: visualizza('4')">SOFTWARE</div>
                <div id="linguetta5" onclick="javascript: visualizza('5')">NOTE</div>
                <hr />	
            </div>	
            <div id="scheda1">
        <? include ("descrizione.php"); ?>
            </div>
            <div id="scheda2">
        <? include ("caratteristiche.php"); ?>
            </div>
            <div id="scheda3">
        <? include ("rete.php"); ?>
            </div>
            <div id="scheda4">
        <? include ("software.php"); ?>
            </div>
            <div id="scheda5">
                <div class=titolo>NOTE</div>;
                <textarea name="fNote" rows=3 cols=100><?= $dati->Note ?></textarea>
            </div> ;
            <input type="text" name="azione" value="<?= $val ?>">	 
            <input type="text" name="fNuovaURL">
        </form>
    <?
    endif;
?>
    
    <div id="finestrina" style="top:200px;left:400px;">
        <div class="titolo" onclick="javascript:finestraposizione()">CHIUDI</div>
        <?php $root->dtree(true,$cont);?>
    </div>
<?
    switch ($successo) {
        case 1:
            allarme("NOTA: Dati aggiunti correttamente");
            break;
        case 2:
            allarme("NOTA: Dati aggiornati correttamente");
            break;
        case 3:
            allarme("ERRORE:PROBLEMI NELL'INSERIMENTO DATI !");
            break;
        case 4:
            allarme("ERRORE:IL TIPO COMPUTER E' OBBLIGATORIO !");
            break;
    }

endif;
?>


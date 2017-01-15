<?php

$computer = new Computer($nDb);
if (verificalivello(2)) {
//creazione elenco posizioni
    $dati = Posizione::elenco($nDb);
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
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->link = "javascript:assegna(\'$riga->id_aziende\',\'$riga->progressivoimpianto\')";
        }
    }


    $id = (int) $_GET['id'];
    $azione = setWithDefault($_POST['azione'], "");
    reset($_POST);
    do {
        $name_posted = key($_POST);
        $$name_posted = SQLparse(current($_POST));
    } while (each($_POST) != false);



    switch ($azione) {
        case "add":
            include ("addpc.php");
            if ($successo == 1) {
                $id = $nuovoID;
                $azione = "upd";
            }
            break;
        case "upd":
            include ("updpc.php");
            break;
    }
    if ($azione != "add") {
        if ($id != "") {
            $dati = $computer->getDetails($id);
        }
    }
    //tipo, funzione e posizione
    $tipiApparecchi = $nDb->get_results("select * from tipiapparecchi");
    $riga = $nDb->get_row("
            SELECT aziende.sito, 
            impianti.descrizione AS impianto
            FROM apparecchi INNER JOIN impianti ON 
            apparecchi.id_aziende = impianti.id_aziende AND 
            apparecchi.progressivoimpianto = impianti.progressivoimpianto
            INNER JOIN aziende ON impianti.id_aziende = aziende.id_azienda
            WHERE apparecchi.ID = $id
            ");
    $sito = setWithDefault($riga->sito, false);
    if ($sito) {
        $sitoDescrizione = htmlentities("$riga->sito: $riga->impianto");
    } else {
        $sitoDescrizione = "DA DEFINIRE";
    }
    if ($dati instanceof stdClass) {
        $idApparecchio = setWithDefault($dati->ID, 0);
    } else {
        $idApparecchio = 0;
    }
    if ($idApparecchio > 0) {
        $elenco = $computer->getFunctForPC($idApparecchio);
        $elencoFunzioni = "";
        if (sizeof($elenco) > 0) {
            foreach ($elenco as $riga) {
                $elencoFunzioni.= "<strong> $riga->ordine : $riga->funzione </strong><br>";
            }
        }
    } else {
        $elencoFunzioni = "<strong> DA DEFINIRE</strong>";
    }
    //rete
    if ($dati instanceof stdClass) {
        $sel = $dati->TipoGruppo == "" ? "selected" : "";
        $selW = $dati->TipoGruppo == "W" ? "selected" : "";
        $selD = $dati->TipoGruppo == "D" ? "selected" : "";
    } else {
        $sel = "";
        $selW = "";
        $selD = "";
    }
    //elenco software
    $elencoSwHtml = "";
    if ($idApparecchio > 0) {
        $elencosw = $computer->getSoftwareForPC($idApparecchio);
        if (sizeof($elencosw) > 0) {
            foreach ($elencosw as $riga) {
                if (!$riga->Licenza) {
                    $stile = "style=\"color:red\"";
                } else {
                    $stile = "";
                }
                $elencoSwHtml.="<div $stile>Cod.$riga->ID : <b>$riga->Descrizione</b> ($riga->Versione)</div>\n";
            }
        }
    } else {
        $elencoSwHtml = "<div align=center>&lt;&lt;&lt;NESSUNO&gt;&gt;&gt;</div>\n";
    }
    include $viewDir.'view.computer.php';
}
?>
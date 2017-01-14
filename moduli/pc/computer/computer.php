<?php
if (verificalivello(2)):
//creazione elenco posizioni
    $dati = $nDb->get_results("
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
            $root->subtree[$riga->id_paese]->subtree[$riga->id_azienda]->subtree[$riga->progressivoimpianto]->link = "javascript:assegna(\'$riga->id_aziende\',\'$riga->progressivoimpianto\')";
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
    if ($azione != "add") {
        if ($id != "") {
            $dati = @$nDb->get_row("Select *,DATE_FORMAT(Datainst,'%d/%m/%Y')as Datainst from apparecchi where id=$id");
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
    if($dati instanceof stdClass){
        $idApparecchio=  setWithDefault($dati->ID, 0);
    } else {
        $idApparecchio=0;
    }
    if ($idApparecchio > 0) {
        $elenco = $nDb->get_results("Select pc_funzioni.ordine, pc_tipifunzione.funzione from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id where pc_funzioni.id_apparecchi=$idApparecchio");
        $elencoFunzioni = "";
        if (sizeof($elenco) > 0) {
            foreach ($elenco as $riga)
                $elencoFunzioni.= "<strong> $riga->ordine : $riga->funzione </strong><br>";
        }
    } else {
        $elencoFunzioni = "<strong> DA DEFINIRE</strong>";
    }
    //rete
    if ($dati instanceof stdClass){
        $sel = $dati->TipoGruppo == "" ? "selected" : "";
        $selW = $dati->TipoGruppo == "W" ? "selected" : "";
        $selD = $dati->TipoGruppo == "D" ? "selected" : "";
    } else {
        $sel="";
        $selW="";
        $selD="";
    }
    //elenco software
    $elencoSwHtml = "";
    if ( $idApparecchio> 0) {
        $elencosw = $nDb->get_results("SELECT software.ID, software.Descrizione,elencosw.Versione,elencosw.Licenza FROM software INNER JOIN elencosw ON software.ID = elencosw.software WHERE elencosw.computer=$idApparecchio");
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
    ?>


    <?php if (isset($fNuovaURL)): ?>
        <script language="JavaScript" type="text/javascript">
                    document.location.href = '<?= $fNuovaURL ?>';</script>
    <?php endif; ?>


    <div class="container">
        <form method="post" name="frmComputer" action="index.php?modulo=computer&app=PC&id=<?= $idApparecchio ?>" >

            <div class="row">
                <div class="col-xs-1 contextMenu">
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-calendar" onmousedown ="aggiorna('index.php?modulo=gestionestoria&app=PC&id=<?= $idApparecchio ?>')"
                                data-toggle="tooltip" data-placement="bottom" title="Cronologia" ></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-cog" onmousedown="aggiorna('index.php?modulo=dativari&app=PC&id=<?= $idApparecchio ?>')"
                                data-toggle="tooltip" data-placement="bottom" title="Dati ulteriori"></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-file" onmousedown="aggiorna('index.php?modulo=gestionedoc&app=PC&id=<?= $idApparecchio ?>')"
                                data-toggle="tooltip" data-placement="bottom" title="Documentazione"></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-cd"  onmousedown="aggiorna('index.php?modulo=gestioneSW&app=PC&id=<?= $idApparecchio ?>')"
                                data-toggle="tooltip" data-placement="bottom" title="Software installato"></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-wrench"  onmousedown="aggiorna('index.php?modulo=funzioni&app=PC&id=<?= $idApparecchio ?>')"
                                 data-placement="bottom" title="Funzionalita'"></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-th-list"  onmousedown="aggiorna('index.php?modulo=sfogliapc&app=PC')"
                                data-toggle="tooltip" data-placement="bottom" title="Torna alla lista"></button>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary btn-lg glyphicon glyphicon-save"  onmousedown="document.frmComputer.submit()"
                                data-toggle="tooltip" data-placement="bottom" title="Aggiorna"></button>
                    </div>
                </div>
                <div class="col-xs-11">


                    <div id="tabpanel" role="tabpanel">
                        <ul role="tablist"  class="nav nav-tabs" data-tabs="tabs">
                            <li><a href="#macchina" data-toggle="tab">Macchina</a></li>
                            <li><a href="#caratteristiche" data-toggle="tab">Caratteristiche</a></li>
                            <li><a href="#rete" data-toggle="tab">Impostazioni di rete</a></li>
                            <li><a href="#software" data-toggle="tab">Software installato</a></li>
                            <li><a href="#note" data-toggle="tab">Annotazioni</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="macchina">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label" for="id">codice</label>
                                            <input id="id" class="form-control" name="ID"  
                                                   placeholder="id" 
                                                   type="text" 
                                                   value="<?= $idApparecchio; ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            Funzione: <?= $elencoFunzioni; ?>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label">Data di registrazione:</label> 
                                            <input readonly="" class="form-control" value="<?= ReverseDate(getPropertyValue($dati,"Datainst")); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Posizionamento Attuale:</label>

                                            <div class="input-group">
                                                <input class="form-control" readonly value="<?= $sitoDescrizione; ?>">
                                                <span class="input-group-addon glyphicon glyphicon-folder-open" id="apriPosizioni">
                                            </div>
                                            <?php if (($dati instanceof stdClass) && (getPropertyValue($dati,"progressivoimpianto") == -1)): ?>
                                                <label class="control-label">Descrizione della pos. generica: </label>
                                                <input type = "text" size = 40 class="form-control" name = "posizione" value = "<?= getPropertyValue($dati,"posizione"); ?>"></td>
                                            <?php endif; ?>

                                            <input type="hidden" name="id_aziende" value="<?= getPropertyValue($dati,"id_aziende") ?>">
                                            <input type="hidden" name="progressivoimpianto" value="<?= getPropertyValue($dati,"progressivoimpianto"); ?>">

                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label" for="tipo" >Tipo:</label>
                                            <select  name="Tipo" id="tipo" class="form-control">
                                                <option value="0">Seleziona..</option>
                                                <?php
                                                foreach ($tipiApparecchi as $riga):

                                                    if (($riga instanceof stdClass) &&($dati instanceof stdClass) && (getPropertyValue($dati,"Tipo") == $riga->ID)) {
                                                        $sel = "selected";
                                                    } else {
                                                        $sel = "";
                                                    }
                                                    ?>
                                                    <option value="<?= ($riga instanceof stdClass)?$riga->ID:""; ?>" <?= $sel; ?> > 
                                                        <?= ($riga instanceof stdClass)?$riga->descrizione:""; ?>
                                                    </option>

                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Commessa </label>
                                            <input type = "text" class="form-control" name = "commessa" value = "<?= getPropertyValue($dati,"commessa"); ?>">
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label"> Marca PC </label>
                                            <input type="text" class="form-control" name="marca" value="<?= getPropertyValue($dati,"marca"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Numero di serie</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "SN" value = "<?= getPropertyValue($dati,"SN"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label">Modello PC</label>
                                            <input type = "text" class="form-control"  name = "modello" value = "<?= getPropertyValue($dati,"modello"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Etichetta COA:</label>
                                            <input type="text" class="form-control" size="18" name="COA">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="caratteristiche">

                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Monitor: pollici</label>
                                            <input type="text" class="form-control" name="pollici" value="<?= getPropertyValue($dati,"pollici"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Monitor: tipo</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "marca" value = "<?= getPropertyValue($dati,"marca"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label"> Marca e tipo motherboard</label>
                                            <input type="text" class="form-control" name="madre" value="<?= getPropertyValue($dati,"madre"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">CPU</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "CPU" value = "<?= getPropertyValue($dati,"CPU"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">RAM</label>
                                            <input type="text" class="form-control" name="RAM" value="<?= getPropertyValue($dati,"RAM"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Hard disk</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "HD" value = "<?= getPropertyValue($dati,"HD"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Unita' ottica</label>
                                            <input type="text" class="form-control" name="lettore1" value="<?= getPropertyValue($dati,"lettore1"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Seconda unità alternativa</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "lettore2" value = "<?= getPropertyValue($dati,"lettore2"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Scheda video</label>
                                            <input type="text" class="form-control" name="skvideo" value="<?= getPropertyValue($dati, "skvideo") ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Sezione audio</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "audio" value = "<?= getPropertyValue($dati,"audio"); ?>">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane" id="rete">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 1: tipo</label>
                                            <input type="text" name="skrete1" value="<?= getPropertyValue($dati,"skrete1"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 2: tipo</label>
                                            <input type="text" name="skrete1" value="<?= getPropertyValue($dati,"skrete2"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 1: IP address</label>
                                            <input type="text" size=15 maxlenght="15" name="IP" value="<?= NormalizeIP(getPropertyValue($dati,"IPAddress")) ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 2: IP address</label>
                                            <input type="text" size=15 maxlenght="15" name="IP" value="<?= NormalizeIP(getPropertyValue($dati,"IPAddress2")) ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 1: Netmask</label>
                                            <input type="text" size=15 maxlenght="15" name="NM" value="<?= NormalizeIP(getPropertyValue($dati,"Netmask")) ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 2: Netmask</label>
                                            <input type="text" size=15 maxlenght="15" name="NM" value="<?= NormalizeIP(getPropertyValue($dati,"Netmask2")) ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 1: Gateway</label>
                                            <input type="text" size=15 maxlenght="15" name="GW1" value="<?= NormalizeIP(getPropertyValue($dati,"Gateway")) ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Rete 2: Gateway</label>
                                            <input type="text" size=15 maxlenght="15" name="GW1" value="<?= NormalizeIP(getPropertyValue($dati,"Gateway2")) ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Password amministrativa</label>
                                            <input type="text" size=12 name="passwordAdmin" value="<?= getPropertyValue($dati,"AdminPWD"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Password VNC</label> 
                                            <input type="text" size=8 maxlenght=8 name="passwordVNC" value="<?= getPropertyValue($dati,"VNCPWD"); ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Nome utente default</label>
                                            <input type="text" size=15 maxlenght="15" name="nomeutente" value="<?= getPropertyValue($dati,"UserName"); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Password utente default</label> 
                                            <input type="text" size=15 maxlenght="15" name="pwutente" value="<?= getPropertyValue($dati,"UserPWD"); ?>">
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="form-group">
                                            <label class="control-label">Gruppo di lavoro o dominio</label> 
                                            <select name="GroupType">

                                                <option value="" <?= $sel; ?>>ALTRO/N.A.</option>
                                                <option value="W" <?= $selW; ?>>WORKGROUP</option>
                                                <option value="D" <?= $selD; ?>>DOMINIO</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <label class="control-label">Nome gruppo o dominio</label> 
                                        <input type="text" size=20 maxlenght="20" name="GroupName" value="<?= getPropertyValue($dati,"NomeGruppo"); ?>">

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <label class="control-label">Identificativo PC</label> 
                                        <input type="text" size=20 maxlenght=32 value="<?= getPropertyValue($dati,"IDrete"); ?>"name="NetID">
                                    </div>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane" id="software">
                                <?= $elencoSwHtml ?>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="note">
                                <textarea name="fNote" rows=3 cols=100><?= getPropertyValue($dati,"Note") ?></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="text" name="azione" value="<?= setWithDefault($val, "") ?>">	 
            <input type="text" name="fNuovaURL">

        </form>

        <?php
    endif;
    ?>
    <div id="finestrina">
        <?php $root->dtree(true, $cont); ?>
    </div>
    <?php
    if (isset($successo)){
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
    }
    ?>

    <script language="JavaScript" type="text/javascript">

        function aggiorna(ind)
        {
            document.frmComputer.fNuovaURL.value = ind;
            document.frmComputer.submit();
        }

        function assegna(sede, impianto)
        {
            document.frmComputer.id_aziende.value = sede;
            document.frmComputer.progressivoimpianto.value = impianto;
            document.frmComputer.submit();
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
        $("#finestrina").dialog(
                {autoOpen: false,
                    resizable: true,
                    title: 'posizioni',
                    height: 200
                });
        $("#apriPosizioni").click(function () {
            $("#finestrina").dialog("open").dialog("moveToTop");
        });


    </script>
<?
if (verificalivello(2)):
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
            $dati = @$db->get_row("Select *,DATE_FORMAT(Datainst,'%d/%m/%Y')as Datainst from apparecchi where id=$id");
        }
    }
    //tipo, funzione e posizione
    $tipiApparecchi = $db->get_results("select * from tipiapparecchi");
    $riga = $db->get_row("
            SELECT aziende.sito, 
            impianti.descrizione AS impianto
            FROM apparecchi INNER JOIN impianti ON 
            apparecchi.id_aziende = impianti.id_aziende AND 
            apparecchi.progressivoimpianto = impianti.progressivoimpianto
            INNER JOIN aziende ON impianti.id_aziende = aziende.id_azienda
            WHERE apparecchi.ID = $id
            ");
    $sito = $riga->sito;
    if ($sito) {
        $sitoDescrizione = htmlentities("$riga->sito: $riga->impianto");
    } else {
        $sitoDescrizione = "DA DEFINIRE";
    }
    if ($dati->ID > 0) {
        $elenco = $db->get_results("Select pc_funzioni.ordine, pc_tipifunzione.funzione from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id where pc_funzioni.id_apparecchi=$dati->ID");
        $elencoFunzioni = "";
        if (sizeof($elenco) > 0) {
            foreach ($elenco as $riga)
                $elencoFunzioni.= "<strong> $riga->ordine : $riga->funzione </strong><br>";
        }
    } else {
        $elencoFunzioni = "<strong> DA DEFINIRE</strong>";
    }
    //rete
    $sel = $dati->TipoGruppo == "" ? "selected" : "";
    $selW = $dati->TipoGruppo == "W" ? "selected" : "";
    $selD = $dati->TipoGruppo == "D" ? "selected" : "";

    //elenco software
    $elencoSwHtml = "";
    if ($dati->ID > 0) {
        $elencosw = $db->get_results("SELECT software.ID, software.Descrizione,elencosw.Versione,elencosw.Licenza FROM software INNER JOIN elencosw ON software.ID = elencosw.software WHERE elencosw.computer=$dati->ID");
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


    <?php if ($fNuovaURL != ""): ?>
        <script language="JavaScript" type="text/javascript">
                    document.location.href = '<?= $fNuovaURL ?>';</script>
    <?php endif; ?>
    <!--
        <form action="index.php?modulo=computer&app=PC&id=<?= $dati->ID ?>" 
              method="post" name="frmComputer">
    <?php include ("menutop.php"); ?>
            <div class="submenu">inserimento/modifica computer</div>
            <div id="titolo">
                <div id="linguetta1" onclick=" visualizza('1')">DESCRIZIONE</div>
                <div id="linguetta2" onclick=" visualizza('2')">CARATTERISTICHE</div>
                <div id="linguetta3" onclick=" visualizza('3')">RETE</div>
                <div id="linguetta4" onclick=" visualizza('4')">SOFTWARE</div>
                <div id="linguetta5" onclick=" visualizza('5')">NOTE</div>
                <hr />	
            </div>	
            <div id="scheda1">
                <div class=titolo>IDENTIFICAZIONE MACCHINA</div>
                <table>
                    <tr>
                        <td>codice</td>
                        <td><input type="text" size=3 maxlength=4 name="ID" value="<?= $dati->ID; ?>"></td>
                    </tr>
                    <tr>
                        <td>
                            Data di registrazione:
                        </td>
                        <td>
                            <b><?= ReverseDate($dati->Datainst); ?></b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tipo:
                        </td>
                        <td>
                            <select name="Tipo">
                                <option value="0">Seleziona..</option>
    <?php
    foreach ($tipiApparecchi as $riga):

        if ($dati->Tipo == $riga->ID) {
            $sel = "selected";
        } else {
            $sel = "";
        }
        ?>
                                                                                                                                                                    <option value="<?= $riga->ID; ?>" <?= $sel; ?> > 
        <?= $riga->descrizione; ?>
                                                                                                                                                                    </option>

    <?php endforeach; ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Funzione:
                        </td>
                        <td>
    <?= $elencoFunzioni; ?>
                        </td>
                    </tr>
                    <tr>
                        <td>Posizionamento Attuale:</td>
                        <td>
                            <input type="hidden" name="id_aziende" value="<?= $dati->id_aziende ?>">
                            <input type="hidden" name="progressivoimpianto" value="<?= $dati->progressivoimpianto; ?>">
                            <strong><?= $sitoDescrizione; ?></strong> &nbsp;
                            <img src = "icons/prova.gif" id="apriPosizioni">

                        </td>
                    </tr>
    <?php if ($dati->progressivoimpianto == -1): ?>
                                                                                                                                                        <tr>
                                                                                                                                                            <td>Descrizione della pos. generica:</td>
                                                                                                                                                            <td><input type = "text" size = 40 name = "posizione" value = "<?= $dati->posizione; ?>"></td>
                                                                                                                                                        </tr>
    <?php endif; ?>

                    <tr>
                        <td>Commessa</td>
                        <td>
                            <input type = "text" name = "commessa" value = "<?= $dati->commessa; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>Marca PC</td>
                        <td><input type="text" name="marca" value="<?= $dati->marca; ?>"></td>
                    </tr>
                    <tr>
                        <td>Modello PC</td>
                        <td><input type = "text" name = "modello" value = "<?= $dati->modello; ?>"></td>
                    </tr>
                    <tr>
                        <td>Numero di serie</td>
                        <td>
                            <input type = "text" size = "30" name = "SN" value = "<?= $dati->SN; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td> Etichetta COA: </td>
                        <td>
                            <input type="text" size="18" name="COA">
                        </td>
                    </tr>
                </table>

            </div>
            <div id="scheda2">
                <div class=titolo>CARATTERISTICHE</div>
                <table>
                    <tr>
                        <td>Pollici</td>
                        <td>
                            <input type="text" size="4" name="pollici" value="<?= $dati->pollici; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>Tipo:</td>
                        <td><input type=text size=7 name=tipomon value=<?= $dati->tipomon; ?>></td>
                    </tr>
                    <tr>
                        <td>Motherboard:</td> 
                        <td><input type=text name=madre value=<?= $dati->madre; ?>></td>
                    </tr>
                    <tr>
                        <td>CPU:</td> 
                        <td><input type=text name=CPU value=<?= $dati->CPU; ?>></td>
                    </tr>
                    <tr>
                        <td>RAM:</td> 
                        <td><input type=text name=RAM value=<?= $dati->RAM; ?>>Mb</td>
                    </tr>
                    <tr>
                        <td>HD:</td> 
                        <td><input type=text name=HD value=<?= $dati->HD; ?>></td>
                    </tr>
                    <tr>
                        <td>
                            Lettore ottico 1: tipo
                        </td>
                        <td>
                            <input type=text name=lettore1 value=<?= $dati->lettore1; ?>>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Lettore ottico 2: tipo
                        </td>
                        <td>
                            <input type=text name=lettore2 value=<?= $dati->lettore2; ?>>
                        </td>
                    </tr>
                    <tr>
                        <td>Scheda video</td>
                        <td><input type=text name=skvideo value=<?= $dati->skvideo; ?>></td>
                    </tr>
                    <tr>
                        <td>Sezione audio</td>
                        <td><input type=text name=audio value=<?= $dati->audio; ?>></td>
                    </tr>
                </table>
            </div>
            <div id="scheda3">
                <div class=titolo>IMPOSTAZIONI DI RETE</div>		 
                <table>
                    <tr>
                        <td>
                            Rete 1: Tipo :  
                        </td>
                        <td> 
                            <input type="text" name="skrete1" value="<?= $dati->skrete1; ?>">
                        </td>
                        <td>
                            Rete 2: Tipo :  
                        </td>
                        <td> 
                            <input type="text" name="skrete2" value="<?= $dati->skrete2; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rete 1: IP Address :
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="IP" value="<?= NormalizeIP($dati->IPAddress) ?>">
                        </td>
                        <td>
                            Rete 2: IP Address :
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="IP2" value="<?= NormalizeIP($dati->IPAddress2) ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rete 1: IP NetMask : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="NM" value="<?= NormalizeIP($dati->Netmask) ?>">
                        </td>
                        <td>
                            Rete 2: IP NetMask : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="NM2" value="<?= NormalizeIP($dati->Netmask2) ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rete 1: Gateway : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="GW1" value="<?= NormalizeIP($dati->Gateway) ?>">
                        </td>
                        <td>
                            Rete 2: Gateway : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="GW2" value="<?= NormalizeIP($dati->Gateway2) ?>">
                        </td>
                    </tr>
                    <tr>
                        <td colspan='4'>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gruppo di lavoro o Dominio : 
                        </td>
                        <td>
                            <select name="GroupType">

                                <option value="" <?= $sel; ?>>ALTRO/N.A.</option>
                                <option value="W" <?= $selW; ?>>WORKGROUP</option>
                                <option value="D" <?= $selD; ?>>DOMINIO</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Nome Gruppo/dominio : 
                        </td>
                        <td>
                            <input type="text" size=20 maxlenght="20" name="GroupName" value="<?= $dati->NomeGruppo; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td> ID di rete</td>
                        <td> 
                            <input type="text" size=20 maxlenght=32 value="<?= $dati->IDrete; ?>"name="NetID">
                        </td>
                    </tr>
                    <tr>
                        <td colspan='4'>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>Password Amministrativa</td>
                        <td> 
                            <input type="text" size=12 name="passwordAdmin" value="<?= $dati->AdminPWD; ?>">
                        </td>
                        <td>Password VNC</td>
                        <td> 
                            <input type="text" size=8 maxlenght=8 name="passwordVNC" value="<?= $dati->VNCPWD; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Default user name : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="nomeutente" value="<?= $dati->UserName; ?>">
                        </td>
                        <td>
                            Default password : 
                        </td>
                        <td>
                            <input type="text" size=15 maxlenght="15" name="pwutente" value="<?= $dati->UserPWD; ?>">
                        </td>
                    </tr>
                </table>



            </div>
            <div id="scheda4">
                <div class=titolo>SOFTWARE INSTALLATO</div>
    <?= $elencoSwHtml ?>

            </div>
            <div id="scheda5">
                <div class=titolo>NOTE</div>
                <textarea name="fNote" rows=3 cols=100><?= $dati->Note ?></textarea>
            </div> ;





            <input type="text" name="azione" value="<?= $val ?>">	 
            <input type="text" name="fNuovaURL">



        </form>

    -->



    <header> 
        <?php include ("menutop.php"); ?>
    </header>
    <div class="container">
        <form>
            <div class="row">
                <div class="col-xs-1">
                    <div class="row"><button class="btn btn-primary btn-lg glyphicon glyphicon-home"></button></div>
                    <div class="row"><button class="btn btn-primary btn-lg glyphicon glyphicon-cog"></button></div>
                    <div class="row"><button class="btn btn-primary btn-lg glyphicon glyphicon-cd"></button></div>
                </div>
                <div class="col-xs-11">


                    <div id="tabpanel" role="tabpanel">
                        <ul role="tablist"  class="nav nav-tabs" data-tabs="tabs">
                            <li><a href="#macchina" data-toggle="tab">macchina</a></li>
                            <li><a href="#caratteristiche" data-toggle="tab">caratteristiche</a></li>
                            <li><a href="#software" data-toggle="tab">software</a></li>
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
                                                   value="<?= $dati->ID; ?>">
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
                                            <input readonly="" class="form-control" value="<?= ReverseDate($dati->Datainst); ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Posizionamento Attuale:</label>

                                            <div class="input-group">
                                                <input class="form-control" readonly value="<?= $sitoDescrizione; ?>">
                                                <span class="input-group-addon glyphicon glyphicon-folder-open" id="apriPosizioni">
                                            </div>
                                            <?php if ($dati->progressivoimpianto == -1): ?>
                                                <label class="control-label">Descrizione della pos. generica: </label>
                                                <input type = "text" size = 40 class="form-control" name = "posizione" value = "<?= $dati->posizione; ?>"></td>
                                            <?php endif; ?>

                                            <input type="hidden" name="id_aziende" value="<?= $dati->id_aziende ?>">
                                            <input type="hidden" name="progressivoimpianto" value="<?= $dati->progressivoimpianto; ?>">

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

                                                    if ($dati->Tipo == $riga->ID) {
                                                        $sel = "selected";
                                                    } else {
                                                        $sel = "";
                                                    }
                                                    ?>
                                                    <option value="<?= $riga->ID; ?>" <?= $sel; ?> > 
                                                        <?= $riga->descrizione; ?>
                                                    </option>

                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Commessa </label>
                                            <input type = "text" class="form-control" name = "commessa" value = "<?= $dati->commessa; ?>">
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label"> Marca PC </label>
                                            <input type="text" class="form-control" name="marca" value="<?= $dati->marca; ?>">
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label class="control-label">Numero di serie</label> 
                                            <input class="form-control" type = "text"  size = "30" name = "SN" value = "<?= $dati->SN; ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label class="control-label">Modello PC</label>
                                            <input type = "text" class="form-control"  name = "modello" value = "<?= $dati->modello; ?>">
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
                            <div role="tabpanel" class="tab-pane" id="caratteristiche">...</div>
                            <div role="tabpanel" class="tab-pane" id="software">...</div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <?
    endif;
    ?>
    <div id="finestrina">
        <?php $root->dtree(true, $cont); ?>
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
        /*
         $(":input[name=IP]").mask("999.999.999.999").val('<?= NormalizeIP($dati->IPAddress); ?>');
         $(":input[name=IP2]").mask("999.999.999.999").val('<?= NormalizeIP($dati->IPAddress2); ?>');
         $(":input[name=NM]").mask("999.999.999.999").val('<?= NormalizeIP($dati->Netmask); ?>');
         $(":input[name=NM2]").mask("999.999.999.999").val('<?= NormalizeIP($dati->Netmask2); ?>');
         $(":input[name=GW1]").mask("999.999.999.999").val('<?= NormalizeIP($dati->Gateway); ?>');
         $(":input[name=GW2]").mask("999.999.999.999").val('<?= NormalizeIP($dati->Gateway2); ?>');
         $(":input[name=COA]").mask("99999-999-999-999").val('<?= $dati->COA; ?>');
         */


    </script>
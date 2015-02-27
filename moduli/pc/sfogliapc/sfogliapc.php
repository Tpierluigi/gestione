<?
session_start();
verificalivello(3);

if (isset($_GET['ord'])) {
    $activeorder = $_GET['ord'];
    $_SESSION['activeorder'] = $activeorder;
} else
    $activeorder = $_SESSION['activeorder'];

if ($activeorder == "")
    $activeorder = "a.ID";

$testoqry = "";
$testoqry.="SELECT a.ID, ta.descrizione AS tipo,a.posizione,a.SN,a.idRete,";
$testoqry.="a.Descrizione, a.IPAddress,a.COA, a.id_aziende,a.progressivoimpianto ";
$testoqry.="FROM apparecchi a INNER JOIN tipiapparecchi ta ON a.Tipo = ta.ID order by $activeorder";
$dati = $db->get_results($testoqry);
?>
<div class="container">
    <div class="riga">
        <div class="col-sm-10">
            <div id="toolbar" class="btn-group">
                <button type="button" class="btn btn-default" id="nuovo">
                    <i class="glyphicon glyphicon-plus"></i>
                </button>
                <button type="button" class="btn btn-default" id="modifica">
                    <i class="glyphicon glyphicon-pencil"></i>
                </button>
                <button type="button" class="btn btn-default" id="cancella">
                    <i class="glyphicon glyphicon-trash"></i>
                </button>
            </div>
            <table data-toggle="table"        
                   data-search="true" id="listapc" 
                   data-height="500"
                   data-toolbar="#toolbar"
                   data-click-to-select="true"
                   data-select-item-name="selezionato"
                   >
                <thead>
                    <tr>
                        <th data-radio="true"></th>
                        <th data-sortable="true">ID</th>
                        <th data-sortable="true">SN</th>
                        <th data-sortable="true">TIPO</th>
                        <th data-sortable="true">FUNZIONE</th>
                        <th data-sortable="true">IP ADDRESS </TH>
                        <th data-sortable="true">ID RETE</th>
                        <th data-sortable="true">POSIZIONE</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dati as $riga): ?>
                        <?
                        $funzioni = "";
                        $elenco = $db->get_results("Select pc_funzioni.ordine, pc_tipifunzione.funzione   "
                                . "from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id   "
                                . "where pc_funzioni.id_apparecchi=$riga->ID");

                        if (sizeof($elenco) > 0) {
                            foreach ($elenco as $funzione)
                                $funzioni.= "$funzione->ordine : $funzione->funzione <br>";
                        } else
                            $funzioni = "DA DEFINIRE";

                        $posizione = $db->get_row("
                        SELECT aziende.sito,impianti.descrizione AS impianto
                        FROM apparecchi INNER JOIN impianti ON apparecchi.id_aziende = impianti.id_aziende AND 
                             apparecchi.progressivoimpianto = impianti.progressivoimpianto INNER JOIN aziende 
                             ON impianti.id_aziende = aziende.id_azienda
                        WHERE apparecchi.ID = $riga->ID
                        ");
                        if (!isset($riga->progressivoimpianto) && !isset($riga->id_aziende))
                            $posdesc = "DA DEFINIRE";
                        else {
                            if ($riga->progressivoimpianto == -1)
                                $posdesc = "GENERICA<br>(" . htmlentities("$posizione->sito: $riga->posizione") . ")";
                            else
                                $posdesc = htmlentities("$posizione->sito: $posizione->impianto");
                        }
                        ?>
                        <tr>
                            <td></td>
                            <td><?= sprintf("%04d", $riga->ID); ?> </td>
                            <td><?= $riga->SN; ?></td>
                            <td><?= $riga->tipo; ?></td>
                            <td><?= $funzioni ?></td>
                            <td><?= $riga->IPAddress; ?></td>
                            <td><?= $riga->idRete; ?></td>
                            <td><?= $posdesc; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>            
        </div>
    </div>
</div>

<div id="messaggi" title="seleziona un PC"><p>SELEZIONA UN PC DA EDITARE/MODIFICARE</p></div>
<script src="lib/js/bootstrap-table.min.js"></script>
<!-- put your locale files after bootstrap-table.js -->
<script src="lib/js/bootstrap-table-it-IT.min.js"></script>
<script type="text/javascript">
    $(function () {
        var selezionato = 0;
        //definisco il gestore evento per la tabella
        $('#listapc').on('check.bs.table', function (e, row) {
            //l'id si trova all'elemento 1 dell'array 'row'
            selezionato = row[1];
        });
         //inizializzo il dialog box per i messaggi
        $("#messaggi").dialog(
                {autoOpen: false,
                    modal: true,
                    show: 'drop',
                    hide: 'drop',
                    resizable: false,
                    buttons: {"Ok": function () {
                            $(this).dialog("close");
                        }
                    }
                });
        //gestori per i bottoni
        $("#nuovo").click(function(){
            window.location.href = "index.php?modulo=computer&app=PC&id=";
        });
        $("#modifica").click(function(){
            if(selezionato>0){
                window.location.href = "index.php?modulo=computer&app=PC&id=" + selezionato;
            }else {
                $("#messaggi").dialog('open');
            }
        });
        
    });
</script>

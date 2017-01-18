

<div class="container">
    <div class="col-sm-1 contextMenu">
        <div class="row">
            <a class="btn btn-primary btn-lg glyphicon glyphicon-backward" 
               data-toggle="tooltip"  href="?modulo=computer&app=PC&id=<?= $id ?>" 
               data-placement="bottom" title="Torna alla configurazione" ></a>
        </div>
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
    <div class="col-sm-11">
        <div class="row bsSubmenu text-center"><div class="col-sm-12"> DATI ULTERIORI PER LA MACCHINA #<?= $id ?></div></div>
        <?php if (!isset($dati)): ?> 
            <div class="col-sm-12"> <h2>NON CI SONO INFORMAZIONI SUPPLEMENTARI</h2></div>
        <?php else: ?> 
            <?php for ($i = 0; $i < sizeof($dati);): ?>
                <?php $riga = $dati[$i++]; ?>
                <div class="row">
                    <div class="col-sm-3 text-right"><?= $riga->descrizione ?></div>
                    <div class="col-sm-3">
                        <a href="#" class="elenco" 
                           data-type="text" 
                           data-pk="<?= $riga->id ?>"
                           data-url="index.php?c=DatiVari&f=update&idApparecchio=<?= $id ?>&idVoce=<?= $riga->id ?>">
                            <?= htmlentities($riga->valore) ?></a>
                    </div>
                    <?php $riga = $dati[$i++]; ?>
                    <div class="col-sm-3 text-right"><?= $riga->descrizione ?></div>
                    <div class="col-sm-3">
                        <a href="#" class="elenco"
                           data-type="text" 
                           data-pk="<?= $riga->id ?>"
                           data-url="index.php?c=DatiVari&f=update&idApparecchio=<?= $id ?>&idVoce=<?= $riga->id ?>">
                            <?= htmlentities($riga->valore) ?></a>
                    </div>
                </div>
            <?php endfor; ?>
        <?php endif; ?>
    </div>
</div>
<script>
    $.fn.editable.defaults.mode = 'popup';
    $(document).ready(function () {
        $('.elenco').editable();
    });
</script>
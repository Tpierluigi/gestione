<div class="container">

    <?php if (!isset($dati)): ?> 
        <div class="row">
            <div class="col-sm-12"> <h2>NON CI SONO INFORMAZIONI SUPPLEMENTARI</h2></div>
        </div>
    <?php else: ?> 
        <?php for ($i = 0; $i < sizeof($dati);): ?>
            <?php $riga = $dati[$i++]; ?>
            <div class="row">
                <div class="col-sm-3 text-right"><?= $riga->descrizione ?></div>
                <div class="col-sm-3">
                    <a href="#" class="elenco" 
                        data-type="text" 
                        data-pk="<?= $riga->id ?>"
                        data-url="index.php?c=DatiVari&f=update&idApparecchio=<?=$id?>&idVoce=<?=$riga->id?>">
                        <?= htmlentities($riga->valore) ?></a>
                </div>
                    <?php $riga = $dati[$i++]; ?>
                <div class="col-sm-3 text-right"><?= $riga->descrizione ?></div>
                <div class="col-sm-3">
                    <a href="#" class="elenco"
                       data-type="text" 
                       data-pk="<?= $riga->id ?>"
                       data-url="index.php?c=DatiVari&f=update&idApparecchio=<?=$id?>&idVoce=<?=$riga->id?>">
                            <?= htmlentities($riga->valore) ?></a>
                </div>
            </div>
        <?php endfor; ?>
    <?php endif; ?>
</div>

<script>
    $.fn.editable.defaults.mode = 'popup';
    $(document).ready(function () {
        $('.elenco').editable();
    });
</script>
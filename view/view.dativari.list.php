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
                <div class="col-sm-3"><input class="form-control test" 
                                             type="text" name="voce[<?= $riga->id ?>]" 
                                             value="<?= htmlentities($riga->valore) ?>"
                                             data-type="text" data-pk="1"
                                             data-url="/post"></div>
                    <?php $riga = $dati[$i++]; ?>
                <div class="col-sm-3 text-right"><?= $riga->descrizione ?></div>
                <div class="col-sm-3"><input class="form-control" 
                                             type="text" name="voce[<?= $riga->id ?>]" 
                                             value="<?= htmlentities($riga->valore) ?>"></div>
            </div>
        <?php endfor; ?>
    <?php endif; ?>
</div>

<script>
    $.fn.editable.defaults.mode = 'popup';
    $(document).ready(function () {
        $('.test').editable();
    });
</script>
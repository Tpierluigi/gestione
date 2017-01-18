ELENCO DOCUMENTAZIONE PER LA MACCHINA #<?=$id?>
<table class="software">
    <tr><th></th><th>CLICCARE SULL'IMMAGINE PER INGRANDIRE</th></tr>
    <?php if (!isset($dati)): ?> 
        <tr><td></td><td><h2>NON CI SONO DOCUMENTI</h2></td></tr>
    <?php else: ?>
        <?php foreach ($dati as $riga): ?>
            <?php if ($riga->Tipo == ".jpg"): ?> 
                <tr>
                    <td><input type="radio" name="codice" value="$riga->ID"></td>
                    <td align='center'>
                        <div class='titolo1'>$riga->Commento</div><nobr>
                    <a href='$riga->Documento' target='upload'><img src='$nomemin' align='top' alt='$riga->Commento'></a>
                    </td>
                    </tr>
                <?php else: ?>
                    <tr>
                        <td><input type="radio" name="codice" value="$riga->ID"></td>
                        <td align='center'>
                            <div class='titolo1'>$riga->Commento</div><nobr>
                        <a href='$URLuploaddir$riga->Documento' target='upload'><img src='".$imgpath.imageType(substr($riga->Documento,-3))."' align='top' alt='$riga->Commento' border=0></a><br>(MIME Type:$riga->Tipo)
                        </td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; ?>
            <?php endif; ?>
            </table>

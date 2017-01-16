<?php

if (verificalivello(3)) {
    //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
    //recupero e controllo le eventuali variabili in  ingresso dalla form 
    @$azione = setWithDefault($_POST['azione'], "");
    $id = $_GET['id'];
    $menubar = new barramenu;
    $menubar->add("TORNA ALLA CONFIGURAZIONE", "index.php?modulo=computer&app=PC&id=$id", "");
    switch ($azione) {
        case "" :
            $menubar->add("AGGIORNA LISTA", "", "eseguiAzione('refresh','frmDatiVari')");
            break;
        case "refresh" :
            $menubar->add("RITORNA ALLA LISTA AGGIORNATA", "", "eseguiAzione('','frmDatiVari')");
            foreach ($_POST['voce'] as $voce => $valore) {
                $presente = $db->get_row("select * from pc_varie where voce=$voce and pc=$id");
                if ($presente)
                    $db->query("update pc_varie set valore='$valore' where voce=$voce and pc=$id");
                else
                    $db->query("insert into pc_varie(pc,voce,valore) values ($id,$voce,'$valore')");
            }
            break;
    }



    $menubar->show();
    ?>

<div class="row bsSubmenu text-center"><div class="col-sm-12"> DATI ULTERIORI PER LA MACCHINA #<?=$id?></div></div>
    <form action="index.php?modulo=dativari&app=PC&id=<?=$id?>" method="post" id="frmDatiVari">
    <input type="hidden" name="azione">


<?php
    //parte per la visualizzazione. 
    if ($azione == "") {
        $_DIMX = 200;
        $computer = new Computer($nDb);
        $dati = $computer->getOtherData($id);
        include $viewDir . 'view.dativari.list.php';
    }
    if ($azione == "refresh")
        printf("  <h2>DATI AGGIORNATI</H2>\n");
    echo "</form>\n";
}
?>


<?php

if (verificalivello(3)) {
    //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
    //recupero e controllo le eventuali variabili in  ingresso dalla form 
    @$azione = setWithDefault($_POST['azione'], "");
    $id = $_GET['id'];
    //parte per la visualizzazione. 

        $computer = new Computer($nDb);
        $dati = $computer->getOtherData($id);
        include $viewDir . 'view.dativari.list.php';
}
?>

    </div>
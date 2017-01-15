<?php
verificalivello(3);

if (isset($_GET['ord'])) {
    $activeorder = $_GET['ord'];
    $_SESSION['activeorder'] = $activeorder;
} else
    $activeorder = setWithDefault ($_SESSION['activeorder'], "a.ID");
$dati = Computer::getList($nDb);
include $viewDir.'view.sfogliapc.php';
?>

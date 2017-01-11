<?php
    $head=new smartypc;
    $head->assign("SWver",$SWver);
    if (isset($_datiutente)) $head->assign("_datiutente",$_datiutente);
    if (isset($_codusr)) $head->assign("_codusr",$_codusr);    
    $head->assign("SESSION",$_SESSION);
    $head->display("common/intpagina.tpl");
?>

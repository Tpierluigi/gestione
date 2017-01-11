<?php
$id=(int)$_POST['idscript']; 
$link= new DBLink ($db);
$link->SetTbl("AdminScript");
$link->SetOpt("del");
$link->SetID($id);
$link->DoSQL();
print( "	 <h3 align='center'>Script #$id cancellato</h3>\n" );
print( "	 <h3 align='center'><a href=\"index.php?modulo=doscript\">aggiorna l'elenco...</a></h3>\n" );
?>
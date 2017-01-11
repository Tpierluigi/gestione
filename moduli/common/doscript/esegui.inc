<?php
	 $id=(int)$_POST['idscript'];
	 $Dati=$db->get_row("select * from adminscript where id=$id");
	 echo "<b>DESCRIZIONE DELLO SCRIPT</b><br>";
	 echo $Dati->Descrizione.'<br>';
	 echo "<b>TESTO DELLO SCRIPT</b><br>";
	 printf( "<pre>\n" );
	 echo htmlspecialchars($Dati->Testo);
	 printf( "</pre>\n" );
	 printf( "<BR>" );
	 echo "<b>RISULTATO</b><br>";
	 echo eval($Dati->Testo);
?>
<?php
	 $id=(int)$_POST['idquery'];
	 echo "<h3 align=\"center\">ATTENZIONE:</b> Stai per cancellare la query cod. $id </h3>";
	 printf( "<input type=hidden name=idquery value=$id>" );
?>	 

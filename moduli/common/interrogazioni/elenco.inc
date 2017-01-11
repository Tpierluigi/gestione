<?php
$query=$db->get_results("SELECT * FROM queryutente where IDUtente=$codusr OR Pubblica=1");
if  (sizeof($query) >0)
		{
    print( "<table border=0> \n" );
    print( "	<tr>\n" );
    print( "		<th align='left'>QUERY DEFINITE DALL'UTENTE\n" );
    print( "	</tr>\n" );
// onclick=showQuery(\"$riga->Testo\")
		foreach ($query as $riga)
			{
    	printf( "<tr onmouseover=this.style.backgroundColor='yellow' onmouseout=this.style.backgroundColor='transparent'>\n");
			printf( "	 <td><input type=radio name=idquery value=$riga->ID>$riga->Descrizione</td>\n" );
			printf( "</tr>		\n" );
			}
    print( "</table>");
		}
else
		print( "<h2>NON CI SONO QUERY DEFINITE DALL'UTENTE</h2>" );

?>
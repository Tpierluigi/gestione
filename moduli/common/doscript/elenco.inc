<?
$script=$db->get_results("SELECT * FROM AdminScript");
if  (sizeof($script) >0)
		{
    print( "<table border=0> \n" );
		foreach ($script as $riga)
    	{
			print( "	<tr onmouseover=this.style.backgroundColor='yellow' onmouseout=this.style.backgroundColor='transparent'>\n" );
    	print( "		<td>\n" );
    	print(  "			<input type=radio name=idscript value=$riga->ID>$riga->Descrizione\n");
    	print( "		</td>\n" );
			print( "	</tr>\n");
			}
    print( "</table>");
		}
else
		print( "<h2>NON CI SONO SCRIPT AMMINISTRATIVI</h2>" );
?>
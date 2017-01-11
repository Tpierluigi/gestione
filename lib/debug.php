<?php
	$_ERRORI[2627]="Codice univoco duplicato: violazione della chiave primaria";
	
	
	function debug()
	{ 
		global $_ERRORI;
	 	$errore=mssql_fetch_object(mssql_query("select @@ERROR as codice"));
		$debug_array = debug_backtrace();
		$counter = count($debug_array);
		for($tmp_counter = 1; $tmp_counter != $counter; ++$tmp_counter)
		{
		  ?>
		  <table width="558" height="116" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
			<tr>
					<td height="38" bgcolor="#D6D7FC">
							<font color="#000000">errore SQL: <b><?phpecho "$errore->codice : ".$_ERRORI[$errore->codice];?></b><font color="#FF3300">
			</tr>
			<tr>
			  <td height="38" bgcolor="#D6D7FC"><font color="#000000">function <font color="#FF3300"><?php
			  echo($debug_array[$tmp_counter]["function"]);?>(</font> <font color="#2020F0"><?php
			  //count how many args a there
			  $args_counter = count($debug_array[$tmp_counter]["args"]);
			  //print them
			  for($tmp_args_counter = 0; $tmp_args_counter != $args_counter; ++$tmp_args_counter)
			  {
				 echo($debug_array[$tmp_counter]["args"][$tmp_args_counter]);

				 if(($tmp_args_counter + 1) != $args_counter)
				 {
				   echo(", ");
				 }
				 else
				 {
				   echo(" ");
				 }
			  }
			  ?></font><font color="#FF3300">)</font></font></td>
			</tr>
			<tr>
			  <td bgcolor="#5F72FA"><font color="#FFFFFF">{</font><br>
				<font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file: <?php
				echo($debug_array[$tmp_counter]["file"]);?></font><br>
				<font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;line: <?php
				echo($debug_array[$tmp_counter]["line"]);?></font><br>
				<font color="#FFFFFF">}</font></td>
			</tr>
		  </table>
		  <?php
		 if(($tmp_counter + 1) != $counter)
		 {
		   echo("<br>chIamata da:<br>");
		 }
	   }
		exit();
	}

?>
<?php
function debug2()
	{
	$backtrc=debug_backtrace();
	foreach ($backtrc as $passo)
		$msg.= sprintf("Chiamato da <b>%s</b> in linea <b>%s</b> file <b>%s</b><br>",$passo['function'],$passo['line'],$passo['file']);
	die ($msg);
	}
?>
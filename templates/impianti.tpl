<div align="center"> 
<table>
  <tr>
  	<th colspan=2><h3>AGGIUNGI NUOVO IMPIANTO</h3></th>
  </tr>	
  <tr>
  	<td>SITO PRODUTTIVO:</td>
  	<td>
  		<select name="sito">
  			{html_options options=$siti}
  		</select>
  	</td>
  </tr>
  <tr>	 
	 	<td>DESCRIZIONE:</td>
  	<td><input type="text" name="impianto"></td>
  </tr>
  <tr>	 
	 	<td>PROGRESSIVO IMPIANTO:</td>
  	<td><input type="text" size=2 maxlenght=2  name="prgimpianto"></td>
  </tr>
  <tr>	 
	 	<td colspan="2">(attenzione:  assegnando il valore <b>-1</b> la posizione verrà trattata come generica)</td>
  </tr>
</table>
</div> 

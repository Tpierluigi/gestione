<div align="center"> 
<table>
  <tr>
  	<th colspan=2><h3>AGGIUNGI NUOVA SEDE</h3></th>
  </tr>	
  <tr>
  	<td>NAZIONE:</td>
  	<td>
  		<select name="fkpaese">
  			{html_options options=$paesi}
  		</select>
  	</td>
  </tr>
  <tr>	 
	 	<td>SITO:</td>
  	<td><input type="text" name="sito"></td>
  </tr>
  <tr>	 
  	<td>MASCHERA DI SOTTORETE:</td>
    <td><input type="text" name="netmask"></td> 
  </tr>
  <tr>	 
    <td>GATEWAY LATO SEDE:</td>
    <td><input type="text" name="gateway"></td>
  </tr>
  <tr>	 
    <td>GATEWAY LATO SAN BENEDETTO:</td>
    <td><input type="text" name="gatewayazienda"></td>
  </tr>

</table>
</div> 

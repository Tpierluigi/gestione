
<div class="submenu">SCHEDA STAMPANTE CODICE # <span id="idprn">{$dati->id}</span></div>
  <table  width="600px" >
  	<tr>
  		<td id=prova>S.N.:</td>
  		<td><input id=fld_SN name=fld_SN value="{$dati->sn}"></td>
  	</tr>
  	<tr>
  		<td>MODELLO:</td>
  		<td>
  		<select name=fld_Modello>
  		{html_options values=$modelli output=$modelli selected=$dati->modello} 
  		</select>
  		</td>
  	</tr>
  	<tr>
  		<td>POSIZIONE.:</td>
  		<td>
  		<select name=fld_Posizione>
  		{html_options options=$posizioni selected=$dati->posizione} 
  		</select>
  		</td>
  	</tr>
  	<tr>
  		<td>FIRMWARE.:</td>
  		<td><input name=fld_Firmware value="{$dati->firmware}"></td>
  	</tr>
  </table>
	<p><b> OPZIONI DISPONIBILI </b></p>
  	<select id="opzionidisp" name=fld_opzioni size=10  multiple="multiple" style="width:600px;height:200px;">
     		{html_options options=$opzionidisp selected=$opzioni_id} 
   </select>				
{literal} 	
<script language="JavaScript" type="text/javascript">
<!--


		

	}
//-->
</script>	
	
{/literal}

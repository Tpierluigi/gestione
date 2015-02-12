<script language="JavaScript" type="text/javascript">
<!--
function aggiorna(ind)
		{ldelim}
		document.frmStampante.fNuovaURL.value=ind;
		document.frmStampante.submit();
		{rdelim}
//-->
</script>

<div class=submenu>SCHEDA STAMPANTE CODICE # {$dati->Codice}</div>
<form action="index.php?app=stampanti&modulo=edit&azione=$azione&id=$id" method="post" name="frmStampante">
  <table>
  	<tr>
  		<td>S.N.:</td>
  		<td><input name=fld_SN value="{$dati->SN}"></td>
  	</tr>
  	<tr>
  		<td>MODELLO:</td>
  		<td>
  		<select name=fld_Modello>
  		{html_options values=$modelli->val output=$modelli->desc selected=$dati->Modello} 
  		</select>
  		</td>
  	</tr>
  	<tr>
  		<td>POSIZIONE.:</td>
  		<td>
  		<select name=fld_Posizione>
  		{html_options values=$posizioni->val output=$posizioni->desc selected=$dati->Posizione} 
  		</select>
  		</td>
  	</tr>
  	<tr>
  		<td>FIRMWARE.:</td>
  		<td><input name=fld_Firmware value="{$dati->Firmware}"></td>
  	</tr>
  </table>
<input type=hidden name=fNuovaURL value="">
</form>
{if sizeof ($opzioni->val) == 0}
<b>NESSUNA OPZIONE INSTALLATA</b>
{else}
<FIELDSET>
  <LEGEND><h4><i>Elenco Opzioni installate</i></h4></LEGEND>
	{section name=nopz loop=$opzioni->val}
		Cod. {$opzioni->val[nopz]}: - {$opzioni->desc[nopz]} <br>
	{/section}
</FIELDSET>
{/if}

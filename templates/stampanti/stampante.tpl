<script>
    {literal}
    function viewModified(){
        document.getElementById('fldModificato').style.display="block";
    }
    function checkModified()
    {
        if (document.getElementById('fldModificato').style.display=="block")
            return confirm('ATTENZIONE: hai modificato dei dati!\n Vuoi DAVVERO uscire?');
    }
    {/literal}
</script>
<form name="frmStampante" action="index.php?app=stampanti&modulo=stampante&azione=update&id={$dati->id}" method="post">
  <table>
  <tr>
  		 <td>codice:</td>	
  <td>
  {if $dati->id == ""}
  <input name="id" type="text" name="id" value="{$dati->id}" size="5" maxlength="5" onChange="viewModified()">
  {else}
  <input name="id" type="text" name="id" value="{$dati->id}" size="5" maxlength="5" disabled>
  {/if}
  </td>
  </tr>					 
  		 <td>Numero di serie:</td>	
  <td><input type="text" name="sn" value="{$dati->sn}" size="30" maxlength="30" onChange="viewModified()"> </td>
  </tr>
  <tr><td>Modello:</td>
    <td>
      <select name="modello" onChange="viewModified()">
        {html_options options=$modelli selected=$dati->modello}
  	  </select> 
    </td>
  </tr>
  <tr>
    <td>Posizione:</td>
		<td>
      <select name="posizione" onChange="viewModified()">
        {html_options options=$posizioni selected=$dati->posizione}
  	 </select> 	 
    </td>
  </tr>
  <tr>
    <td>Versione Firmware:</td>
		<td><input type="text" name="firmware" value="{$dati->firmware}" size="50" maxlength="50" onChange="viewModified()"> </td>
  </tr>
	<tr>
    <td colspan="2">
		<FIELDSET>
			<LEGEND><h4><i>Elenco Opzioni installate</i></h4></LEGEND>
        {section name=elenco loop=$opzioni}
            Cod. {$opzioni[elenco]->id}: - {$opzioni[elenco]->descrizione} <br>
        {sectionelse}
        <b>NESSUNA OPZIONE INSTALLATA</b>
		{/section}
		</FIELDSET>
  	</td>
  </tr>
 </table>
</form>
<div id="fldModificato" style="position:absolute; bottom:0px;display:none;color:red;background-color:yellow;">ATTENZIONE: dati modificati</div>
{if $txtstatus != ""}
<div class="{$classStatus}">{$txtstatus}</div>
{/if}

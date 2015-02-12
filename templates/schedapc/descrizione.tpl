<div class=titolo>IDENTIFICAZIONE MACCHINA</div>
<table>
	<tr>
		<td>codice:</td>
		<td><b>{$dati->ID}</b></td>
	</tr>
	<tr>
		<td>Data di registrazione:</td>
		<td><b>{$dati->Datains}</b></td>
	</tr>
	<tr>
		<td>Tipo:</td>
		<td><b>{$tipo->descrizione}</b></td>
	</tr>
	<tr>
		<td>Funzione:</td>
		<td>
    {if $numfun > 0}
      {foreach from=$funzioni item=funzione}
      <div><b>{$funzione->ordine}: {$funzione->funzione}</b></div>
      {/foreach}
    {else}  
      <div align=center>&lt;&lt;&lt;NESSUNA DEFINITA&gt;&gt;&gt;</div>
    {/if}
    </td>
	</tr>
	<tr>
 		<td>Posizionamento Attuale:</td>
		<td><b>

    {if $posizione->sito != ''}
      {$posizione->sito}: {$posizione->impianto}
    {else}
      &lt;&lt;&lt;DA DEFINIRE&gt;&gt;&gt;
    {/if}
    {if $dati->progressivoimpianto == -1}
      ({$dati->posizione})
    {/if}
    </b>
    </td>
  </tr>
  <tr>
 		<td>Marca PC</td>
 		<td><b>{$dati->marca}</b></td>
	</tr> 
	<tr>
		<td>Modello PC</td>
		<td><b>{$dati->modello}</b></td>
	</tr> 
	<tr>
		<td>Numero di serie</td>
		<td><b>{$dati->SN}</b></td>
	</tr> 
	<tr>
  	<td> Etichetta COA: </td>
  	<td> <b>{$dati->COA}</b></td>
	</tr>
</table>


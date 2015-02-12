{if sizeof($dati) > 0}
	<div align="center">
  <table border=0 class="software">
  <tr><th>NAZIONE</th><th>SEDE</th><th>DENOMINAZIONE</th><th>PRG. IMPIANTO</th></tr>
	{section name=cont loop=$dati}
  				{if $smarty.section.cont.index is div by 2}
						{assign var="stile" value="pari"}
					{else}
						{assign var="stile" value="dispari"}
					{/if}
  				<tr>
  							<td class="{$stile}">{$dati[cont]->paese}</td>
  							<td class="{$stile}">{$dati[cont]->sito}</td>
  							<td class="{$stile}">{$dati[cont]->descrizione}</td>
  							<td class="{$stile}">{$dati[cont]->progressivoimpianto}</td>
  				</tr>
	{/section}
  </table>
	<div>
{else}
	<h3>NESSUNA SEDE PRESENTE</h3><hr noshade>
{/if}


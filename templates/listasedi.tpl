{if sizeof($dati) > 0}
	<div align="center">
  <table border=0 class="software">
  <tr><th>ID</th><th>SITO</th><th>NAZIONE</th></tr>
  {section name=cont loop=$dati}
  				{if $cont is even by 2}
						{assign var="stile" value="pari"}
					{else}
						{assign var="stile" value="dispari"}
					{/if}
  				<tr>
  							<td class="{$stile}">{$dati[cont]->id_azienda}</td>
  							<td class="{$stile}">{$dati[cont]->sito}</td>
  							<td class="{$stile}">{$dati[cont]->descrizione}</td>
  				</tr>
	{/section}
  </table>
	<div>
{else}
	<h3>NESSUNA SEDE PRESENTE</h3><hr noshade>
{/if}


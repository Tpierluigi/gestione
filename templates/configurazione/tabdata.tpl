<table>
{section name=cont loop=$tabData}
<tr>
	<td>{$tabData[cont]->desc_voce}</td><td>{$tabData[cont]->val_voce}</td>
</tr>
{sectionelse}
<tr><td><b>Nessuna configurazione presente</b></td></tr>
{/section}
</table>
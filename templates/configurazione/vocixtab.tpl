<table  width="100%" cellspacing="0" cellpadding="5">
	{section name=voce loop=$tabData}
	<tr>
		<td>{$tabData[voce]->desc_voce} </td>
		<td>
{if $tabData[voce]->tipo == "txt"}
			<input value="{$tabData[voce]->val_voce}" onchange="xajax_changeData({$id_pc},{$id_config},'{$tabData[voce]->id_voce}',this.value)">
            <div id="errore_{$tabData[voce]->id_voce}"></div>
{elseif $tabData[voce]->tipo == "cbb"}
            <select>
                <option value="xxx">da fare...</option>
            </select>
{elseif $tabData[voce]->tipo == "lsb"}
            <select size="8">
                <option value="xxx">da fare...</option>
            </select>
{/if}
        </td>
	</tr>
	{/section}
</table>

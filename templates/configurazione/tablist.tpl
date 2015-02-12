{section name=cont loop=$configList}
	{if $configList[cont]->nome_tab == $selected}
		<b>{$configList[cont]->nome_tab}</b>
	{else}
		<a onClick="xajax_renderSelectedTab({$id_pc},{$id_config},'{$configList[cont]->nome_tab}')">{$configList[cont]->nome_tab}</a> 
	{/if}
	|   
{sectionelse}
	Nessuna categoria presente
{/section}

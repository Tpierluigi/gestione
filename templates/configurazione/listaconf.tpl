{section name=cont loop=$configs}
{if $configs[cont]->num_conf == $selected}
<b>{$configs[cont]->desc_conf} </b>| 
{else}
<a onClick="xajax_renderConfigs({$id_pc},{$configs[cont]->num_conf})">{$configs[cont]->desc_conf}</a> | 
{/if}
{sectionelse}
<b>Nessuna configurazione presente</b>
{/section}
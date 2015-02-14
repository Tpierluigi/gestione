<div class=titolo>CRONOLOGIA INTERVENTI</div>
{if $numint > 0}
  {foreach from=$elencoint item=riga}
  <div><b>{$riga->data}</b>: {$riga->evento}</div>
  {/foreach}
{else}  
  <div align=center>&lt;&lt;&lt;NESSUNO&gt;&gt;&gt;</div>
{/if}
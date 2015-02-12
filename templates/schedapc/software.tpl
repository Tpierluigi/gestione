<div class=titolo>SOFTWARE INSTALLATO</div>
{if $numsw > 0}
  {foreach from=$elencosw item=riga}
  <div>Cod. {$riga->ID} : <b>{$riga->Descrizione}</b> ({$riga->Versione})</div>
  {/foreach}
{else}  
  <div align=center>&lt;&lt;&lt;NESSUNO&gt;&gt;&gt;</div>
{/if}

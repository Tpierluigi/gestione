<script language="JavaScript" type="text/javascript">
<!--
function aggiorna(ind)
		{ldelim}
		document.frmComputer.fNuovaURL.value=ind;
		document.frmComputer.submit();
		{rdelim}
//-->
</script>


  <div class="submenu">SCHEDA COMPUTER ID # {$dati->ID}</div>
  <div class="macchina">
  {include file="schedapc/descrizione.tpl"}
  </div>
  <div class="caratteristiche">
  {include file="schedapc/caratteristiche.tpl"}
  </div>
  <div class="rete">
  {include file="schedapc/rete.tpl"}
  </div>
  <div class="software">
  {include file="schedapc/software.tpl"}
  </div>
	
  <div class="software">
  {include file="schedapc/interventi.tpl"}
  </div>
  <div class="note">
  	<div class=titolo>NOTE</div>
  	<pre>{$dati->Note}</pre>
  </div> 
  

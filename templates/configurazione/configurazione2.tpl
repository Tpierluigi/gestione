{$xajax_javascript}

<table width="100%" cellspacing="0" cellpadding="0" border=0>
	<tr>
		<td width=30><img src="icone/conflist.bmp" border="0"></td><td style="background-color: #f0ffff;"  id ="elenco_configurazioni"> </td>
		<td style="background-color: #f0ffff;"  id ="nuova_configurazione">
			messaggi nuova configurazione
		</td>  		
	</tr>

	<tr>
		<td style="background-color: #ddddff;" id ="elenco_tabs">elenco categorie</td>  
		<td style="background-color: #ddccff;" id ="nuova_voce">
			messaggi nuova voce
		</td>  		
	</tr>
	<tr>
		<td  style="background-color: #eeeeff;" id ="elenco_voci" colspan=2>
			lista voci relative alla tab
		</td>
	</tr>
</table>
<script>
xajax_renderConfigs({$id_pc});
xajax_handleNewConfig(0,"",{$id_pc});
xajax_handleNewFeature(0,0,{$id_pc});
xajax_renderSelectedTab({$id_pc});
</script>

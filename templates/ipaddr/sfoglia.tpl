<div class="submenu"> Seleziona l'apparecchio desiderato </div> 

<table rules="cols"  cellspacing="0" width="100%">
<tr>
<th><a href="index.php?modulo=sfoglia&app=ipaddress&ord=ipaddr_ip.ip">IP</a></th>
<th><a href="index.php?modulo=sfoglia&app=ipaddress&ord=ipaddr_ip.livello">LIVELLO</a></th>
<th><a href="index.php?modulo=sfoglia&app=ipaddress&ord=ipaddr_reparti.descrizione">DESCRIZIONE</a></th>
<th><a href="index.php?modulo=sfoglia&app=ipaddress&ord=ipaddr_aziende.sito">SITO</a></th>
</tr>

{section name=ip loop=$dati}
				<tr>
							<td class='riga'>{$dati[ip]->ip}</td>
							<td class='riga'>{$dati[ip]->livello}</td>
							<td class='riga'>{$dati[ip]->descrizione}</td>
							<td class='riga' align='center'>{$dati[ip]->sito}</td>
							<td class='riga'>
								<a href="index.php?modulo=computer&app=PC&id=$riga->ID"><img border=0 src='bottone.php?text=EDIT&bgdcol=000099&txtcol=ffffff&s=6&font=micross.ttf'></a> 
								<a href="index.php?modulo=schedapc&app=PC&id=$riga->ID"><img border=0 src='bottone.php?text=VIEW&bgdcol=006666&txtcol=ffffff&s=6&font=micross.ttf'></a>
							</td>
				</tr>
{/section}
</table>

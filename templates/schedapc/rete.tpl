<div class=titolo>IMPOSTAZIONI DI RETE</div>		 
<table>
	<tr>
		<td>Rete 1: Tipo :</td>
		<td><b>{$dati->skrete1}</b></td>
		<td>Rete 2: Tipo :</td>
	 	<td><b>{$dati->skrete2}</b></td>
		<td> ID di rete</td>
		<td><b>{$dati->IDrete}</b></td>
	</tr>
	<tr>
		<td>Rete 1: IP Address :</td>
    <td><b>{$dati->IPAddress}</b></td>
    <td>Rete 2: IP Address :</td>
		<td><b>{$dati->IPAddress2}</b></td>
		<td>Password Amministrativa</td>
		<td><b>{$dati->AdminPWD}</b></td>
	</tr>
	<tr>
  	<td>Rete 1: IP NetMask :</td>
    <td><b>{$dati->Netmask}</b></td>
    <td>Rete 2: IP NetMask :</td>
  	<td><b>{$dati->Netmask2}</b></td>
  	<td>Password VNC</td>
		<td><b>{$dati->VNCPWD}</b></td>
	</tr>
	<tr>
   	<td>Rete 1: Gateway :</td>
    <td><b>{$dati->Gateway}</b></td>
    <td>Rete 2: Gateway :</td>
  	<td><b>{$dati->Gateway2}</b></td>
    <td>Default user name: </td>
  	<td><b>{$dati->UserName}</b></td>
	</tr>
	<tr> 
  	<td>Workgroup o Dominio: </td>
    <td>
			<b>
			{if $dati->TipoGruppo == "W"}
    	WORKGROUP
			{elseif $dati->TipoGruppo == "D"}
    	DOMINIO
			{else}
    	ALTRO/NON APPLICABILE
			{/if}
			</b>
		</td>
    <td>Nome: </td>
  	<td><b>{$dati->NomeGruppo}</b></td>
    <td>Default password: </td>
  	<td><b>{$dati->UserPWD}</b></td>
	</tr>
</table>

{literal}
<script language="JavaScript" type="text/javascript">
  <!--
  function aggiorna(ind)
  		{
  		document.frmComputer.fNuovaURL.value=ind;
  		document.frmComputer.submit();
  		}
  function finestraposizione()
  	{		
		rif=document.getElementById('finestrina');
  	if (rif.style.display=='none')
  		rif.style.display='block';
  	else
  		rif.style.display='none';
  	}
		function assegna(sede,impianto)
			{
  		document.frmComputer.id_aziende.value=sede;
  		document.frmComputer.progressivoimpianto.value=impianto;
  		document.frmComputer.submit();
  		rif=document.getElementById('finestrina');
  		rif.style.display='none';
			}
  	function visualizza(numero)
  		{
			for(i=1;i<6;i++)
				{
				nomescheda='scheda'+i.toString();
				nomelinguetta='linguetta'+i.toString();
  			document.getElementById(nomescheda).style.display='none';
  			document.getElementById(nomelinguetta).style.backgroundColor='#cccccc';
				}
  		document.getElementById('scheda'+numero).style.display='block';
  		document.getElementById('linguetta'+numero).style.backgroundColor='yellow';
  		
  		}
  //-->
  {/literal}
  {if $fNuovaURL != ""}
  document.location.href='$fNuovaURL';
  {/if}
  </script>

<form action="index.php?modulo=computer&app=PC&id=$dati->ID" method="post" name="frmComputer">
<div class="submenu">inserimento/modifica computer</div>
<div id="titolo">
  <div id="linguetta1" onclick="javascript: visualizza('1')">DESCRIZIONE</div>
  <div id="linguetta2" onclick="javascript: visualizza('2')">CARATTERISTICHE</div>
  <div id="linguetta3" onclick="javascript: visualizza('3')">RETE</div>
  <div id="linguetta4" onclick="javascript: visualizza('4')">SOFTWARE</div>
  <div id="linguetta5" onclick="javascript: visualizza('5')">NOTE</div>
  <hr />	
</div>	
<div id=scheda1>
<div class=titolo>IDENTIFICAZIONE MACCHINA</div>
  <table>
    <tr>
      <td>codice</td>
      <td><input type="text" size=3 maxlength=4 name="ID" value="{$dati->ID}"></td>
    </tr>
    <tr>
      <td>
      Data di registrazione:
      </td>
      <td><b>{$dati->Datainst}</b>
      </td>
    </tr>
    <tr>
      <td>
      Tipo:
      </td>
      <td>
      <select name="Tipo">
       <option value="0">Seleziona..</option>
       {html_options options=$elenco selected=$dati->Tipo}
      </select>
			</td>
    </tr>
		<tr>
		  <td>Funzione:</td>
			<td>
      {section name=nfun loop=$funzioni}
     		<strong> {$funzioni[nfun]->ordine} : {$funzioni[nfun]->funzione} </strong><br>
   		{sectionelse}
      	<strong> DA DEFINIRE</strong>
			{/section}
      </td>
		</tr>
		<tr>
		  <td>Posizionamento Attuale:</td>
			<td>
  			<input type="hidden" name="id_aziende" value="$dati->id_aziende">
  			<input type="hidden" name="progressivoimpianto" value="$dati->progressivoimpianto">

        {if $posizione->sito != ""}
				<strong>{$posizione->sito|escape:"htmlall"} : {$posizione->impianto|escape:"htmlall"}</strong> &nbsp;&nbsp;<img src="icons/prova.gif" onclick='finestraposizione()'/>
        {else}
				<strong>DA DEFINIRE</strong> &nbsp;&nbsp;<img src="icons/prova.gif" onclick='finestraposizione()'/>
        {/if}
			</td>
		</tr>
    {if $dati->progressivoimpianto == -1}
  	<tr>
  	<td>Descrizione della pos. generica:</td>
  	<td><input type="text" size=40 name="posizione" value="$dati->posizione"></td>
  	</tr>
    {/if}   
		<tr>
   		<td>Marca PC</td>
   		<td><input type="text" name="marca" value="{$dati->marca}"></td>
  	</tr> 
  	<tr>
  		<td>Modello PC</td>
  		<td><input type="text" name="modello" value="{$dati->modello}"></td>
  	</tr> 
  	<tr>
      <td>Numero di serie</td>
      <td> 
				<input type="text" size="30" name="SN" value="{$dati->SN}">
  		</td>
  	</tr> 
  	<tr>
	 		<td> Etichetta COA: </td>
  		<td> 
        <input type="text" size="5" maxlength="5" name="COA1" value="{$coa1}">-
        <input type="text" size="3" maxlength="3" name="COA2" value="{$coa2}">-
        <input type="text" size="3" maxlength="3" name="COA3" value="{$coa3}">-
        <input type="text" size="3" maxlength="3" name="COA4" value="{$coa4}">
  		</td>
  	</tr>
  </table>
</div>
<div id=scheda2>
  <div class=titolo>CARATTERISTICHE</div>
    <table>
    <tr>
   	  <td>Pollici</td>
  		<td><input type="text" size=4 name="pollici" value="{$dati->pollici}"></td>
    </tr>
  	<tr>
  	  <td>Tipo:</td>
  		<td><input type="text" size=7 name="tipomon" value="{$dati->tipomon}"></td>
  	</tr>
  	<tr>
  	  <td>Motherboard:</td> 
    	<td><input type="text" name="madre" value="{$dati->madre}"></td>
  	</tr>
  	<tr>
  	  <td>CPU:</td> 
      <td><input type="text" name="CPU" value="{$dati->CPU}"></td>
    </tr>
    <tr>
      <td>RAM:</td> 
      <td><input type="text" name="RAM" value="{$dati->RAM}">Mb</td>
    </tr>
    <tr>
      <td>HD:</td> 
      <td><input type="text" name="HD" value="{$dati->HD}"></td>
    </tr>
  	<tr>
  		<td>Lettore ottico 1: tipo</td>
  		<td><input type="text" name="lettore1" value="{$dati->lettore1}"></td>
  	</tr>
    <tr>
      <td>Lettore ottico 2: tipo</td>
      <td><input type="text" name="lettore2" value="{$dati->lettore2}"></td>
    </tr>
    <tr>
      <td>Scheda video</td>
      <td><input type="text" name="skvideo" value="{$dati->skvideo}"></td>
    </tr>
    <tr>
      <td>Sezione audio</td>
      <td><input type="text" name="audio" value="{$dati->audio}"></td>
    </tr>
  </table>
</div>
<div id=scheda3>
  <div class=titolo>IMPOSTAZIONI DI RETE</div>	
  <table>
    <tr>
      <td>
      Rete 1: Tipo :  
      </td>
      <td> 
      <input type="text" name="skrete1" value="{$dati->skrete1}">
      </td>
      <td>
      Rete 2: Tipo :  
      </td>
      <td> 
      <input type="text" name="skrete2" value="{$dati->skrete2}">
      </td>
    </tr>
    <tr>
      <td>
        Rete 1: IP Address :
      </td>
      <td>
        <input type="text" size=15 maxlenght="15" name="IP" value="{$dati->IPAddress}">
      </td>
      <td>
        Rete 2: IP Address :
      </td>
      <td>
        <input type="text" size=15 maxlenght="15" name="IP2" value="{$dati->IPAddress2}">
      </td>
    </tr>
    <tr>
      <td>
      Rete 1: IP NetMask : 
      </td>
      <td>
      <input type="text" size=15 maxlenght="15" name="NM" value="{$dati->Netmask}">
      </td>
      <td>
      Rete 2: IP NetMask : 
      </td>
      <td>
      <input type="text" size=15 maxlenght="15" name="NM2" value="{$dati->Netmask2}">
      </td>
    </tr>
    <tr>
      <td>
      Rete 1: Gateway : 
      </td>
      <td>
      <input type="text" size=15 maxlenght="15" name="GW1" value="{$dati->Gateway}">
      </td>
      <td>
      Rete 2: Gateway : 
      </td>
      <td>
      <input type="text" size=15 maxlenght="15" name="GW2" value="{$dati->Gateway2}">
      </td>
    </tr>
    <tr>
      <td colspan='4'>
      <hr>
      </td>
    </tr>
    <tr>
	  <td>Gruppo di lavoro o Dominio :</td>
		<td>
        <select name="GroupType">
          <option value="" {if $dati->TipoGruppo == ""}selected{/if}>ALTRO/N.A.</option>
          <option value="W" {if $dati->TipoGruppo == "W"}selected{/if}>WORKGROUP</option>
          <option value="D" {if $dati->TipoGruppo == "D"}selected{/if}>DOMINIO</option>
        </select>
	  </td>
	</tr>
    <tr>
      <td>Nome Gruppo/dominio :</td>
      <td><input type="text" size=20 maxlenght="20" name="GroupName" value="{$dati->NomeGruppo}"></td>
    </tr>
    <tr>
      <td> ID di rete</td>
      <td><input type="text" size=20 maxlenght=32 value="{$dati->IDrete}"name="NetID"></td>
    </tr>
    <tr>
      <td colspan='4'> <hr> </td>
    </tr>
    <tr>
      <td>Password Amministrativa</td>
      <td><input type="text" size=12 name="passwordAdmin" value="{$dati->AdminPWD}"></td>
      <td>Password VNC</td>
      <td><input type="text" size=8 maxlenght=8 name="passwordVNC" value="{$dati->VNCPWD}"></td>
    </tr>
    <tr>
      <td>Default user name :</td>
      <td><input type="text" size=15 maxlenght="15" name="nomeutente" value="{$dati->UserName}"></td>
      <td>Default password : </td>
      <td><input type="text" size=15 maxlenght="15" name="pwutente" value="{$dati->UserPWD}"></td>
    </tr>
  </table>
</div>
<div id=scheda4>
  <div class=titolo>SOFTWARE INSTALLATO</div>
  {section name=softrow loop=$elencosw}
 	<div>
    Cod.{$elencosw[softrow]->ID} : 
    <b>{$elencosw[softrow]->Descrizione}</b> 
    ({$elencosw[softrow]->Versione})
  </div>
  {sectionelse}
  <div align=center>&lt;&lt;&lt;NESSUNO&gt;&gt;&gt;</div>
	{/section}
</div>
<div id=scheda5>
  <div class=titolo>NOTE</div>
  <textarea name="fNote" rows=3 cols=100>{$dati->Note}</textarea>
</div> 
<input type="hidden" name="azione" value="$val">		 
<input type="hidden" name="fNuovaURL">
</form>

<div id="finestrina" style="top:200px;left:400px;">
	<div class="titolo" onclick="javascript:finestraposizione()">CHIUDI</div>
	$root->dtree(true,$cont);	
</div>
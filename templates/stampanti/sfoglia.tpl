 	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
	<!-- plugin jqgrid -->
	<link rel="stylesheet" type="text/css" media="screen" href="lib/jquery/css/ui-lightness/ui.jqgrid.css" />
	<script src="lib/jquery/js/grid.locale-it.js" type="text/javascript"></script>
	<script src="lib/jquery/js/jquery.jqGrid.min.js" type="text/javascript"></script>

	<!-- plugin multiselect -->
	<script type="text/javascript" src="lib/jquery/js/ui.multiselect.js"></script>	

  <div align="center" style="height: 75%">
    <table id="stampanti" rules="cols"  cellspacing="0" style="border:1px solid black;">
			<thead>
      <tr>
        <th>CODICE</th>
        <th>SN</th>
        <th>MODELLO</th>
        <th>POSIZIONE</th>
        <th>FIRMWARE</th>
      </tr>
			</thead>
			<tbody>
  {section name=indice loop=$dati}
      <tr>
        <td class='riga'>{$dati[indice]->id}</td>
        <td class='riga'>{$dati[indice]->sn}</td>
        <td class='riga'>{$dati[indice]->descrizione}</td>
        <td class='riga'>{$dati[indice]->posizione}</td>
        <td class='riga' align='center'>{$dati[indice]->firmware}</td>
      </tr>
  {sectionelse}
    <tr>
        <td colspan="5"> <h2 align="center">NON CI SONO STAMPANTI DEFINITE!</h2> </td>
     </tr>
    {/section} 
			</tbody>
    </table>
  </div>
<div id="gridpager"></div> 
<div id="messaggi" title="seleziona un PC"><p>SELEZIONA UNA STAMPANTE DA EDITARE/MODIFICARE</p></div>
<div id="editdlg"></div>
<div id="comandi" ></div> 
{literal}
<script language="JavaScript" type="text/javascript">
	
//inizializzo il dialog box per i messaggi
$("#messaggi").dialog(
	{  autoOpen: false, 
	modal: true, 
	show:'drop', 
	hide:'drop', 
	resizable:false,
	buttons: { "Ok": function() { $(this).dialog("close"); } } });
//inizializzo il dialog box per i l'edit
$("#editdlg").dialog(
	{  
	autoOpen: false, 
	modal: true, 
	show:'drop', 
	hide:'drop', 
	width: 700,
	resizable:true,
	buttons: { 
		"OK": function() {
			var val="",i=0,stampante=$("#editdlg #idprn" ).text();
			var optarr=$("#editdlg #opzionidisp" ).attr("options");
			$("#comandi").load("lib/cmdsql.php?command=del&table=elencoopzionistampanti&field=idopzione&where=idstampante='"+stampante+"'");
			for(i=0;i<optarr.length;i++){
				val=optarr[i];
				if (val.selected)
					$("#comandi").load("lib/cmdsql.php?command=ins&table=elencoopzionistampanti&field=idstampante,idopzione&value='"+stampante+"','"+val.value+"'");			}
			$(this).dialog("close"); 
			
		} ,
		"ANNULLA": function() { 
			$(this).dialog("close"); 
		} 
	} }
	);

// creo la grid dalla tabella caricata..
// come opzioni specifico il DIV relativo al pager e le opzioni del pager...
tableToGrid("#stampanti",{
	pager: '#gridpager',
	pgtext : "",
	recordtext: "",
	pgbuttons:false
	}
	); 
lista=$("#stampanti");

lista.setGridHeight("80%");
//aggiungo al pager i bottoni del navigator (solo search e refresh alla fine..)
lista.navGrid('#gridpager',{view:false, del:false, edit:false, add:false}); 
//dato che quelli predefiniti non mi servono aggiungo i due bottoni aggiungi ed  edita

lista.navButtonAdd("#gridpager",
	{caption:'Modifica', 
	buttonicon:'ui-icon-pencil', 
	onClickButton:function(){callerEdit(3,lista);}, 
	position: "first", 
	title:"Modifica'"});
lista.navButtonAdd("#gridpager",
	{caption:'Aggiungi Stampante', 
	buttonicon:'ui-icon-plusthick', 
	onClickButton:function(){callerEdit(2,lista);}, 
	position: "first", 
	title:"Aggiungi Stampante'"});

function callerAdd(){
	window.location.href="index.php?modulo=computer&app=stampanti&id=";
}

function callerEdit(mode,lista){
	var id = lista.getGridParam('selrow'); 
	if( mode==2){
		//aggiunta
		window.location.href="index.php?modulo=computer&app=PC";
	}
	else{ 
		if (id) { 
			var ret = lista.getRowData(id); 
			if (mode==1)
				//modifica
				window.location.href="index.php?modulo=stampante&app=stampanti&azione=edit&codice=" + ret.CODICE;
			else if (mode==3){
				$("#editdlg").title="Modifica stampante";
    		$("#editdlg").load("moduli/stampanti/sfoglia/editdlg.php?&codice=" + ret.CODICE,null,
					function(){$("#opzionidisp").multiselect({sortable: false, searchable: false});});
		    
				$("#editdlg").dialog( 'open');
				
		  }
		}
		 
		else { 
			$("#messaggi").dialog( 'open');
		} 
	}
}
</script>
{/literal}
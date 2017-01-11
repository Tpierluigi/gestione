<?php
function changeData($id_pc,$id_configurazione,$id_voce,$valore){
	global $db;
	$oResp=new xajaxResponse();
	$check=$db->get_row("select maschera from t_config_voci where id_voce='$id_voce'");

    if (($check->maschera!="") && (!preg_match($check->maschera,$valore))){
        $oResp->addAssign("errore_$id_voce","innerHTML","Errore nell'inserimento dati! (maschera: ".$check->maschera.")");
        return $oResp->getXML();
    }
    else{
    	$db->query("
    		update t_config_righe set val_voce='$valore'
    		where id_pc=$id_pc and id_voce='$id_voce' and id_configurazione=$id_configurazione
    		");
        $oResp->addAssign("errore_$id_voce","innerHTML","");
        return $oResp->getXML();
    }
}
function renderConfigs($id_pc,$selected=0){
	global $db;
	$oResp=new xajaxResponse();
	$configs=$db->get_results("select * from t_config_configurazioni where id_pc=$id_pc and valida=1");
	if ($selected == 0) $selected=$configs[0]->num_conf;
	$html=new smartypc;
	$html->assign("configs",$configs);
	$html->assign("selected",$selected);
	$html->assign("id_pc",$id_pc);
	$oResp->addAssign("elenco_configurazioni","innerHTML",$html->fetch("configurazione/listaconf.tpl"));
	$oResp->loadCommands(renderSelectedTab($id_pc,$selected,""));
    $oResp->addAlert("configurazione: $selected");
	$oResp->loadCommands(handleNewFeature(0,$selected,$id_pc));
	return $oResp->getXML();
}

function renderSelectedTab($id_pc,$id_config=0,$selected=""){
	global $db;
	if ($selected ==""){
		$firstTab=$db->get_row("select nome_tab from t_config_righe inner join t_config_voci using (id_voce)");
		$selected=$firstTab->nome_tab;
	}
	if (!$id_config){
		$firstAvailConfig=$db->get_row("select ifnull(min(num_conf),1) as id from t_config_configurazioni where valida=1 and id_pc=$id_pc");
		$id_config=$firstAvailConfig->id;
	}
	$sql="select * from t_config_righe inner join t_config_voci using (id_voce) 
		where id_pc=$id_pc and id_configurazione=$id_config and nome_tab='$selected'";
	$tabData=$db->get_results($sql);
	$sql="select distinct (nome_tab)	from t_config_righe inner join t_config_voci using (id_voce) 
		where id_pc=$id_pc and id_configurazione=$id_config";
	$configList=$db->get_results($sql);


	$html=new smartypc;
	$html->assign("id_config",$id_config);
	$html->assign("id_pc",$id_pc);
	$html->assign("tabData",$tabData);
	$html->assign("selected",$selected);
	$html->assign("configList",$configList);
	$oResp=new xajaxResponse();
	$oResp->addAssign("elenco_voci","innerHTML",$html->fetch("configurazione/vocixtab.tpl"));	
	$oResp->addAssign("elenco_tabs","innerHTML",$html->fetch("configurazione/tablist.tpl"));
	return $oResp->getXML();
}
function handleNewConfig($confstep,$descConf,$id_pc){
	global $db;
	$oResp=new xajaxResponse();
	
	switch ($confstep){
		case 0 :
			$html="
			<img onClick=xajax_handleNewConfig(1,'',$id_pc) src=\"icone/newconf.png\">
			<img onClick=xajax_handleNewConfig(3,'',$id_pc) src=\"icone/cancconf.png\">
			";
			$oResp->addAssign("nuova_configurazione","innerHTML",$html);
			return $oResp->getXML();
		break;
		case 1 :
			$html="
			Nome configurazione: 
			<input size=\"20\"  id='newconf'>
			<input type='button' onclick='xajax_handleNewConfig(2,document.getElementById(\"newconf\").value,$id_pc)' value=\"Inserisci\">
			<input type='button' onclick='xajax_handleNewConfig(0,\"\",$id_pc)' value=\"Annulla\">
			";
			$oResp->addAssign("nuova_configurazione","innerHTML",$html);
			return $oResp->getXML();
		break;
		case 2 :
			$nuovo=$db->get_row("Select ifnull(max(num_conf)+1,1) as id from t_config_configurazioni where id_pc=$id_pc and valida=1");
			$pc=$db->get_row("select Tipo from apparecchi where ID=$id_pc");
			$db->query("
				insert into t_config_configurazioni (id_pc,num_conf,desc_conf,valida)
				values($id_pc,".(int)$nuovo->id .",'".$db->escape($descConf)."',1)
				");
			$db->query("
				insert into t_config_righe (id_pc,id_configurazione,id_voce,val_voce)
				select $id_pc,".(int)$nuovo->id .",id_voce,null 
				from t_config_voci_default 
				where id_tipoapparecchio=$pc->Tipo
				");
			$oResp->loadCommands(renderConfigs($id_pc));
			$oResp->loadCommands(handleNewConfig(0,"",$id_pc));
			return $oResp->getXML();
 		break;
	}
}
function handleNewFeature($featstep,$config_id=0,$id_pc,$feat_id=""){
	global $db;
	$oResp=new xajaxResponse();

	if (!$id_config){
		$firstAvailConfig=$db->get_row("select ifnull(min(num_conf),1) as id from t_config_configurazioni where valida=1 and id_pc=$id_pc");
		$id_config=$firstAvailConfig->id;
	}

    $oResp->addAlert("handleNewFeature()-passo: $featstep; codice=$config_id");
    $dmp=debug_backtrace();
    foreach ($dmp as $itm){
        $strdeb=" -> ".$itm["function"].$strdeb;
    }
    $oResp->addAlert("handleNewFeature()- Sequenza: $strdeb");

	switch ($featstep){
		case 0 :
			$html="
			<img onClick=xajax_handleNewFeature(1,$config_id,$id_pc) src=\"icone/newFeat.png\">
			";
			$oResp->addAssign("nuova_voce","innerHTML",$html);
			return $oResp->getXML();
		break;
		case 1 :
			$voci=$db->get_results("select * from t_config_voci order by nome_tab,desc_voce");
			foreach ($voci as $voce){
				$option[]="<option value=\"$voce->id_voce\">$voce->nome_tab: $voce->desc_voce</option>";
			}
			$html="
			Seleziona : <select onChange=xajax_handleNewFeature(2,$config_id,$id_pc,this.value)> 
				<listavoci>
			<input type='button' onClick='xajax_handleNewFeature(0,$config_id,$id_pc)' value=\"Annulla\">
			";
			$html=str_replace("<listavoci>",implode("\n",$option),$html);
			$oResp->addAssign("nuova_voce","innerHTML",$html);
			return $oResp->getXML();
		break;
		case 2 :
			//$nuovo=$db->get_row("Select ifnull(max(num_conf)+1,1) as id from t_config_configurazioni where id_pc=$id_pc and valida=1");
			//$pc=$db->get_row("select Tipo from apparecchi where ID=$id_pc");
			$db->query("
				insert into t_config_righe (id_pc,id_configurazione,id_voce,val_voce)
				values($id_pc,$config_id,'$feat_id',null)
				");

			$oResp->loadCommands(renderConfigs($id_pc,$config_id));
			$oResp->loadCommands(handleNewFeature(0,$config_id,$id_pc));
			$oResp->loadCommands(handleNewConfig(0,"",$id_pc));
			return $oResp->getXML();
 		break;
	}
}


$xajax=New xajax;
$xajax->registerFunction("renderConfigs");
$xajax->registerFunction("renderSelectedTab");
$xajax->registerFunction("handleNewConfig");
$xajax->registerFunction("handleNewFeature");
$xajax->registerFunction("changeData");
$xajax->processRequests();
$smarty=new smartypc;
$smarty->assign("xajax_javascript",$xajax->getJavascript());
$smarty->assign("id_pc",(int)$_GET['id']);
$smarty->display("configurazione/configurazione.tpl");


?>

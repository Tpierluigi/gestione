<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DocumentiController
 *
 * @author pier
 */
class DocumentiController extends BaseController {

    public function __construct(\Database $db) {
        parent::__construct($db);
        global $viewDir;
        if (verificalivello(3)) {
            //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
            //recupero e controllo le eventuali variabili in  ingresso dalla form 
            $azione = getGlobalVarValue($_POST, 'azione');
            $codice = getGlobalVarValue($_POST, 'codice');
            //costruisco la data
            $data= getGlobalVarValue($_POST, 'datag','01'). '/' .
                    getGlobalVarValue($_POST, 'datam','01'). '/' .
                    getGlobalVarValue($_POST, 'dataa','1900');
            //serve per inserire correttamente gli apici in SQL server 
            $commento = $this->db->quote(str_replace("'", "''", getGlobalVarValue($_POST,'commento')));  
            $id = getGlobalVarValue($_GET,'id');
            /*
              if ($azione=="add")
              include ("insertdoc.php");
              if ($azione=="del")
              {
              //cancello SOLO il record, non il file.
              $db->query("delete from documenti where ID=$codice");
              }
              if (($azione=="add")||($azione=="del")||($azione==""))
              {
              $menubar->add("AGGIUNGI DOCUMENTAZIONE","","eseguiAzione('write','frmDocumenti')");
              $menubar->add("ELIMINA SELEZIONATO","","eseguiAzione('del','frmDocumenti')");
              }
              if ($azione=="write")
              {
              $menubar->add("CONFERMA INSERIMENTO","","eseguiAzione('add','frmDocumenti')");
              }
              $menubar->show();
             */
            //parte per la visualizzazione. 
            if (($azione == "add") || ($azione == "del") || ($azione == "")) {
                include $viewDir . "view.common.header.php";
                include $viewDir . "view.docs.list.php";
            }
//            if ($azione == "write")
//                include $viewDir . "view.docs.form.php";
        }
    }

    public function insert() {
        //recupero ID dell'utente che sta eseguendo l'operazione, l'estensione del file passato e il MIME type
        $codutente = $_SESSION["id"];
        $estensione = substr($_FILES['Documento']['name'], strrpos($_FILES['Documento']['name'], '.'));
        $tipo = $_FILES['Documento']['type'];
        //inserisco il record sul DB. Il come del file viene poi calcolato successivamente dal campo ID del record 
        //appena inserito. L'univocità è garantita dalla selezione dell'utente 
        $nuovoID = TrovaPrimoIdLibero('documenti', 'ID');
        $Documento = strtolower($nuovoID . $estensione);
        if (move_uploaded_file($_FILES['Documento']['tmp_name'], $uploaddir . $Documento)) {
            $db->query("insert into documenti(ID,PC,IDUtente,Commento,Tipo,Documento) values ($nuovoID,$id,$codutente,'$commento','$tipo','$Documento')");
            print "File accettato";
        } else {
            print "Problemi nel trasferimento file!!\n";
            fermete($_FILES, false);
            fermete($Documento, false);
        }
    }

    public function listDocs() {
        $_DIMX = 200;
        $id = (int) $_GET['id'];
        $computer = new Computer($this->db);

        $dati = $computer->getDocs($id);
        if ($dati) {
            for ($i = 0; $i < sizeof($dati); $i++) {
                if ($dati[$i]->Tipo == ".jpg") {
                    $dati[$i]->nomemin = substr($dati[$i]->Documento, 0, strlen($dati[$i]->Documento) - 4) . "_t.jpg";
                    if (!file_exists($dati[$i]->nomemin)) {
                        $orig = imagecreatefromjpeg(strtolower($dati[$i]->Documento));
                        if (!$orig) {
                            $dati[$i]->errMsg = "problemi nel caricamento immagine";
                        } else {
                            $dati[$i]->errMsg = "";
                            $dx = imagesx($orig);
                            $dy = imagesy($orig);
                            //dato che $_DIMX:altezza=$dx:$dy ...
                            $thumb = imagecreate($_DIMX, $_DIMX * $dy / $dx);
                            imagecopyresized($thumb, $orig, 0, 0, 0, 0, $_DIMX, $_DIMX * $dy / $dx, $dx, $dy);
                            $dati[$i]->nomemin = "";
                            imagejpeg($thumb, $dati[$i]->nomemin, 50);
                            break;
                        }
                    }
                }
            }
        }
        include $viewDir . 'view.docs.list.php';
    }

}

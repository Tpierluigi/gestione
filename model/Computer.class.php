<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of computer
 *
 * @author pier
 */
class Computer {

    private $db;

    public function __construct(Database $db) {
        $this->db = $db;
    }

    public function getSoftwareForPC($id) {
        $elencosw = $this->db->get_results("SELECT software.ID, software.Descrizione,"
                . "elencosw.Versione,elencosw.Licenza FROM software "
                . "INNER JOIN elencosw ON software.ID = elencosw.software "
                . "WHERE elencosw.computer=$id");
        return $elencosw;
    }

    public function getFunctForPC($id) {
        $elenco = $this->db->get_results("Select pc_funzioni.ordine, pc_tipifunzione.funzione "
                . "from pc_funzioni inner join pc_tipifunzione "
                . " on pc_funzioni.id_pc_tipifunzione=pc_tipifunzione.id "
                . "where pc_funzioni.id_apparecchi=$id");
        return $elenco;
    }

    public function getDetails($id) {
        $dati = $this->db->get_row("Select *,DATE_FORMAT(Datainst,'%d/%m/%Y')as Datainst from apparecchi where id=$id");
        return $dati;
    }

    public function getLocation($id) {
        $dati = $this->db->get_row("
            SELECT aziende.sito, 
            impianti.descrizione AS impianto
            FROM apparecchi INNER JOIN impianti ON 
            apparecchi.id_aziende = impianti.id_aziende AND 
            apparecchi.progressivoimpianto = impianti.progressivoimpianto
            INNER JOIN aziende ON impianti.id_aziende = aziende.id_azienda
            WHERE apparecchi.ID = $id
            ");
        return $dati;
    }

    public static function getList(Database $db, $activeOrder = "") {
        $testoqry = "";
        $testoqry.="SELECT a.ID, ta.descrizione AS tipo,a.posizione,a.SN,a.idRete,";
        $testoqry.="a.Descrizione, a.IPAddress,a.COA, a.id_aziende,a.progressivoimpianto ";
        $testoqry.="FROM apparecchi a INNER JOIN tipiapparecchi ta ON a.Tipo = ta.ID";
        if ($activeOrder!=""){
            $testoqry.=" order by $activeOrder";
        }
        $dati = $db->get_results($testoqry);
        return $dati;
    }
    public function getOtherData($id){
        $dati=$this->db->get_results(
                "SELECT  pc_campi.id,pc_campi.descrizione,pc_varie.pc,pc_varie.voce,pc_varie.valore "
                . "FROM pc_campi left join pc_varie on pc_campi.id=pc_varie.voce and pc_varie.pc=$id ");
        return $dati;
    }
    public function getDocs($id){
        $dati=$this->db->get_results("SELECT  ID,PC,Documento,Commento,Tipo FROM documenti WHERE PC=$id ");
        return $dati;
    }

}

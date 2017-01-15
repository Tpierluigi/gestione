<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Posizione
 *
 * @author pier
 */
class Posizione {

    public function __construct() {
        ;
    }
    public static function elenco(Database $db) {
        $dati = $db->get_results("SELECT paesi.descrizione as paese,paesi.icona,paesi.id_paese,aziende.id_azienda,aziende.sito,impianti.*
            FROM 
		impianti inner join aziende on impianti.id_aziende=aziende.id_azienda
		inner join paesi on aziende.id_paesi=paesi.id_paese
            ORDER BY paesi.descrizione,sito,impianti.descrizione");
        return $dati;
    }

}

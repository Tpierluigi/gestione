<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DatiVariController
 *
 * @author pier
 */
class DatiVariController extends BaseController {

    public function update() {
        $idApparecchio = (int) ($_GET['idApparecchio']);
        $idVoce = (int) ($_GET['idVoce']);
        $valore = $_POST['value'];
        try {
            $stmt = $this->db->prepare("replace into pc_varie(pc,voce,valore) values (?,?,?)");
            $stmt->execute(array($idApparecchio, $idVoce, $valore));
        } catch (Exception $e) {
            header("HTTP/1.0 400 " . $e->getMessage());
        }
    }

}

?>
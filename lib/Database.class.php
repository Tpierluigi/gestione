<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * facade per mimare i comportamenti di ez_sql via PDO
 *
 * @author pier
 */
class Database extends PDO {

    /**
     *
     * @var PDOStatement
     */
    private $ris;

    /**
     * tenta di chiudere il recordset
     */
    private function close() {
        try {
            if ($this->ris)
                $this->ris->closeCursor();
        } catch (Exception $e) {
            
        }
    }

    /**
      ritorna il risultato; con multiple si può specificare più di una query,
      anche se solo l'ultima ritorna l'effettivo set di dati da testare
     */
    public function get_results($query, $multiple = false) {
        $this->close();
        try {
            if ($multiple) {
                foreach (explode(";", $query) as $stmt) {
                    $this->ris = $this->query($stmt);
                    $dati = $this->ris->fetchAll(PDO::FETCH_OBJ);
                }
            } else {
                $this->ris = $this->query($query);
            }
            $dati = $this->ris->fetchAll(PDO::FETCH_OBJ);
        } catch (PDOException $e) {
            $this->defaultHandler($e,$query);
        }
        return $dati;
    }

    public function get_row($query = "") {
        try {
            if ($query != "") {
                $this->close();
                $this->ris = $this->query($query);
            }
            if (isset($this->ris)) {
                return $this->ris->fetch(PDO::FETCH_OBJ);
            } else
                return false;
        } catch (PDOException $e) {
           $this->defaultHandler($e,$query);
        }
    }

    protected function defaultHandler(PDOException $e, $query) {
        echo "<div id=\"error\">QUERY:<pre>$query</pre></div>";
        echo '<script>$( "#error" ).dialog();</script>';
        throw $e;
    }

    public function __construct($user, $pass, $name, $host, $port = 0) {
        $dsn = "mysql:host=$host;dbname=$name";
        if ($port != 0)
            $dsn.=";port=$port";
        parent::__construct($dsn, $user, $pass);
        $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

}

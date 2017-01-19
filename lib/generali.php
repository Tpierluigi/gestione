<?php

/**
 * Ritorna il tipo di immagine
 * @return String with the value of the field
 * @param estensione istensione del file
 */
function imageType($estensione) {
    switch (strtolower($estensione)) {
        case 'jpg':
        case 'tif':
        case 'png':
        case 'gif':
            return "image.png";
        case 'pdf':
            return "pdf.png";
        case 'doc':
        case 'rtf':
            return "document.png";
        case 'txt':
            return "txt.png";
        case 'html':
            return "html.png";
        default:
            return "unknown.png";
    }
}

function fermete($var, $stop = true) {
    printf("	<hr>\n");
    printf("		<pre>\n");
    print_r($var);
    printf("		</pre>\n");
    printf("	<hr>\n");
    if ($stop)
        die();
}

function bottone($testo, $colore, $fondo, $altro = '') {
    $html = "<div class='vocemenu' style='background-color:$fondo;color:$colore'; border:1px solid $colore;";
    if ($altro != '')
        $html.=" $altro >";
    else
        $html.=">";
    $html.="$testo</div>\n";
    return $html;
}

function limita($val, $min, $max) {
    if ($val < $min)
        $val = $min;
    if ($val > $max)
        $val = $max;
    return $val;
}

function redirect($url) {
    printf("<script language=\"JavaScript\" type=\"text/javascript\">\n");
    printf("	document.location.href='$url';\n");
    printf("</script>\n");
}

function allarme($testo) {
    $text = addslashes($testo);
    printf("<script language=\"JavaScript\" type=\"text/javascript\">alert('$text');</script>");
}

function elencomoduli($dir) {
    if ($handle = opendir($dir)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != ".." && $file != ".svn" && is_dir($dir . '/' . $file)) {
                $moduli[$file]['file'] = $dir . '/' . $file . '/' . $file . '.php';
                $moduli[$file]['descr'] = file_get_contents($dir . '/' . $file . '/info.txt');
            }
        }
        closedir($handle);
        return $moduli;
    }
    return false;
}

function elencoController($dir) {
    $controllers = array();
    $handle = opendir($dir);
    if ($handle) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != ".." && $file != ".svn") {
                if (!is_dir($dir . '/' . $file)) {
                    $controllers[$file] = $dir . '/' . $file;
                }
            }
        }
        closedir($handle);
        return $controllers;
    }
    return false;
}

function stampatitolo($testo) {
    print( "<div class=\"submenu\">$testo</div>\n");
}

function stri_replace($find, $replace, $string) {
    if (!is_array($find))
        $find = array($find);
    if (!is_array($replace)) {
        if (!is_array($find))
            $replace = array($replace);
        else {
            // this will duplicate the string into an array the size of $find
            $c = count($find);
            $rString = $replace;
            unset($replace);
            for ($i = 0; $i < $c; $i++) {
                $replace[$i] = $rString;
            }
        }
    }
    foreach ($find as $fKey => $fItem) {
        $between = explode(strtolower($fItem), strtolower($string));
        $pos = 0;
        foreach ($between as $bKey => $bItem) {
            $between[$bKey] = substr($string, $pos, strlen($bItem));
            $pos += strlen($bItem) + strlen($fItem);
        }
        $string = implode($replace[$fKey], $between);
    }
    return($string);
}

function TrovaPrimoIDLibero($tablename = 'select  ID from apparecchi', $keyname = 'ID') {
    global $db;

    if (!preg_match("/\Aselect*/i", $tablename))
        $tablename = "select $keyname from $tablename";
    $dati = $db->get_results($tablename);
    if (sizeof($dati) > 0) {
        $massimo = $dati[0]->$keyname;
        foreach ($dati as $riga) {
            if ($massimo < $riga->$keyname)
                $massimo = $riga->$keyname;
        }
    } else
        $massimo = 0;
    return $massimo + 1;
}

function SQLparse($val) {
    $retval = stripslashes(str_replace("'", "''", $val));
    return $retval;
}

function ReverseDate($d) {
    $a = explode('-', $d);
    $a = array_reverse($a);
    return implode('-', $a);
}

function creaArrayAssoc(&$dati, $chiave, $valore) {
    foreach ($dati as $riga)
        $risultato[$riga->$chiave] = $riga->$valore;
    return $risultato;
}

function sqlInsert($tabella, $dati) {
    if ((sizeof($dati) == 0) || ($tabella == ""))
        return "";
    $primo = true;
    $sql = "insert into $tabella(";
    foreach ($dati as $riga) {
        if ($riga->valore != "") {
            if ($primo) {
                $sql.=$riga->campo;
                $primo = false;
            } else
                $sql.=",$riga->campo";
        }
    }
    $primo = true;
    $sql.=")values(";
    foreach ($dati as $riga) {
        if ($riga->valore != "") {
            if ($primo) {
                $sql.=$riga->valore;
                $primo = false;
            } else
                $sql.=",$riga->valore";
        }
    }
    $sql.=')';
    return $sql;
}

function sqlUpdate($tabella, $dati, $where) {
    if ((sizeof($dati) == 0) || ($tabella == ""))
        return "";
    $primo = true;
    $sql = "update $tabella set ";
    foreach ($dati as $riga) {
        if ($primo) {
            $sql.="$riga->campo = $riga->valore";
            $primo = false;
        } else
            $sql.=", $riga->campo = $riga->valore";
    }
    $sql.=" where $where";
    return $sql;
}

function sqlQuote($str) {
    return $str != "" ? "'" . $str . "'" : "";
}

/*
  funzioni per il db. NON SONO SAFE PER LE STRINGHE (il controllo deve essere fatto esternamente)!!
 */

function DBSelect($db, $tabella, $campo, $where) {
    $sql = "select $campo from $tabella where $where";
    @$dati = $db->get_row($sql);
    return $dati->$campo;
}

function DBInsert($db, $tabella, $arr) {
    if (is_array($arr)) {
        foreach ($arr as $campo => $valore) {
            $arr[$campo] = $valore;
        }
        $campi = implode(',', array_keys($arr));
        $valori = implode(',', array_values($arr));
        $sql = "insert into $tabella($campi) values $valori ";
        if ($db->query($sql) === false)
            return -1;
        else
            return $db->rows_affected;
    } else
        return -1;
}

function DBUpdate($db, $tabella, $arr, $where) {
    if (is_array($arr)) {
        foreach ($arr as $campo => $valore) {
            $elenco[] = "$campo=$valore";
        }
        $espr = implode(',', $elenco);
        $sql = "update $tabella set $espr where $where";
        if ($db->query($sql) === false)
            return -1;
        else
            return $db->rows_affected;
    } else
        return -1;
}

function DBDelete($db, $tabella, $where) {
    $sql = $db->escape("delete from $tabella where $where ");
    if ($db->query($sql) === false)
        return -1;
    else
        return $db->rows_affected;
}

/**
 * trasforma un risultato ezsql in array associativo, passando il risultato e il nome dei due campi
 * @param $ez_result
 * @param $nomecampochiave
 * @param $nomecampovalore
 * @return unknown_type
 */
function ResultToArray($ez_result, $nomecampochiave, $nomecampovalore) {
    if ($ez_result) {
        foreach ($ez_result as $riga) {
            $arr[$riga->$nomecampochiave] = $riga->$nomecampovalore;
        }
    }
    return $arr;
}

/**
 * trasforma una variabile in una stringa JSON
 * @param mixed $variabile variabile da leggere/serializzare 
 * @return Stringa JSON
 */
function JSON_string($variabile) {
    define("__PADS", 4);
    $val = "";
    static $indent;
    if (is_object($variabile)) {
        // IL FOREACH FUNZIONA SUGLI OGGETTI ESATTAMENTE COME SUGLI ARRAY
        $val.="\n$indent{";
        $indent.=str_pad("", __PADS, " ");
        foreach ($variabile as $nomeproperty => $valoreproperty) {
            $tokens[] = sprintf("\n%s%s : ", $indent, $nomeproperty) . JSON_string($valoreproperty);
        }
        $val.=implode(",", $tokens);
        $indent = substr($indent, 0, strlen($indent) - __PADS);
        $val.="\n$indent}";
    } elseif (is_array($variabile)) {
        //devo controllare se è numerico o associativo; in questo caso mi comporto come con oggetto
        $keys = array_keys($variabile);
        $max_length = count($variabile) - 1;
        if (($keys[0] == 0) and ( $keys[$max_length] == $max_length)) {
            //numerico..
            $val.="\n$indent" . "[";
            $indent.=str_pad("", __PADS, " ");
            foreach ($variabile as $valore) {
                $tokens[] = sprintf("\n%s%s", $indent, JSON_string($valore));
            }
            $val.=implode(",", $tokens);
            $indent = substr($indent, 0, strlen($indent) - __PADS);
            $val.="\n$indent" . "]";
        } else {
            //associativo...
            $val.="\n$indent{";
            $indent.=str_pad("", __PADS, " ");
            foreach ($variabile as $nomeproperty => $valoreproperty) {
                $tokens[] = sprintf("\n%s%s : ", $indent, $nomeproperty) . JSON_string($valoreproperty);
            }
            $val.=implode(",", $tokens);
            $indent = substr($indent, 0, strlen($indent) - __PADS);
            $val.="\n$indent}";
        }
    } elseif (is_string($variabile)) {
        $val = "\"" . addslashes($variabile) . "\"";
    } elseif (is_int($variabile)) {
        $val = $variabile;
    } elseif (is_float($variabile)) {
        $val = $variabile;
    } elseif (is_bool($variabile)) {
        $val = ($variabile ? "true" : "false");
    } elseif (is_null($variabile)) {
        $val = "null";
    } else {
        die("tipo non riconosciuto: GetType ritorna:" . gettype($variabile));
    }

    return $val;
}

/**
 * serve per gestire il notice del PHP che avviene quando si cerca di valutare
 * una variabile non  inizializzata
 * @param type $from    variabile da valutare
 * @param type $default valore da restituire in caso di mancata assegnazione
 */
function setWithDefault(&$from, $default) {
    if (isset($from)) {
        return $from;
    } else {
        return $default;
    }
}

/**
 * serve per gestire il notice del PHP che avviene quando si cerca di valutare
 * un metodo di un oggetto nel quale uno o entrambi non siano inizializzati
 * @param type $obj     oggetto da valutare
 * @param type $prop    metodo/campo da valutare
 * @param type $def     valore da ritornare nel caso il metodo, l'oggetto o entrambi non siano definiti
 */
function getPropertyValue($obj, $prop, $def = "") {
    if (isset($obj) && is_object($obj)) {
        if (isset($obj->$prop)) {
            return $obj->$prop;
        }
    }
    return $def;
}

function NormalizeIP($ip) {
    if ($ip != "") {
        $ip = explode(".", $ip);
        for ($i = 0; $i < 4; $i++)
            $ip[$i] = sprintf("%03d", $ip[$i]);
        $ip = implode(".", $ip);
        return $ip;
    } else {
        return "";
    }
}

function getGlobalVarValue(&$variable, $index, $defaultVal = "") {
    if (isset($variable[$index])) {
        return $variable[$index];
    } else {
        return $defaultVal;
    }
}

?>
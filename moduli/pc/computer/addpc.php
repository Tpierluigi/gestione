<?

  if ($ID>0)
  $nuovoID=$ID;
  else
  $nuovoID=TrovaPrimoIDLibero();

  if ($Tipo>0)
  {
    $i=0;
    $fNote=str_replace("'","''",$fNote);
    $campi[$i]=new stdClass(); $campi[$i]->campo='id';           $campi[$i]->valore=$nuovoID;$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='Tipo';         $campi[$i]->valore=$Tipo;$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='descrizione';  $campi[$i]->valore=sqlQuote($descrizione);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='posizione';    $campi[$i]->valore=sqlQuote($posizione);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='SN';           $campi[$i]->valore=sqlQuote($SN);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='COA';          $campi[$i]->valore=sqlQuote($COA);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='IPaddress';    $campi[$i]->valore=sqlQuote($IP);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='IDrete';       $campi[$i]->valore=sqlQuote($NetID);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='VNCPWD';       $campi[$i]->valore=sqlQuote($passwordVNC);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='AdminPWD';     $campi[$i]->valore=sqlQuote($passwordAdmin);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='UserName';     $campi[$i]->valore=sqlQuote($nomeutente);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='UserPWD';      $campi[$i]->valore=sqlQuote($pwutente);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='commessa';     $campi[$i]->valore=sqlQuote($commessa);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='marca';        $campi[$i]->valore=sqlQuote($marca);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='marcamon';     $campi[$i]->valore=sqlQuote($marcamon);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='modello';      $campi[$i]->valore=sqlQuote($modello);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='modmon';       $campi[$i]->valore=sqlQuote($modmon);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='pollici';      $campi[$i]->valore=sqlQuote($pollici);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='tipomon';      $campi[$i]->valore=sqlQuote($tipomon);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='madre';        $campi[$i]->valore=sqlQuote($madre);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='CPU';          $campi[$i]->valore=sqlQuote($CPU);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='RAM';          $campi[$i]->valore=$RAM;$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='HD';           $campi[$i]->valore=sqlQuote($HD);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='Note';         $campi[$i]->valore=sqlQuote($fNote);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='NomeGruppo';   $campi[$i]->valore=sqlQuote($GroupName);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='TipoGruppo';   $campi[$i]->valore=sqlQuote($GroupType);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='gateway';      $campi[$i]->valore=sqlQuote($GW1);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='gateway2';     $campi[$i]->valore=sqlQuote($GW2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='skrete1';      $campi[$i]->valore=sqlQuote($skrete1);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='skrete2';      $campi[$i]->valore=sqlQuote($skrete2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='skvideo';      $campi[$i]->valore=sqlQuote($skvideo);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='audio';        $campi[$i]->valore=sqlQuote($audio);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='lettore1';     $campi[$i]->valore=sqlQuote($lettore1);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='modlet1';      $campi[$i]->valore=sqlQuote($modlet1);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='lettore2';     $campi[$i]->valore=sqlQuote($lettore2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='modlet2';      $campi[$i]->valore=sqlQuote($modlet2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='IPAddress2';   $campi[$i]->valore=sqlQuote($IP2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='Netmask';      $campi[$i]->valore=sqlQuote($NM);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='Netmask2';     $campi[$i]->valore=sqlQuote($NM2);$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='datainst';     $campi[$i]->valore="CURDATE()";$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='id_aziende';   $campi[$i]->valore=$id_aziende;$i++;
    $campi[$i]=new stdClass(); $campi[$i]->campo='progressivoimpianto';$campi[$i]->valore=$progressivoimpianto;$i++;

    $query=sqlInsert('apparecchi',$campi);
    $db->query($query);


    $verifica=$db->get_row("select id from apparecchi where id=$nuovoID");

    if ($verifica->id==$nuovoID)
    	$successo=1;
    else{
      $successo=3;
      $menubar=new barramenu;
      $menubar->add( "INDIETRO..", "?modulo=sfogliapc&app=PC","");
      $menubar->show();  
		}
	}
  else
  {
    $successo=4;
  }
?>



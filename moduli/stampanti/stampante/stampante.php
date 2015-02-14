<?
if (verificalivello(3))
  {
  $azione=$_GET['azione'];
  $menubar=new barramenu;
  
  if ($_GET['id']!="")
  {
  $id=$_GET['id'];
	
  $dati=$db->get_row("select * from stampanti where id='$id'");
  $sql="select opzionistampanti.id,opzionistampanti.descrizione
    from elencoopzionistampanti inner join opzionistampanti on elencoopzionistampanti.idopzione =
    opzionistampanti.id
    where elencoopzionistampanti.idstampante = '$id'
    ";
	echo $sql;
  $opzioni=$db->get_results($sql);
  }

  
  switch ($azione)    //parte per le azioni
    {
    case "update":
    
        foreach ($_POST as $key => $item)
        {
            $$key=$item;
        }
 
        $i=0;
        $campi[$i]->campo='sn';           $campi[$i]->valore="'$sn'";$i++;
        $campi[$i]->campo='modello';      $campi[$i]->valore=$modello;$i++;
        $campi[$i]->campo='posizione';    $campi[$i]->valore=$posizione;$i++;
        $campi[$i]->campo='firmware';     $campi[$i]->valore="'$firmware'";$i++;

        

        if ($dati) 
            $db->query (sqlUpdate("stampanti",$campi,"id='$id'"));
        else 
            $db->query (sqlInsert("stampanti",$campi));
        $ok=$db->num_queries;
        if ($ok>0)
        {
            $txtstatus="Dati inseriti/aggiornati correttamente";
            $classStatus="statusbar";
        }
        else
        {
            $txtstatus="ERRORE NEL SALVATAGGIO DATI!!!";
            $classStatus="statusbarerr";
        }
        break;
    }

    $posizioni=creaArrayAssoc($db->get_results("select * from elencoposizioni"),"id","descrizione");
    $modelli=creaArrayAssoc($db->get_results("select * from modellistampante"),"id","descrizione");

    
   switch ($azione)     //parte per le visualizzazioni
    {
     case "add":
     
     case "edit" :
     
     case "update":
          $menubar->add("MENU GENERALE","index.php","");
          //$menubar->add("GESTIONE POSIZIONI","index.php?modulo=posizioni&app=stampanti","");
          $menubar->add("TORNA ALLA LISTA","index.php?modulo=sfoglia&app=stampanti","");
          $menubar->add("APPLICA LE MODIFICHE","","document.frmStampante.submit()");
          $menubar->add("MODIFICA LISTA OPZIONI INSTALLATE..","index.php?modulo=listaopzioni&app=stampanti&id=$id","");
      	  $menubar->add("LISTA INTERVENTI PER LA STAMPANTE..","index.php?modulo=listainterventi&app=stampanti&id=$id", "");
          $menubar->show();
          $html=new smartypc;
          stampatitolo( "MODIFICA DATI STAMPANTE" );
          $html->assign('dati',$dati);
          $html->assign('modelli',$modelli);
          $html->assign('posizioni',$posizioni);
          $html->assign('opzioni',$opzioni);
          $html->assign('txtstatus',$txtstatus);
          $html->assign('classStatus',$classStatus);
          $html->display('stampanti/stampante.tpl');
     }
     
   }
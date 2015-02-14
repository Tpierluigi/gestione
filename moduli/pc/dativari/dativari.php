<?
if (verificalivello(3))
	{
  //PARTE PER L'INSERIMENTO, LA MODIFICA E LA VISUALIZZAZIONE DEI COMMENTI
  //recupero e controllo le eventuali variabili in  ingresso dalla form 
  @$azione=$_POST['azione'];
  $id=$_GET['id'];
  $menubar= new barramenu;
  $menubar->add("TORNA ALLA CONFIGURAZIONE","index.php?modulo=computer&app=PC&id=$id","");
  switch ($azione){
    case "" :
      $menubar->add("AGGIORNA LISTA","","eseguiAzione('refresh','frmDatiVari')");
      break;
    case "refresh" :
      $menubar->add("RITORNA ALLA LISTA AGGIORNATA","","eseguiAzione('','frmDatiVari')");
      foreach ($_POST['voce'] as $voce => $valore)
        {
        $presente=$db->get_row("select * from pc_varie where voce=$voce and pc=$id");
        if ($presente)
          $db->query("update pc_varie set valore='$valore' where voce=$voce and pc=$id");
        else  
          $db->query("insert into pc_varie(pc,voce,valore) values ($id,$voce,'$valore')");
        }
      break; 
    }
    
    
    
  $menubar->show();	 
  stampatitolo("DATI ULTERIORI PER LA MACCHINA #$id");
  echo "<form action=\"index.php?modulo=dativari&app=PC&id=$id\" method=\"post\" id=\"frmDatiVari\">\n";
  echo "<input type=\"hidden\" name=\"azione\">\n" ;
  
  
  
  //parte per la visualizzazione. 
  if ($azione=="") 
    include ("list.php");
  if ($azione=="refresh") 
    printf( "  <h2>DATI AGGIORNATI</H2>\n" );
  echo "</form>\n" ;
	}

?>


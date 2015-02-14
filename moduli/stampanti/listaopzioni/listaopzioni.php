<?
if (verificalivello(3))
  {
  @$azione=$_GET['azione'];
  $menu=new barramenu;
  
  if ($_GET['id']!="")
  	 {
  	 $id=(int)$_GET['id'];
  	 }
  
  $record= new DBlink($db);
  $record->AddLink("idopz","idopzione");
  $record->AddLink("idprn","idostampante");
  $record->SetTbl("elencoopzionistampanti");
  $record->SetID(0);
  
  
  
  if ($azione=="")
  	{
    $menu->add("NUOVA OPZIONE","index.php?modulo=listaopzioni&app=stampanti&azione=write","");
    $menu->add("CANCELLA SELEZIONATA","","frmLista.submit();");
	  $menu->add("TORNA A CONFIGURAZIONE STAMPANTE","index.php?modulo=stampante&app=stampanti&id=$id","");
    $menu->show();
    $dati=$db->get_results("
      select *, opzionistampanti.descrizione from elencoopzionistampanti inner join opzionistampanti on
      opzionistampanti.id = elencoopzionistampanti.idopzione where elencoopzionistampanti.idstampante=$id
      ");
    printf( "<form action=\"index.php?app=stampanti&modulo=listaopzioni&azione=confirm\" method=\"post\" name=\"frmLista\">");
    printf( "<div align=\"center\"><div id=\"scroller\">\n" );
    printf( "<table class=\"software\">\n" );
    printf( "<tr><th></th><th>ID</th><th>DESCRIZIONE</th></tr>\n" );
    if (sizeof($dati)>0 )
      {
      $flag=true;
      foreach($dati as $riga)
        {
        $tiporiga=$flag?"pari":"dispari";
        printf( "<tr>");
        printf( " <td class=\"$tiporiga\"><input type=radio name=sel value=\"$riga->idopzione\"></td>\n" );
        printf( " <td class=\"$tiporiga\">$riga->idopzione</td>\n" );
        printf( " <td class=\"$tiporiga\">$riga->descrizione</td>\n" );
        printf( "</tr>\n" );
        $flag=!$flag;
        }
        }
      else
        {
        printf( "<tr><td colspan=6>NESSUNA OPZIONE ASSEGNATA</td></tr>\n" );
        }
      printf( "</table>\n" );
      printf( "</div></div></form>\n" );
    }

  if ($azione=="confirm")
      {
      $sel=(int)$_POST['sel'];
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=listaopzioni","");
      $menu->add("CONFERMA CANCELLAZIONE","","frmEditOpz.submit();");
      $menu->show();
      printf( "      <h3 align=\"center\"> CANCELLARE OPZIONE #$sel ?</h3>     \n" );
      }
  if ($azione=="add")
      {
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=listaopzioni","");
      $menu->add("TORNA AL MENU GENERALE","index.php","");
      $menu->show();
      $fopzione=$_POST['fopzione'];
      $record->SetOpt("add");
      $record->DoSQL();
      echo "<h3 align=\"center\"><b>NOTA:</b> Dati aggiunti correttamente</b></h3>";
      }
  if ($azione=="write")
      {
      $menu->add("ANNULLA","index.php?app=stampanti&modulo=listaopzioni","");
      $menu->add("CONFERMA INSERIMENTO","","frmopzioni.submit();");
      $menu->show();
      printf( "  <form action=\"index.php?app=stampanti&modulo=listaopzioni&azione=add\" name=\"frmopzioni\" method=\"post\">\n" );
      printf( "    <p align=\"center\"> OPZIONE: <input name=\"fopzione\"> </p>\n" );
      printf( "  </form>\n" );
      } 
  if ($azione=="update")
  	 {
     $fopzione=$_POST['fopzione'];
     $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=listaopzioni","");
     $menu->add("TORNA AL MENU GENERALE","index.php","");
     $menu->show();
  	 $record->SetOpt("upd");
  	 $record->SetID($id);
  	 $record->DoSQL();
  	 echo "<h3 align=\"center\"> <b>NOTA:</b> Dati aggiornati correttamente</h3>";
  	 }
  }
?>

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
  $record->AddLink("fposizione","descrizione");
  $record->SetTbl("elencoposizioni");
  $record->SetID(0);
  
  
  
  if ($azione=="")
  	{
    $menu->add("AGGIUNGI POSIZIONE","index.php?modulo=posizioni&app=stampanti&azione=write","");
    $menu->add("MODIFICA SELEZIONATA","","frmListaPos.submit();");
    $menu->show();
    $dati=$db->get_results("select * from elencoposizioni");
    printf( "<form action=\"index.php?app=stampanti&modulo=posizioni&azione=modify\" method=\"post\" name=\"frmListaPos\">");
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
        printf( " <td class=\"$tiporiga\"><input type=radio name=sel value=\"$riga->id\"></td>\n" );
        printf( " <td class=\"$tiporiga\">$riga->id</td>\n" );
        printf( " <td class=\"$tiporiga\">$riga->descrizione</td>\n" );
        printf( "</tr>\n" );
        $flag=!$flag;
        }
        }
      else
        {
        printf( "<tr><td colspan=6>NESSUNA POSIZIONE SPECIFICATA</td></tr>\n" );
        }
      printf( "</table>\n" );
      printf( "</div></div></form>\n" );
    }

  if ($azione=="modify")
      {
      $sel=(int)$_POST['sel'];
      $record->SetID($sel);
      $record->SetOpt("sel");
      $record->DoSQL();
      $menu->add("TORNA ALLA GESTIONE POSIZIONI","index.php?app=stampanti&modulo=posizioni","");
      $menu->add("CONFERMA AGGIORNAMENTO","","frmEditPos.submit();");
      printf( "<p>\n" );
      $menu->show();
      printf( "</p>\n" );
      printf( "<p>\n" );
      printf( "<form name=frmEditPos action=\"index.php?app=stampanti&modulo=posizioni&azione=update&id=$sel\" method=\"post\">\n" );
      printf( "  <div align=\"center\">\n" );
      printf( "    Posizione:<input name=fposizione value=\"$fposizione\">\n" );
      printf( "  </div>\n" );
      printf( "</form>\n" );
      printf( "</p>\n" );
      }
  if ($azione=="add")
      {
      $menu->add("TORNA ALLA GESTIONE POSIZIONI","index.php?app=stampanti&modulo=posizioni","");
      $menu->add("TORNA AL MENU GENERALE","index.php","");
      $menu->show();
      $fposizione=$_POST['fposizione'];
      $record->SetOpt("add");
      $record->DoSQL();
      echo "<h3 align=\"center\"><b>NOTA:</b> Dati aggiunti correttamente</b></h3>";
      }
  if ($azione=="write")
      {
      $menu->add("ANNULLA","index.php?app=stampanti&modulo=posizioni","");
      $menu->add("CONFERMA INSERIMENTO","","frmPosizioni.submit();");
      $menu->show();
      printf( "  <form action=\"index.php?app=stampanti&modulo=posizioni&azione=add\" name=\"frmPosizioni\" method=\"post\">\n" );
      printf( "    <p align=\"center\"> POSIZIONE: <input name=\"fposizione\"> </p>\n" );
      printf( "  </form>\n" );
      } 
  if ($azione=="update")
  	 {
     $fposizione=$_POST['fposizione'];
     $menu->add("TORNA ALLA GESTIONE POSIZIONI","index.php?app=stampanti&modulo=posizioni","");
     $menu->add("TORNA AL MENU GENERALE","index.php","");
     $menu->show();
  	 $record->SetOpt("upd");
  	 $record->SetID($id);
  	 $record->DoSQL();
  	 echo "<h3 align=\"center\"> <b>NOTA:</b> Dati aggiornati correttamente</h3>";
  	 }
  }
?>

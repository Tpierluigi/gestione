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
  $record->AddLink("fmodello","descrizione");
  $record->SetTbl("modellistampante");
  $record->SetID(0);
  
  
  
  if ($azione=="")
  	{
    $menu->add("NUOVO MODELLO","index.php?modulo=modelli&app=stampanti&azione=write","");
    $menu->add("MODIFICA SELEZIONATA","","frmListaMod.submit();");
    $menu->show();
    $dati=$db->get_results("select * from modellistampante");
    printf( "<form action=\"index.php?app=stampanti&modulo=modelli&azione=modify\" method=\"post\" name=\"frmListaMod\">");
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
        printf( "<tr><td colspan=6>NESSUN MODELLO SPECIFICATO</td></tr>\n" );
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
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=modelli","");
      $menu->add("CONFERMA AGGIORNAMENTO","","frmEditMod.submit();");
      printf( "<p>\n" );
      $menu->show();
      printf( "</p>\n" );
      printf( "<p>\n" );
      printf( "<form name=frmEditMod action=\"index.php?app=stampanti&modulo=modelli&azione=update&id=$sel\" method=\"post\">\n" );
      printf( "  <div align=\"center\">\n" );
      printf( "    MODELLO:<input name=fmodello value=\"$fmodello\">\n" );
      printf( "  </div>\n" );
      printf( "</form>\n" );
      printf( "</p>\n" );
      }
  if ($azione=="add")
      {
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=modelli","");
      $menu->add("TORNA AL MENU GENERALE","index.php","");
      $menu->show();
      $fmodello=$_POST['fmodello'];
      $record->SetOpt("add");
      $record->DoSQL();
      echo "<h3 align=\"center\"><b>NOTA:</b> Dati aggiunti correttamente</b></h3>";
      }
  if ($azione=="write")
      {
      $menu->add("ANNULLA","index.php?app=stampanti&modulo=modelli","");
      $menu->add("CONFERMA INSERIMENTO","","frmmodelli.submit();");
      $menu->show();
      printf( "  <form action=\"index.php?app=stampanti&modulo=modelli&azione=add\" name=\"frmmodelli\" method=\"post\">\n" );
      printf( "    <p align=\"center\"> MODELLO: <input name=\"fmodello\"> </p>\n" );
      printf( "  </form>\n" );
      } 
  if ($azione=="update")
  	 {
     $fmodello=$_POST['fmodello'];
     $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=modelli","");
     $menu->add("TORNA AL MENU GENERALE","index.php","");
     $menu->show();
  	 $record->SetOpt("upd");
  	 $record->SetID($id);
  	 $record->DoSQL();
  	 echo "<h3 align=\"center\"> <b>NOTA:</b> Dati aggiornati correttamente</h3>";
  	 }
  }
?>

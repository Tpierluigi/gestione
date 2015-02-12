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
  $record->AddLink("fopzione","descrizione");
  $record->SetTbl("opzionistampanti");
  $record->SetID(0);
  
  
  
  if ($azione=="")
  	{
    $menu->add("NUOVA OPZIONE","index.php?modulo=opzioni&app=stampanti&azione=write","");
    $menu->add("MODIFICA SELEZIONATA","","frmListaOpz.submit();");
    $menu->show();
    $dati=$db->get_results("select * from opzionistampanti");
    printf( "<form action=\"index.php?app=stampanti&modulo=opzioni&azione=modify\" method=\"post\" name=\"frmListaOpz\">");
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
        printf( "<tr><td colspan=6>NESSUNA OPZIONE SPECIFICATA</td></tr>\n" );
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
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=opzioni","");
      $menu->add("CONFERMA AGGIORNAMENTO","","frmEditOpz.submit();");
      printf( "<p>\n" );
      $menu->show();
      printf( "</p>\n" );
      printf( "<p>\n" );
      printf( "<form name=frmEditOpz action=\"index.php?app=stampanti&modulo=opzioni&azione=update&id=$sel\" method=\"post\">\n" );
      printf( "  <div align=\"center\">\n" );
      printf( "    OPZIONE:<input name=fopzione value=\"$fopzione\">\n" );
      printf( "  </div>\n" );
      printf( "</form>\n" );
      printf( "</p>\n" );
      }
  if ($azione=="add")
      {
      $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=opzioni","");
      $menu->add("TORNA AL MENU GENERALE","index.php","");
      $menu->show();
      $fopzione=$_POST['fopzione'];
      $record->SetOpt("add");
      $record->DoSQL();
      echo "<h3 align=\"center\"><b>NOTA:</b> Dati aggiunti correttamente</b></h3>";
      }
  if ($azione=="write")
      {
      $menu->add("ANNULLA","index.php?app=stampanti&modulo=opzioni","");
      $menu->add("CONFERMA INSERIMENTO","","frmopzioni.submit();");
      $menu->show();
      printf( "  <form action=\"index.php?app=stampanti&modulo=opzioni&azione=add\" name=\"frmopzioni\" method=\"post\">\n" );
      printf( "    <p align=\"center\"> OPZIONE: <input name=\"fopzione\"> </p>\n" );
      printf( "  </form>\n" );
      } 
  if ($azione=="update")
  	 {
     $fopzione=$_POST['fopzione'];
     $menu->add("TORNA ALLA LISTA","index.php?app=stampanti&modulo=opzioni","");
     $menu->add("TORNA AL MENU GENERALE","index.php","");
     $menu->show();
  	 $record->SetOpt("upd");
  	 $record->SetID($id);
  	 $record->DoSQL();
  	 echo "<h3 align=\"center\"> <b>NOTA:</b> Dati aggiornati correttamente</h3>";
  	 }
  }
?>

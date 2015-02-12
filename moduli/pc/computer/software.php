<?
print( "										 <div class=titolo>SOFTWARE INSTALLATO</div>		 " );
if ($dati->ID>0)
	 {
	 $elencosw=$db->get_results("SELECT software.ID, software.Descrizione,elencosw.Versione,elencosw.Licenza FROM software INNER JOIN elencosw ON software.ID = elencosw.software WHERE elencosw.computer=$dati->ID");
	 if (sizeof($elencosw)>0)
   	 foreach ($elencosw as $riga)
      {
      if(!$riga->Licenza) 
        $stile="style=\"color:red\""; 
      else 
        $stile="";
     	print( "<div $stile>Cod.$riga->ID : <b>$riga->Descrizione</b> ($riga->Versione)</div>\n" );
	    }
   else
	 		print( "<div align=center>&lt;&lt;&lt;NESSUNO&gt;&gt;&gt;</div>\n" );
	 }
?>

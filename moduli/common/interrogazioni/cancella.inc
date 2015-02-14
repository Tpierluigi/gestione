<?
	 $id=(int)$_POST['idquery'];
	 $link= new DBLink($db);
	 $link->SetTbl("queryutente");
	 $link->SetOpt("del");
	 $link->SetID($id);
	 $link->DoSQL();
   print( "	 <h3 align='center'>Query #$id cancellata</h3>\n" );
   print( "	 <h3 align='center'><a href=\"index.php?modulo=interrogazioni\">aggiorna l'elenco...</a></h3>\n" );
?>
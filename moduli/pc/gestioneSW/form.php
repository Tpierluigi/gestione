<?php
unset($dati);
$dati=$db->get_results("SELECT  * from software order by parent,descrizione");
printf( "<script language=\"JavaScript\" type=\"text/javascript\">\n" );
printf( "<!--\n" );
printf( "  function setcodesw(codice,descr){\n" );
printf( "    document.getElementById('frmSoft').listasoftware.value=codice\n" );
printf( "    document.getElementById('frmSoft').dscsw.value=descr.toString()\n" );
printf( "    }\n" );
printf( "//-->\n" );
printf( "</script>\n" );




printf( "<h3>AGGIUNGI NUOVO SOFTWARE</h3>\n" );
printf( "<p>\n" );


printf( "<div class=\"dtree\">" );

$root=new clsTree;
$root->value="Elenco Software definiti";
$root->id=0;
$root->parent=-1;
foreach ($dati as $riga)
	{
  $riga->Descrizione=urldecode($riga->Descrizione);
  $root->subtree[$riga->ID]=new clsTree;
  $root->subtree[$riga->ID]->id=$riga->ID;
  $root->subtree[$riga->ID]->parent=$riga->parent;
  $root->subtree[$riga->ID]->value=$riga->Descrizione;
  if ($riga->parent)
    $root->subtree[$riga->ID]->link="javascript:setcodesw($riga->ID,\'$riga->Descrizione\')";
  }
$root->dtree_standard(true);	
printf( "</div>" );
printf( "<input type=hidden name=\"listasoftware\">\n" );
printf( "<div class=generico>" );
printf( "<table>\n" );
printf( "  <tr>\n" );
printf( "  <td>\n" );
printf( "SELEZIONATO:</td><td><input type=\"text\" name=\"dscsw\" size=50>\n" );
printf( "  </td>\n" );
printf( "  </tr>\n" );
printf( "  <tr>\n" );
printf( "  <td>\n" );
printf( "VERSIONE:</td><td><input type=\"text\" name=\"fVersione\">\n" );
printf( "  </td>\n" );
printf( "  </tr>\n" );
printf( "  <tr>\n" );
printf( "  <td>\n" );
printf( "LICENZA REGOLARE:</td><td><select name=\"fLicenza\"><option value=0>NO</option><option value=1>SI</option></select>\n" );
printf( "  </td>\n" );
printf( "  </tr>\n" );
printf( "</table>\n" );
printf( "</div>" );
printf( "</p>" );

?>


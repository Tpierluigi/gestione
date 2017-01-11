<?php

require_once("lib/clstree.php");
require_once("lib/generali.php");
/*
function read($xmldoc){
  printf( "  <li><b>$xmldoc->nodeName</b> :  \n" );
  if ($xmldoc->hasChildNodes()) 
    {
    if ($xmldoc->childNodes[0]->nodeName=="#text"||$xmldoc->childNodes[0]->nodeName=="#cdata-section")
		  echo "<i>".$xmldoc->getText()."</i>";
    else
      {
    	$figli =& $xmldoc->childNodes;
    	foreach ($figli as $figlio) 
        {
        printf( "<ul>\n" );
        read($figlio);
        printf( "</ul>\n" );
      	}
      }
    }
  printf("</li>");
  } 
*/


$xmldoc =& new DOMIT_lite_Document();
$success = $xmldoc->loadXML("test.xml");
$tree=new clstree;
$tree->readXMLmonitor($xmldoc->documentElement);
//die ($xmldoc->toNormalizedString(true));
$cont=0;
printf( "<head>\n" );
printf( "  <link rel=\"StyleSheet\" href=\"lib/dtree/dtree.css\" type=\"text/css\" />\n" );
printf( "</head>\n" );
printf( "<body>\n" );
printf( "  <script type=\"text/javascript\" src=\"lib/dtree/dtree.js\"></script>\n" );
//fermete($tree);
$tree->dtree(true,$cont);
printf( "</body>\n" );
?>

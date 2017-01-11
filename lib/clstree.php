<?php
require_once('domit/xml_domit_lite_include.php');

class clsTree
	{
	var $value;
	var $link;
	var $icon;
  var $parent;
	var $subtree;
	function dtree($start=true,& $cont,$parent=-1)
		{
		if ($start)
			{
    	printf( "<div class=\"dtree\">" );
       printf( "<script type=\"text/javascript\">\n" );
      printf( "<!--\n" );
      printf( "\n" );
      printf( "d = new dTree('d');\n" );
      printf( "\n" );
			}
		printf( "d.add($cont,$parent,'$this->value','$this->link',null,null,'$this->icon','$this->icon');\n" );
		$parent=$cont;
		$cont++;
		if (sizeof($this->subtree)>0)
			while ($subtreeitem = & each ($this->subtree)) 
				$subtreeitem['value']->dtree(false,$cont,$parent);
		if ($start)
			{
      printf( "\n" );
      printf( "document.write(d);\n" );
      printf( "\n" );
      printf( "//-->\n" );
      printf( "</script>\n" );
      printf( "</div>\n" );			
			}
		}
	function dtree_standard($start=true)
		{
		if ($start)
			{
    	printf( "<div class=\"dtree\">" );
       printf( "<script type=\"text/javascript\">\n" );
      printf( "<!--\n" );
      printf( "\n" );
      printf( "d = new dTree('d');\n" );
      printf( "\n" );
			}
		printf( "d.add($this->id,$this->parent,'$this->value','$this->link',null,null,'$this->icon','$this->icon');\n" );
		if (sizeof($this->subtree)>0)
			while ($subtreeitem = & each ($this->subtree)) 
				$subtreeitem['value']->dtree_standard(false);
		if ($start)
			{
      printf( "\n" );
      printf( "document.write(d);\n" );
      printf( "\n" );
      printf( "//-->\n" );
      printf( "</script>\n" );
      printf( "</div>\n" );			
			}
		}
  function readXMLmonitor($nodoxml){
    $this->value=$nodoxml->nodeName;
    if ($nodoxml->hasChildNodes()) 
      {
      if ($nodoxml->firstChild->nodeName=="#text"||$nodoxml->firstChild->nodeName=="#cdata-section")
        $this->value.=": ".addslashes(urldecode($nodoxml->firstChild->getText()));
      else
        {
        $cont=0;
      	foreach ($nodoxml->childNodes as $figlio) 
          {
          $this->subtree[$figlio->nodeName."_$cont"]=new clstree;
          $this->subtree[$figlio->nodeName."_$cont"]->readXMLmonitor($figlio);
          $cont++;
          }
        }
      }
    } 

	};
	
?>

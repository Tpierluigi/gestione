<?
class barramenu{
	var $m_sCaptionComandi;
	var $m_sURLComandi;
	var $m_sActionComandi;
	var $m_sSfondo;
	var $m_nComandi;
	function barramenu(){
		$this->m_nComandi=0;
		$this->m_sSfondo="DDDDEE";
		}
	function add($caption,$url,$action)
		{
		$this->m_nComandi++;
		$this->m_sCaptionComandi[]=$caption;
		$this->m_sActionComandi[]=$action;
		$this->m_sURLComandi[]=$url;
		}
	function show()
		{
		printf( "<p><div class=\"barramenu\">\n" );
		//printf ("<img src=\"bottone.php?text=::OPERAZIONI::&s=12&radius=1&bgdcol=ee3300\"> ");


		for($i=0;$i<$this->m_nComandi;$i++)
			{
			
			if ($this->m_sURLComandi[$i]!="")
				printf("<a href=\"".$this->m_sURLComandi[$i]."\">");
      if ($this->m_sActionComandi[$i]!="")  
			  printf (bottone($this->m_sCaptionComandi[$i],'#000099','#ccccff'," onclick=\"".$this->m_sActionComandi[$i]."\""));
      else
        printf (bottone($this->m_sCaptionComandi[$i],'#000099','#ccccff'));
			if ($this->m_sURLComandi[$i]!="")
				printf( "</a>");
			
			}
		printf( "</div></p>\n" );
		}
	};
	
	?>

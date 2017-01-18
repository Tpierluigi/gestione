<?php

$_DIMX=200;

$dati=$db->get_results("SELECT  ID,PC,Documento,Commento,Tipo FROM documenti WHERE PC=$id ");

echo "<table class=\"software\">";
echo "<tr><th></th><th>CLICCARE SULL'IMMAGINE PER INGRANDIRE</th></tr>";
if (!isset($dati)) 
	echo "<tr><td></td><td><h2>NON CI SONO DOCUMENTI</h2></td></tr>";
else 
	{
  foreach ($dati as $riga)
  	{
    switch ($riga->Tipo)
			{
  		case ".jpg" : 
        $nomemin=substr($riga->Documento,0,strlen($riga->Documento)-4)."_t.jpg";
  			if (!file_exists($nomemin))
					{
    			$orig=imagecreatefromjpeg(strtolower($riga->Documento)); 
    			if (!$orig) 
  					die("problemi nel caricamento immagine");
       		$dx=imagesx($orig);
        	$dy=imagesy($orig);
    			//dato che $_DIMX:altezza=$dx:$dy ...
        	$thumb=imagecreate($_DIMX,$_DIMX*$dy/$dx);
       		imagecopyresized($thumb,$orig,0,0,0,0,$_DIMX,$_DIMX*$dy/$dx,$dx,$dy);
    			imagejpeg($thumb,$nomemin,50);break;
  				}
       	echo "<tr>";
        echo "			<td><input type=\"radio\" name=\"codice\" value=\"$riga->ID\"></td>";
        echo "			<td align='center'>";
        echo "					<div class='titolo1'>$riga->Commento</div><nobr>";
        echo "					<a href='$riga->Documento' target='upload'><img src='$nomemin' align='top' alt='$riga->Commento'></a>";
        echo "			</td>";
        echo "</tr>";
				break;
  		default : 
       	echo "<tr>";
        echo "			<td><input type=\"radio\" name=\"codice\" value=\"$riga->ID\"></td>";
        echo "			<td align='center'>";
        echo "					<div class='titolo1'>$riga->Commento</div><nobr>";
        echo "					<a href='$URLuploaddir$riga->Documento' target='upload'><img src='".$imgpath.imageType(substr($riga->Documento,-3))."' align='top' alt='$riga->Commento' border=0></a><br>(MIME Type:$riga->Tipo)";
        echo "			</td>";
        echo "</tr>";
				break;
			}
		}
	}
echo "</table>";
?>
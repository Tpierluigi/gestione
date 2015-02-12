<?php
  Header("Content-type: image/png");
	define ("FONT_PATH","/winnt/fonts/");
  if(!isset($s))  $s=8;
  if(!isset($text))  $text="brainfarm";
  if(!isset($border)) $border=2;
  if(!isset($font))  $font="COMICBD.TTF";
  if(!isset($col))  $col="#FF0000";
  if(!isset($dx))  $dx = 101;
  if(!isset($dy))  $dy = 20;
  if(!isset($t))  $t = 1;  //top
  if(!isset($b))  $b = 1;  //bottom
  if(!isset($l))  $l = 1;  //left
  if(!isset($r))  $r = 1;  //right
  if(!isset($td))  $td = 1; //text 3dim
  if(!isset($hsha))  $hsha = 3; // altezzo ombra 

  $size = imagettfbbox($s,0,FONT_PATH.$font,$text);
	$dxbb=abs($size[2]-$size[0]);
	$dybb=abs($size[5]-$size[3]);
	//die("$dx $dy $dxbb $dybb");
  $xcenter=($dx-$dxbb)/2;
  $ycenter=($dy-$dybb)/2;

  $xpad=9;
  $ypad=9;

  $dx-=$xpad;
  $dy-=$ypad;


  $im = imagecreate($dx+$xpad,$dy+$ypad);

  if (substr($col,0,1)=="#") $col=substr($col, 1);
  $col1 = hexdec(substr($col, 0, 2));
  $col2 = hexdec(substr($col, 2, 2));
  $col3 = hexdec(substr($col, 4, 2));
  $color = ImageColorAllocate($im, $col1,$col2,$col3);
//  $blue = ImageColorAllocate($im, 0x2c,0x6D,0xAF);
//  $black = ImageColorAllocate($im, 0,0,0);
//  $white = ImageColorAllocate($im, 255,255,255);

 $stepWhite1=(255-$col1)/$border;
 $stepWhite2=(255-$col2)/$border;
 $stepWhite3=(255-$col3)/$border;

 $stepBlack1=($col1)/$border;
 $stepBlack2=($col2)/$border;
 $stepBlack3=($col3)/$border;

 $b1=0;
 $b2=0;
 $b3=0;
 for ($i=0;$i!=$border;$i++)
  {
  $b1+=$stepBlack1;
  $b2+=$stepBlack2;
  $b3+=$stepBlack3;
  $black = ImageColorAllocate($im, $b1,$b2,$b3);
  if ($b==1)
   {
   if ($l==1) $x1=$i;    else $x1=0;
   $y1=$dy+$ypad-1-$i;
   if ($r==1) $x2=$dx+$xpad-1-$i; else $x2=$dx+$xpad-1;
   $y2=$dy+$ypad-1-$i;
   ImageLine($im,$x1,$y1,$x2,$y2,$black);
   }
  if ($r==1)
   {
   $x1=$dx+$xpad-1-$i;
   if ($t==1) $y1=$i;    else $y1=0;
   $x2=$dx+$xpad-1-$i;
   if ($b==1) $y2=$dy+$ypad-1-$i; else $y2=$dy+$ypad-1;
   ImageLine($im,$x1,$y1,$x2,$y2,$black);
   }
  }
 $w1=255;
 $w2=255;
 $w3=255;
 for ($i=0;$i!=$border;$i++)
  {
  $w1-=$stepWhite1;
  $w2-=$stepWhite2;
  $w3-=$stepWhite3;
  $white = ImageColorAllocate($im, $w1,$w2,$w3);
  if ($t==1)
   {
   if ($l==1) $x1=$i;    else $x1=0;
   $y1=$i;
   if ($r==1) $x2=$dx+$xpad-1-$i; else $x2=$dx+$xpad-1;
   $y2=$i;
   ImageLine($im,$x1,$y1,$x2,$y2,$white);
   }
  if ($l==1)
   {
   $x1=$i;
   if ($t==1) $y1=$i;    else $y1=0;
   $x2=$i;
   if ($b==1) $y2=$dy+$ypad-1-$i; else $y2=$dy+$ypad-1;
   ImageLine($im,$x1,$y1,$x2,$y2,$white);
   }
  }

  $white = ImageColorAllocate($im, 255,255,255);
  $black = ImageColorAllocate($im, 0,0,0);

  if ($td==1) 
	ImageTTFText($im, $s, 0, (int)($xcenter),(int)($ycenter+$dybb),$black,FONT_PATH.$font, $text);
  ImageTTFText($im, $s, 0, (int)($xcenter),(int)($ycenter+$dybb)-$hsha, $white,FONT_PATH.$font, $text);

 ImagePng($im);
 ImageDestroy($im);
?>

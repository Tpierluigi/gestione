<?php
function settacolore($im,$col)
	{
  if (substr($col,0,1)=="#") $col=substr($col, 1);
  $col1 = hexdec(substr($col, 0, 2));
  $col2 = hexdec(substr($col, 2, 2));
  $col3 = hexdec(substr($col, 4, 2));
  $color = ImageColorAllocate($im, $col1,$col2,$col3);
	return $color;
	}
	
function disegnaforma($im,$xoff,$yoff,$radius,$dx,$dy,$c)
	{
	$xminrec1=$xoff;
	$xmaxrec1=$dx+2*$radius+$xminrec1;
	$yminrec1=$radius+$yoff;
	$ymaxrec1=$yminrec1+$dy;
	
	$xminrec2=$xoff+$radius;
	$xmaxrec2=$dx+$xminrec2;
	$yminrec2=$yoff;
	$ymaxrec2=$yminrec2+$dy+2*$radius;

  imagefilledrectangle($im,$xminrec1,$yminrec1,$xmaxrec1,$ymaxrec1,$c);
  imagefilledrectangle($im,$xminrec2,$yminrec2,$xmaxrec2,$ymaxrec2,$c);

  imagefilledarc($im,$xminrec2,$yminrec1,2*$radius,2*$radius,180,270,$c,IMG_ARC_PIE);
  imagefilledarc($im,$xmaxrec2,$ymaxrec1,2*$radius,2*$radius,0,90,$c,IMG_ARC_PIE);
  imagefilledarc($im,$xmaxrec2,$yminrec1,2*$radius,2*$radius,270,360,$c,IMG_ARC_PIE);
  imagefilledarc($im,$xminrec2,$ymaxrec1,2*$radius,2*$radius,90,180,$c,IMG_ARC_PIE);

	}	
	
Header("Content-type: image/png");
define ("FONT_PATH","/winnt/fonts/");
if(!isset($s))  $s=10;
if(!isset($text))  $text="PROVA PULSANTE";
if(!isset($font))  $font="verdanab.TTF";
if(!isset($bgdcol))  $bgdcol="#FF0000";
if(!isset($shacol))  $shacol="#0f0000";
if(!isset($txtcol))  $txtcol="#0000BB";
if(!isset($radius))  $radius = 4; //raggio smusso
if(!isset($hsha))  $hsha = 2; // altezzo ombra 
if(!isset($deltax))  $deltax= 0;  
if(!isset($deltay))  $deltay= 0;  

$size = imagettfbbox($s,0,FONT_PATH.$font,$text);
$dxbb=abs($size[2]-$size[0]);
$dybb=abs($size[5]-$size[3]);
$xcenter=($dxbb)/2;
$ycenter=($dybb)/2;

$xcenter=(int)$xcenter+1;
$ycenter=(int)$ycenter+1;

$dxbb=$xcenter*2;
$dybb=$ycenter*2;

$im = imagecreate($dxbb+2*$radius+$hsha+$deltax+1,$dybb+2*$radius+$hsha+1+$deltay);

$cTesto = settacolore($im,$txtcol);
$cSfondo = settacolore($im,$bgdcol);
$cOmbra = settacolore($im,$shacol);
$nero = settacolore($im,"#000000");

imagecolortransparent ($im,$nero);
imagefill($im,0,0,$nero);

disegnaforma($im,$deltax+$hsha,$deltay+$hsha,$radius,$dxbb,$dybb,$cOmbra);
disegnaforma($im,$deltax,$deltay,$radius,$dxbb,$dybb,$cSfondo);

ImageTTFText($im, $s, 0, (int)$radius+$deltax,(int)$dybb+$radius+$deltay,$cTesto,FONT_PATH.$font, $text);

ImagePng($im);
ImageDestroy($imm);
?>


<?
echo "<div><b>NUOVO EVENTO</b></div>";
echo "		DATA:<br>";
$datacorr=getdate();$gg=$datacorr['mday'];$mm=$datacorr['mon'];$aa=$datacorr['year'];
echo "<input type=\"text\" size=2 maxlenght=2 name=\"datag\" value=\"$gg\">/";
echo "<input type=\"text\" size=2 maxlenght=2 name=\"datam\" value=\"$mm\">/";
echo "<input type=\"text\" size=4 maxlenght=4 name=\"dataa\" value=\"$aa\"><br>";
echo "		EVENTO:<br><textarea rows=5 cols=40 name=\"evento\"></textarea>";
?>
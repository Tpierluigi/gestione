	<!--- libreria jquery -->
	<link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
		
	<script type="text/javascript" src="lib/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>

	<script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
	<script src="lib/jquery/js/jquery-tinymce.js" type="text/javascript"></script>
	
<?
echo "<div><b>NUOVO EVENTO</b></div>";
echo "		DATA:<br>";
$datacorr=getdate();$gg=$datacorr['mday'];$mm=$datacorr['mon'];$aa=$datacorr['year'];
/*
echo "<input type=\"text\" size=2 maxlenght=2 name=\"datag\" value=\"$gg\">/";
echo "<input type=\"text\" size=2 maxlenght=2 name=\"datam\" value=\"$mm\">/";
echo "<input type=\"text\" size=4 maxlenght=4 name=\"dataa\" value=\"$aa\"><br>";
*/
echo "<input type=\"text\" name=\"dataevt\" id =\"data\" size=10 value=\"$mm/$gg/$aa\" \"><br>";

echo "		EVENTO:<br><textarea id=\"txedit\" rows=5 cols=40 name=\"evento\"></textarea>";
?>
<script> 
	$("#txedit").tinymce({
		theme : "advanced",
		content_css : "lib/tinymce/examples/css/content.css"
		});
	$("#data").datepicker();
	$("#data").datepicker('option', {dateFormat:"dd/mm/yy"});
</script>
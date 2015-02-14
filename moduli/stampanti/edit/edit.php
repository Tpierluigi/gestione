<?

$azione=$_GET['azione'];
if (verificalivello(3))
	{
	switch ($azione)
		{
		case "edit":
			include ("menutop.php");
			include ("form.php");
			break;
		case "add":
			break;
		case "confirm":
			break;
		default:
		 	break;
		}	
	}
?>

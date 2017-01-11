<?php
$usr= strtolower(setWithDefault($_POST["username"], ""));
$pw=  setWithDefault($_POST["password"], "");
$usrpw=md5($usr.$pw);
$riga=$db->get_row("Select ID from utenti where username='$usr' and password='$usrpw'");
$loginFallito=FALSE;
if ($usr){
    if ($riga){
	$val=(string)$riga->ID;
	$_SESSION["id"]=$val;
	redirect("index.php?modulo=mainmenu");
    } else{
  	setcookie("id","");
        $loginFallito=TRUE;
    }
}
?>
<header>
<h1 class="login">GESTIONE PC INDUSTRIALI</h1>
<h2 class="login">AUTORIZZAZIONE INGRESSO</h2>
<h3 class="login">(Premere il tasto 'LOGIN' per entrare come ospite)</h3>
</header>
<div class="content">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-4">
            <form action="index.php?modulo=login&azione=verify" method="post" name="login">
                <div align="center">Username: <input class="form-control text-center" type="text" name="username" placeholder="guest"></div>
                <div align="center">Password: <input class="form-control text-center" type="password" name="password" placeholder="password"></div><br>
                <div align="center">
                    <button class="btn btn-primary" onclick="document.login.submit()">LOGIN</button>
                </div>
                <input style="display: none;" type="submit"> 
            </form>
        </div>
    </div>
</div>
<?php if ($loginFallito): ?>
    <h2 align="center" style="color:red;" > LOGIN FALLITO!</h2>
    <h3 align="center"> ritentare controllando di aver scritto nome e password correttamente</h3>
<?php endif;?>

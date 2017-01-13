
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
    <HEAD>
        <TITLE>Gestione PC e apparecchi industriali v. {$SWver}</TITLE>
        <META http-equiv=Content-Type content="text/html; charset=windows-1252">
        <META content="MSHTML 6.00.2800.1106" name=GENERATOR>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="StyleSheet" href="lib/dtree/dtree.css" type="text/css" />
        <script type="text/javascript" src="lib/dtree/dtree.js"></script>
        <!--- libreria jquery -->
        <script type="text/javascript" src="lib/js/jquery-1.11.2.min.js"></script>
        <!-- jquery UI -->
        <link href="lib/js/jquery-ui/jquery-ui.css" rel="stylesheet" type="text/css"/>
        
        <script src="lib/js/jquery-ui/jquery-ui.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="lib/js/html5shiv.min.js"></script>
          <script src="lib/js/respond.min.js"></script>
        <![endif]-->

        <!-- Bootstrap -->
        <link href="lib/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/css/bootstrap-table.min.css" rel="stylesheet">
        <!-- stili custom sito -->
        <link rel="stylesheet" type="text/css" href="layout/stile.css" media="screen">  
        <link rel="stylesheet" type="text/css" href="layout/schede.css" media="screen">

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="lib/js/bootstrap.min.js"></script>

        {literal}
            <script type="text/javascript" language="javascript">
                function eseguiAzione(val, nomeform)
                {
                    scheda = document.getElementById(nomeform);
                    scheda.azione.value = val;
                    scheda.submit();
                }
            </script>


        {/literal}
    </HEAD>
    <BODY>
        {if $_codusr > 0}
            <div class="container">
                <nav class="navbar  navbar-fixed-top navBlu">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.php?modulo=mainmenu">
                                <img src="icone/logo.png">
                            </a>
                        </div>
                        <div class="collapse navbar-collapse" id="navbar-collapse">
                            <ul class="nav navbar-nav ">

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">GESTIONE PC</A>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="index.php?modulo=sfogliapc&app=PC">Gestione PC</a></li>
                                        <li><a href="index.php?modulo=gestionetipisw&app=PC">Gestione software</a></li>
                                        <li><a href="index.php?modulo=tipifunzione&app=PC">Gestione funzioni</a></li>
                                        <li><a href="index.php?modulo=gestionetipi&app=PC">Gestione tipi apparecchiature</a></li>
                                        <li><a href="index.php?modulo=interrogazioni">Interrogazioni SQL</a></li>
                                        <li><a href="index.php?modulo=doscript">Esecuzione script programma</a></li>
                                    </ul>
                                </LI>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">GESTIONE POSIZIONI </A>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="index.php?modulo=impianti">Gestione impianti</a></li>
                                        <li><a href="index.php?modulo=sedi">Gestione sedi</a></li>
                                        <li><a href="index.php?modulo=paesi">Elenco nazioni</a></li>
                                    </UL>
                                </LI>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">GESTIONE UTENTI</A>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="index.php?modulo=gestioneutenti">Gestione utenti</a></li>
                                        <li><a href="index.php?modulo=cambiopwd">Cambio password</a></li>
                                        <li><a href="index.php?modulo=logout">Logout</a></li>
                                    </UL>
                                </li>
                            </UL>
                            <ul class="nav navbar-nav navbar-right">
                                <small>Gestione PC e apparecchi industriali V.{$SWver}</small>
                                <small> Utente: {$_datiutente->UserName}</small>
                            </UL>
                        </DIV>
                    </div>
                </nav>
            </DIV>
        {/if}  
 





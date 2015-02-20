<!--- libreria jquery -->
<head>
    <link type="text/css" href="lib/jquery/css/ui-lightness/jquery-ui-1.7.2.custom.css" rel="stylesheet" />	
    <script type="text/javascript" src="lib/jquery/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="lib/jquery/js/jquery-ui-1.7.2.custom.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="lib/js/html5shiv.min.js"></script>
      <script src="lib/js/respond.min.js"></script>
    <![endif]-->
    <!-- Bootstrap -->
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="lib/js/bootstrap.min.js"></script>
</head>
<body>
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
</body>
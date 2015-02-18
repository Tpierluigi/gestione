<?php if (verificalivello(3)): ?>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        PC
                    </div>
                    <div class=" panel-body">
                        <ul> 
                            <li><a href="index.php?modulo=sfogliapc&app=PC">Gestione PC</a> 
                            <li><a href="index.php?modulo=gestionetipisw&app=PC">Gestione software</a> 
                            <li><a href="index.php?modulo=tipifunzione&app=PC">Gestione funzionalit&agrave;</a> 
                            <li><a href="index.php?modulo=gestionetipi&app=PC">Gestione tipi apparecchiature</a> 
                            <li><a href="index.php?modulo=interrogazioni">Interrogazioni SQL</a> 
                            <li><a href="index.php?modulo=doscript">Esecuzione script programma</a> 
                        </ul>

                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        CONFIGURAZIONI
                    </div>
                    <div class=" panel-body">
                        <ul> 
                            <li><a href="index.php?modulo=gestioneutenti">Gestione utenti</a> 
                            <li><a href="index.php?modulo=cambiopwd">Cambio password</a>
                            <li><a href="index.php?modulo=logout">Logout</a>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        POSIZIONI E LINEE
                    </div>
                    <div class=" panel-body">
                        <ul> 
                            <li><a href="index.php?modulo=sedi">Gestione Sedi</a> 
                            <li><a href="index.php?modulo=impianti">Gestione Impianti</a> 
                            <li><a href="index.php?modulo=paesi">Paesi</a> 
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>

<?php if (verificalivello(3)): ?>
    <div class="container">
        <div class="page-header">
            MENU PRINCIPALE
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        <div class="panel-title">
                            PC
                        </div>

                    </div>
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
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        <div class="panel-title">
                            CONFIGURAZIONI
                        </div>
                    </div>
                    <ul> 
                        <li><a href="index.php?modulo=gestioneutenti">Gestione utenti</a> 
                        <li><a href="index.php?modulo=cambiopwd">Cambio password</a>
                        <li><a href="index.php?modulo=logout">Logout</a>
                    </ul>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        <div class="panel-title">
                            POSIZIONI E LINEE
                        </div>
                    </div>
                    <ul> 
                        <li><a href="index.php?modulo=sedi">Gestione Sedi</a> 
                        <li><a href="index.php?modulo=impianti">Gestione Impianti</a> 
                        <li><a href="index.php?modulo=paesi">Paesi</a> 
                    </ul>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>

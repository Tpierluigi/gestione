<?php if (verificalivello(3)): ?>
    <table width="100%">
        <tr>
            <td valign=top>
                <fieldset>
                    <legend>PC</legend>
                    <ul> 
                        <li><a href="index.php?modulo=sfogliapc&app=PC">Gestione PC</a> 
                        <li><a href="index.php?modulo=gestionetipisw&app=PC">Gestione software</a> 
                        <li><a href="index.php?modulo=tipifunzione&app=PC">Gestione funzionalit&agrave;</a> 
                        <li><a href="index.php?modulo=gestionetipi&app=PC">Gestione tipi apparecchiature</a> 
                        <li><a href="index.php?modulo=interrogazioni">Interrogazioni SQL</a> 
                        <li><a href="index.php?modulo=doscript">Esecuzione script programma</a> 
                    </ul>
                </fieldset>
            </td>
            <td valign=top>
                <fieldset>
                    <legend>CONFIGURAZIONE</legend>
                    <ul> 
                        <li><a href="index.php?modulo=gestioneutenti">Gestione utenti</a> 
                        <li><a href="index.php?modulo=cambiopwd">Cambio password</a>
                        <li><a href="index.php?modulo=logout">Logout</a>
                    </ul>
                </fieldset>		
            </td>
        </tr>
            <td valign=top>
                <fieldset>
                    <legend>POSIZIONI E LINEE</legend>
                    <ul> 
                        <li><a href="index.php?modulo=sedi">Gestione Sedi</a> 
                        <li><a href="index.php?modulo=impianti">Gestione Impianti</a> 
                        <li><a href="index.php?modulo=paesi">Paesi</a> 
                    </ul>
                </fieldset>		
            </td>
        </tr></table>
<?php endif; ?>

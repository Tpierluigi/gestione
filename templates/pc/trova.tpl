<div class="submenu"> RICERCA COMPUTER </div>
<form action="index.php?modulo=trovapc&app=PC" method="post">
<table rules="cols"  cellspacing="0" width="100%">
<tr>
{foreach from=$campi item=desccampo key=campo}
    <th>
        {$desccampo}
        <select  name="operatori[{$campo}]">
            <option value="">--qualsiasi--</option>
            <option value="=$val">UGUALE</option>
            <option value="like '%$val%'">CONTIENE</option>
        </select>
        <input name="valori[{$campo}]" size=10>
    </th>
{/foreach}
</tr>
<tr><td><input type=submit value=filtra></td></tr>
</table>
</form>

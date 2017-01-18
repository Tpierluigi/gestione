<form action="index.php?modulo=gestionedoc&app=PC&id=$id" method="post" 
      enctype="multipart/form-data" id="frmDocumenti">
    <input type="hidden" name="azione">

    NOME FILE:<br>
    <input type="file" name="Documento" size=50 maxlength=100><br>
    COMMENTO:<br><input type="text" name="commento" size=50 maxlength=100><br><br>
</form>
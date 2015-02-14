{$xajax_javascript}

<p align=center>
<table style="text-align: left; width: 705px; height: 637px;" border="1" cellpadding="0" cellspacing="0">

  <tbody>

    <tr align="center">

      <td style="height: 36px; width: 703px; background-color: rgb(218, 232, 255);"><big style="color: rgb(51, 0, 153);"><span style="font-family: Arial;">CONFIGURAZIONE
MACCHINA</span></big></td>

    </tr>

    <tr>

      <td style="height: 23px; width: 703px;">
      <table style="text-align: left; width: 100%; height: 70px;" border="0" cellpadding="0" cellspacing="0">

        <tbody>

          <tr>

            <td style="border-right: 1px solid gray; border-bottom: 1px solid black; font-family: Arial; color: rgb(204, 0, 0); font-weight: bold; height: 35px; width: 163px; background-color: rgb(255, 255, 255);"><small><img style="width: 174px; height: 22px;" alt="" src="icons/CONF.bmp"><br>

            </small></td>

            <td style="border-bottom: 1px solid black; height: 35px; width: 532px;"><div id ="elenco_configurazioni"></div></td>

          </tr>

          <tr>

            <td style="border-right: 1px solid gray; color: rgb(204, 0, 0); font-family: Arial; font-weight: bold; height: 35px; width: 163px; background-color: rgb(255, 255, 255);"><small><img style="width: 90px; height: 22px;" alt="" src="icons/CAT.bmp"><br>

            </small></td>

            <td style="height: 35px; width: 532px;"><div id ="elenco_tabs"></div></td>

          </tr>

        </tbody>
      </table>

      </td>

    </tr>

    <tr>

      <td style="text-align: top; width: 703px; height: 435px;" id ="elenco_voci">CONTENUTO</td>

    </tr>

    <tr>

      <td style="width: 703px; height: 44px;">
      <table style="text-align: left; width: 701px; height: 51px;" border="1" cellpadding="2" cellspacing="2">

        <tbody>

          <tr>

            <td style="width: 95px;" colspan="1" rowspan="2"><img style="width: 121px; height: 31px;" alt="" src="icons/azioni.bmp"></td>

            <td style="width: 586px;" id ="nuova_voce"></td>

          </tr>

          <tr>


            <td style="height: 32px; width: 586px;" id ="nuova_configurazione"></td>

          </tr>

        </tbody>
      </table>

      </td>

    </tr>

  </tbody>
</table>
</p>
<script>
xajax_renderConfigs({$id_pc});
xajax_handleNewConfig(0,"",{$id_pc});
//xajax_handleNewFeature(0,0,{$id_pc});
xajax_renderSelectedTab({$id_pc});
</script>

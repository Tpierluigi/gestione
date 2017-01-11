<?php
if (verificalivello(2))
		{
    $min=($_GET['pagina']-1)*8;
    $max=($_GET['pagina'])*8;
    $pc=$db->get_results("select ID,SN,Descrizione,IDrete,IPAddress from apparecchi limit $min,$max ",ARRAY_N);
    $tmp=$db->get_results("select ID, Descrizione from software");
    foreach($tmp as $riga)
      $software[$riga->ID]=$riga->Descrizione;
    $j=0;   
    foreach ($pc as $computer)
      {
      $pc[$j][5]=$db->get_results("select * from elencosw where computer=$computer[0]");
      $dim=sizeof($pc[$j][5]);
      for($i=$dim;$i<8;$i++)
        {
        $pc[$j][5][$i]->ID = "0";
        $pc[$j][5][$i]->computer = "0";
        $pc[$j][5][$i]->software = "0";
        $pc[$j][5][$i]->SN = "";
        $pc[$j][5][$i]->Versione = "";
        }
      $j++;
      }

    $html=new smartypc;
    $html->assign("pc",$pc);
    //$html->assign("idpc",$idpc);
    //$html->assign("swxpc",$swxpc);
    $html->assign("software",$software);
    $html->display("utils\gestallsoft.tpl");
    
    }


?>
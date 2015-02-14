# MySQL-Front 3.2  (Build 4.4)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET CHARACTER SET 'latin1' */;

# Host: 10.100.155.3    Database: pc
# ------------------------------------------------------
# Server version 4.1.10a-Debian_2ubuntu0.1-log

CREATE DATABASE `pc` /*!40100 DEFAULT CHARACTER SET latin1 */;USE `pc`;

#
# Table Objects for table adminscript
#

CREATE TABLE `adminscript` (
  `ID` int(11) NOT NULL default '0',
  `Descrizione` varchar(100) default NULL,
  `Testo` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table adminscript
#

INSERT INTO `adminscript` (`ID`,`Descrizione`,`Testo`) VALUES (1,'risistemazione applicativi su finelinea SB','$idlinee=array(16,17,18,19,20,21,23,24,25,26,27,28,29,31,32,33,34,144,163,127,159,157,161);\r\n\r\nfor($k=0;$k<sizeof($idlinee);$k++)\r\n   {\r\n   $linea=$idlinee[$k];\r\n   mssql_query(\"delete from elencosw where computer=$linea\");\r\n   }   \r\nfor($k=0;$k<sizeof($idlinee);$k++)\r\n   {\r\n   $linea=$idlinee[$k];\r\n   mssql_query(\"INSERT INTO ELENCOSW (COMPUTER,SOFTWARE,VERSIONE) VALUES ($linea, 30,\'2.14\')\");\r\n   mssql_query(\"INSERT INTO ELENCOSW (COMPUTER,SOFTWARE,VERSIONE) VALUES ($linea, 58,\'3.0.32\')\");\r\n   mssql_query(\"INSERT INTO ELENCOSW (COMPUTER,SOFTWARE,VERSIONE) VALUES ($linea, 69,\'2000\')\");\r\n   mssql_query(\"INSERT INTO ELENCOSW (COMPUTER,SOFTWARE,VERSIONE) VALUES ($linea, 70,\'2000\')\");\r\n   mssql_query(\"INSERT INTO ELENCOSW (COMPUTER,SOFTWARE,VERSIONE) VALUES ($linea, 71,\'RC11\')\");\r\n   }');
INSERT INTO `adminscript` (`ID`,`Descrizione`,`Testo`) VALUES (2,'Conversione sw win2k','$ris=mssql_query(\"update elencosw set software=70,versione=\'2000\'  where software = 1\");\r\n\r\necho \"righe=\".mssql_rows_affected($conn);');
INSERT INTO `adminscript` (`ID`,`Descrizione`,`Testo`) VALUES (3,'aggiornamento sw vers.indefinita','$ris=mssql_query(\"update elencosw set versione=\'?\' where versione is null\");\r\n\r\necho \"righe=\".mssql_rows_affected($conn);');
INSERT INTO `adminscript` (`ID`,`Descrizione`,`Testo`) VALUES (4,'Migrazione su mysql','$db->query (\"update apparecchi set Datainst=concat(mid(Datainst1,7,4),\'-\',mid(Datainst1,4,2),\'-\',mid(Datainst1,1,2))\");\r\n$db->query (\"update interventi set Data=concat(mid(Data1,7,4),\'-\',mid(Data1,4,2),\'-\',mid(Data1,1,2))\");\r\n$db->query (\"update monitorxml set Data=concat(mid(Data1,7,4),\'-\',mid(Data1,4,2),\'-\',mid(Data1,1,2))\");\r\n$db->query (\"update cronologia set Data=concat(mid(Data1,7,4),\'-\',mid(Data1,4,2),\'-\',mid(Data1,1,2))\");\r\n');
INSERT INTO `adminscript` (`ID`,`Descrizione`,`Testo`) VALUES (5,'sistemazione tabella documenti','$db->query(\"update Documenti set Documento=replace(Documento,\'images/\',\'\')\");\r\n$db->query(\"update Documenti set Documento=replace(Documento,\'docs\\\\\\\\\',\'\')\");\r\n$db->query(\"update Documenti set Documento=replace(Documento,\'images\\\\\\\\\',\'\')\");');

#
# Table Objects for table apparecchi
#

CREATE TABLE `apparecchi` (
  `ID` int(11) NOT NULL default '0',
  `Tipo` int(11) default NULL,
  `Descrizione` varchar(50) default NULL,
  `posizione` varchar(50) default NULL,
  `id_pc_tipifunzione` int(11) default NULL,
  `IPAddress` varchar(20) default NULL,
  `IDrete` varchar(50) default NULL,
  `SN` varchar(50) default NULL,
  `COA` varchar(50) default NULL,
  `Datainst` date default NULL,
  `Datainst1` varchar(20) default NULL,
  `madre` varchar(50) default NULL,
  `VNCPWD` varchar(50) default NULL,
  `CPU` varchar(20) default NULL,
  `RAM` int(11) default NULL,
  `HD` varchar(20) default NULL,
  `marca` varchar(30) default NULL,
  `modello` varchar(50) default NULL,
  `marcamon` varchar(30) default NULL,
  `modmon` varchar(50) default NULL,
  `SNmon` varchar(30) NOT NULL default '',
  `pollici` int(11) default NULL,
  `tipomon` varchar(10) default NULL,
  `skvideo` varchar(50) default NULL,
  `skrete1` varchar(50) default NULL,
  `skrete2` varchar(50) default NULL,
  `skrete3` varchar(50) default NULL,
  `audio` varchar(10) default NULL,
  `lettore1` varchar(50) default NULL,
  `lettore2` varchar(50) default NULL,
  `modlet1` varchar(50) default NULL,
  `modlet2` varchar(50) default NULL,
  `Note` longtext,
  `Utabit` int(11) default NULL,
  `IPAddress2` varchar(50) default NULL,
  `Netmask` varchar(16) default NULL,
  `Netmask2` varchar(16) default NULL,
  `Gateway` varchar(16) default NULL,
  `Gateway2` varchar(16) default NULL,
  `AdminPWD` varchar(50) default NULL,
  `TipoGruppo` char(2) default NULL,
  `NomeGruppo` varchar(50) default NULL,
  `UserName` varchar(50) default NULL,
  `UserPWD` varchar(50) default NULL,
  `id_aziende` int(11) default NULL,
  `progressivoimpianto` int(11) default NULL,
  `commessa` varchar(10) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table apparecchi
#

INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (14,3,'','',1,'172.16.2.4','finelinea34-35','0AITE0YB00028','00003-007-743-230','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,4,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (15,3,'','',1,'172.16.2.18','Finelinea57-sx','0AITE0YB00048','00003-005-472-364','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,21,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (16,3,'','',1,'172.16.2.6','finelinea41-42','','00003-948-914-018','2002-03-28','28/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,7,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (17,3,'','',1,'172.16.2.1','finelinea31','0AITE0YB00017','00003-960-085-976','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'40 Gb (Limitati a 32','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','il PC ha possibilitï¿½ di espansione SOLO per schede ISA',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (18,3,'','',1,'172.16.2.22','Finelinea63-sx','0AITE0YB00029','00003-007-743-234','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,25,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (19,3,'PC etichettatrice avery','Finelinea 46',1,'172.16.2.9','Finelinea 46','0AITE0YB00032','00003-007-743-235','2002-04-15','15/04/2002','ASEM 702','finelinea','AMD K6-2 500',64,'20 GB','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','il Pc ha il LED attività disco continuamente acceso. Dal 29-06 è stato disabilitato VNC per prova',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,11,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (20,3,'','',1,'172.16.2.21','FineLinea63-dx','0AITE0YB00019','00003-960-085-977','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','D-LINK DFE-538TX 10/100','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,25,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (21,3,'PC etichettatrice avery','Finelinea 48',1,'172.16.2.10','Finelinea 48','0AITE0YB00022','00003-948-914-019','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-2 500MHz',64,'20 GB','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,12,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (23,3,'PC etichettatrice avery','Finelinea 60',1,'172.16.2.19','finelinea60','0AITE0YB00023','00003-948-914-016','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,23,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (24,3,'','da Tonegato P',1,'172.16.2.14','finelinea54','0AITE0YB00053','00003-007-743-176','2002-04-15','15/04/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (25,3,'','',1,'172.16.2.16','FineLinea56','0AITE0YB00054','00003-007-743-192','2002-07-19','19/07/2002','ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'40 Gb (limitato a 32','ASEM','VISION 702','','','JC-2144 UMB1',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,20,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (26,3,'','',1,'172.16.2.17','FineLinea57-DX','0AITE0YB00018','00003-960-085-981','2002-03-28','28/03/2002','ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'20 Gb','ASEM','Vision 702','','','0TO-81400404 H02',12,'LCD','INTEGRATA','PCMCIA Avaya (ISA)','','','NO','CD-ROM','','','','montato temporaneamente dissipatore CPU piï¿½ grande del normale - da sostituire al piï¿½ presto',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,21,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (27,3,'PC etichettatrice avery','Finelinea 55',1,'172.16.2.15','FineLinea55','0AITE0YB00057','00003-007-743-189','2002-03-28','28/03/2002','ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'20 Gb','ASEM','Vision 702','','','OMN8400000087',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,19,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (28,3,'','',1,'172.16.2.5','FineLinea39','0AITE0YB00030','00003-007-743-233','2002-05-02','02/05/2002','ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'20 Gb','ASEM','Vision 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,6,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (29,3,'PC etichettatrice avery','Fine linea 53',1,'172.16.2.13','FineLinea53','0AITE0YB00034','00003-007-743-229','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','Il pc ha il lettore floppy rumoroso in quanto la vite di serraggio interna è stata allentata per facilitare la lettura del dischetto\r\n',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,17,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (31,3,'','',1,'172.16.2.7','Finelinea43','0AITE0YB00056','00003-007-743-193','2002-03-28','28/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'30 gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',0,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',13,1,'5012424313');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (32,3,'PC etichettatrice avery','fine linea 65',1,'172.16.2.24','Finelinea65','','00003-005-472-367','2002-03-27','27/03/2002','ASEM 702','finelinea','AMD K6-II 500',64,'30 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,27,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (33,3,'','',1,'','','0AITE0YB00047','00003-005-472-365','2002-07-03','03/07/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',NULL,'','','','','','','','','finelinea','',13,99,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (34,3,'','',1,'172.16.2.20','finelinea61','0AITE0YB00049','00003-005-472-366','2002-07-04','04/07/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','4K50750850',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',NULL,'','255.255.0.0','','','','','','','finelinea','',1,24,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (35,9,'','',1,'172.16.32.92','ne-lotti02','0AITN0YB00004','00019-094-924-217','2002-04-15','15/04/2002','ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','MINIPANEL 702','','','JP21545630',12,'','INTEGRATA','D-LINK DFE 220-P','','','','','','','','Il PC ha il lettore CD difettoso da sostituire',NULL,'','255.255.255.0','','','','rintracciabilitane','W','NE-LOTTI','finelinea','fllottine',11,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (36,3,'','Spagna',1,'','','0AITE0YB00066','00003-005-434-728','2002-04-09','09/04/2002','ASEM 702','','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702 12 pollici','','','',12,'LCD','INTEGRATA','','','','','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',13,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (37,9,'','',2,'172.16.2.60','fardello64','0AIUG1D200006','00019-101-742-846','2002-05-24','24/05/2002','ASEM 801','finelinea','PENTIUM III 800',128,'20 GB','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','AVAYA WIRELESS','INTEGRATA','','','LETTORE CD-ROM','','','','',NULL,'','','','','','','W','SRV-LOTTI','','',1,26,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (38,8,'','Alza Abbassa',6,'172.16.2.101','AlzaAbbassa','0PDFDJ6100013','00019-107-424-317',NULL,NULL,'','alzaabbassa','CELERON 633 MHz',304,'20 Gb','ASEM','TANK','','','4K41006037',15,'CRT','INTEGRATA','INTEGRATA','','','SI','','','','','password utente di default:  sbalzaabbassa',NULL,'','','','','','sanbe','W','SRV-LOTTI','','',1,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (39,8,'','Picking',7,'172.16.2.102','Picking','0PDFDJ6100021','00019-107-424-318',NULL,NULL,'','picking','CELERON 633 MHz',304,'20 Gb','ASEM','TANK','','','311920891884',15,'CRT','INTEGRATA','INTEGRATA','','','SI','LETTORE CD-ROM','','','','password utente di default:  sbpicking',NULL,'','','','','','sanbe','W','SRV-LOTTI','Picking','sbpicking',1,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (80,17,'','Officina Elettrica',NULL,'','','SN81159808','','2005-11-18',NULL,'','','',0,'','','PIA-721','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (97,3,'','officina elettrica',NULL,'','','0AITR09600089','','2005-09-16','16/09/2005 15:07:00','CPU 702','','PENTIUM MMX 233 MHz',64,'20 Gb IDE','ASEM','SPARK TE 10.4','','','',10,'LCD','','','','','','','','','','',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (98,3,'','',NULL,'','','0AITR09600089','','2005-08-30','30/08/2005 9:05:00','ASEM 702','','PENTIUM MMX 233 MHz',64,'40 bg IDE','ASEM','SPARK TE 10.4 (702)','','','',10,'LCD','INTEGRATA','','','','NO','','','','','',NULL,'','','','','','','','','','',7,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (99,9,'','',2,'','Giove66','0AITN0YB00005','00019-094-924-199',NULL,NULL,'ASEM 702','','PENTIUM III 800 MHz',128,'20 Gb','ASEM','MINIPANEL TE 702','','','',12,'LCD','INTEGRATA','','','','NO','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',1,28,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (100,9,'','SIPA 15',NULL,'192.168.0.234','PC_ECS','0AIUI1GC00037','','2005-05-04','04/05/2005 17:38:00','ASEM 801','','PENTIUM III 1 GHz',256,'40 GB IDE','ASEM','VISION 801 15p','','','',15,'LCD','INTEGRATA','INTEGRATA (INTEL 82559)','','','NO','LETTORE FD/CD SLIM','','','','PC registrato da shape; bisogna trovare i pacchetti di installazione e le licenze\r\netichetta COA assente',NULL,'','255.255.252.0','','','','','W','SAN BENEDETTO','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (102,8,'','controllare posizione attuale',8,'172.16.2.51','Stampejolly54','','00003-941-789-785',NULL,NULL,'','sj54','CELERON 633 MHz',128,'20 Gb','ASEM','TANK','','','',15,'CRT','INTEGRATA (SIS630)','INTEGRATA','','','SI','LETTORE CD-ROM','','','','ï¿½ stato installato il SO su una precedente verisione dello stesso. Da reinstallare definitivamente',NULL,'','','','','','','W','SRV-LOTTI','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (103,8,'','',8,'10.100.155.3','Stampejolly49',' OPDFDJ6100022','00003-941-989-787',NULL,NULL,'','sj49','CELERON 633',63,'20 Gb','ASEM','TANK 845S DTP4','','','',15,'CRT','','SIS 900','','','','','','','','',NULL,'','255.255.0.0','','10.100.253.253','','','W','SRV-LOTTI','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (105,8,'','',9,'192.168.1.101','srvlotti','','',NULL,NULL,'','','',0,'','OLIDATA','','','','',0,'','','','','','','','','','','',NULL,'','','','','','','W','SRV-LOTTI','','',13,99,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (107,8,'','',4,'118.1.1.145','VOLL1RD','0PDHGL6300004','00019-082-350-131',NULL,NULL,'','AUTECO','PENTIUM IV 1.8 GHz',512,'20 Gb','ASEM','TANK 845S DTP4','','','',15,'CRT','INTEGRATA','D-LINK DFE 538 tx','','','SI','MASTERIZZATORE','','','','',NULL,'','255.255.0.0','','','','','W','ZONA2','administrator','',9,1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (109,8,'','officina elettrica',4,'','','0PDHGL6300011','00019-082-350-228',NULL,NULL,'','','',0,'','ASEM','TANK','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',1,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (110,8,'','',5,'','','0PDHGL6300002','00019-082-350-140',NULL,NULL,'','','PENTIUM IV 1.8 GHz',512,'','ASEM','TANK 845S DTP4','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',9,1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (111,8,'','',3,'','','0PDHGL6300005','00019-082-350-135',NULL,NULL,'','','PENTIUM IV 1.8 GHz',512,'20','ASEM','845S DTP4','','','',0,'','ATI RADEON 7500','','','','','LETTORE CD-ROM','','','','sembra non esserci un IP statico assegnato',NULL,'','','','','','','','','','',9,1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (112,8,'','',5,'','','0PDHGL6300009','00019-082-350-227',NULL,NULL,'','','',0,'','ASEM','TANK 845S DTP4','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',9,2,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (113,8,'','',3,'','','0PDHGL6300003','00019-082-350-139',NULL,NULL,'','','PENTIUM IV 1.8 GHZ',512,'20 GB','ASEM','TANK 845S DTP4','','','',21,'CRT','ATI RADEON 7000','D-LINK DFE 538 TX','INTEGRATA','','SI','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',9,2,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (114,8,'','',4,'192.168.0.186','DATI61','0PDHGL6300008','00019-099-644-342',NULL,NULL,'','dati','PENTIUM IV 1.8 GHz',512,'40','ASEM','TANK','','','',15,'CRT','SIS 630','SIS 900','d-link dfe 538 tx','','','MASTERIZZATORE 50X','','','','ï¿½ stato installato un programma di raccolta dati nuovo. per usare quelli vecchio (ACKDATI) ï¿½ necessario cambiare le impostazioni dei decimali da , a .\r\npassword per l\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'uscita dal vecchio programma: TREND',NULL,'','255.255.252.0','','','','','W','ASETTICI','','',1,24,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (115,8,'','officina elettrica',5,'','','0PDHGL6300010','00019-082-350-229',NULL,NULL,'ASUS P4S333VF','halle','PENTIUM IV 1.8 GHz',512,'40 GB IDE','ASEM','TANK 845S DTP4','','','',0,'','ATI RADEON 7500','DLINK DFE 538 TX','SIS 900','','SI','LETTORE CD 52X','','','','password boot manager:halle',NULL,'140.80.0.2','','255.255.252.0','','','sb','','','','',1,-1,'5192430105');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (116,9,'','',1,'172.16.32.91','NE-LOTTI01','0AIUG1D200013','00019-101-742-916',NULL,NULL,'ASEM 801','finelinea','Celeron 850 Mhz',128,'20 Gb','Asem','MINIPANEL TE 801','','','',12,'LCD','Integrata','INTEL GD82559R','','','No','CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitane','W','NE-LOTTI','finelinea','fllottine',11,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (117,3,'','SIPA 23',3,'','','0IAUI1GC00028','00019-102-344-275',NULL,NULL,'ASEM 801','','PENTIUM III 1 GHz',256,'40 Gb','ASEM','VISION 801 15p','','','',15,'LCD','INTEGRATA','INTEGRATA','','','','Lettore CD-ROM','','','','',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (118,9,'Pc etichettatrice palette','Gran Guizza - Linea 1',1,'172.16.4.91','po-lotti01','','00019-101-742-844',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (119,9,'Pc etichettatrice palette','Gran Guizza - Linea 2',1,'172.16.4.92','po-lotti02','','00019-101-742-850',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (120,9,'Pc etichettatrice palette','Gran Guizza - Linea 3-4',1,'172.16.4.93','po-lotti03-04','0IAUG1D200011','00019-101-742-915',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (121,9,'Pc etichettatrice palette','Gran Guizza - linea 5',1,'172.16.4.95','po-lotti05','0IAUG1D200010','00019-101-742-917',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,5,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (122,9,'','',1,'172.16.4.96','po-lotti06','0IAUG1D200014','00019-101-742-919',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,6,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (123,9,'Pc etichettatrice palette','Gran Guizza - Finelinea di scorta',1,'172.16.4.90','po-lottiscorta','0IAUG1D200009','00019-101-742-834',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 850 MHz',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','po-lotti','finelinea','',5,43,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (124,9,'','',1,'172.16.5.90','Bi-lotti01','0IAUG1D200012','00019-101-742-914',NULL,NULL,'ASEM 801','fllotti01','',0,'','ASEM','MINIPANEL TE 801','','','',0,'','','','','','','','','','','',NULL,'','255.255.255.0','','','','rintracciabilitabi','','','','',14,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (125,9,'','',1,'172.16.5.92','bi-lotti02','0IAUG1D200008','00019-101-742-842',NULL,NULL,'ASEM 801','fllotti02','',0,'','ASEM','MINIPANEL TE 801','','','',0,'','','','','','','','','','','',NULL,'','255.255.255.0','','','','rintracciabilitabi','','','','',14,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (126,8,'PC scorta picking/alzaabbassa','Officina elettrica',NULL,'','picking/alzaabbassa','0PDFDJ6100027','00003-941-789-795',NULL,NULL,NULL,'','CELERON 633',256,'10 GB','ASEM','TANK','','','',15,'CRT','SIS 630-730','SIS 900','','','SI','LETTORE CD-ROM','','','','Il PC ha due partizioni distinte e su ognuna di queste è stata ripristinata l\'\'\'\'immagine del disco dei PC di picking e alza - abbassa. E\'\'\'\' stato aggiunto poi XOSL boot loader per partire con una o con l\'\'\'\'altra configurazione',NULL,'','','','','','','W','SRV-LOTTI','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (127,3,'','',1,'172.16.2.8','finelinea45','0AITE0YB00033','00003-007-743-228',NULL,NULL,'ASEM 702','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (ISA)','','','NO','CD-ROM','','','','',NULL,'','255.255.0.0','','','','','W','SRV-LOTTI','','',1,10,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (128,9,'','Halle',1,'','','0AIUG1D200004','00019-101-742-853',NULL,NULL,'ASEM 801','','PENTIUM III 850',128,'20 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','INTEGRATA','','','','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',13,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (129,9,'','da qualche parte in officina',NULL,'172.16.5.96','BI-LOTTISCORTA','','','2005-05-24','24/05/2005 12:12:00','ASEM 801','finelinea','CELERON 1.2 GHz',128,'40','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','INTEGRATA (intel GD82559)','','','NO','LETTORE CD-ROM','','','','Il PC è stato acquistato direttamente dalla sede di biella e programmato in remoto',NULL,'','255.255.255.0','','','','rintracciabilitabi','W','BI-LOTTI','finelinea','fllottibi',14,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (134,8,'','',4,'','','0PDEGL6300006','00019-082-350-261',NULL,NULL,'','','PENTIUM IV 1.8 GHz',512,'40 GB IDE','ASEM','TANK 845S DTP4','','','',0,'','INTEGRATA','','','','SI','MASTERIZZATORE CD','','','','',NULL,'','','','','','','','','','',7,1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (135,9,'Pc etichettatrice avery','Donnery - linea 5',1,'','LINE5PL','0IAUG1D300005','00019-056-519-837',NULL,NULL,NULL,'','',0,'','','','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',8,5,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (136,9,'','',1,'','LINE4PL','0IAUG1D300003','00019-056-519-838',NULL,NULL,'ASEM 801','','PENTIUM III 800 MHZ',128,'20','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',8,4,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (137,8,'','',3,'','','0PDEGL6300001','00019-082-350-263',NULL,NULL,'','halle','PENTIUM IV 512 MHz',512,'40 GB IDE','ASEM','TANK 845S DTP4','','','',0,'','','','','','','LETTORE CD 52X','','','','',NULL,'','','','','','sb','','','','',7,2,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (138,8,'','',5,'','','0PDEGL6300004','00019-008-480-140',NULL,NULL,'','halle','PENTIUM IV 512 MHz',512,'40 GB IDE','ASEM','TANK 845S DTP4','','','',0,'','','','','','','LETTORE CD 52X','','','','',NULL,'','','','','','sb','','','','',7,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (139,9,'','',1,'','LINE3PL','0AIUG1D300004','00019-056-519-836',NULL,NULL,'ASEM 801','','PENTIUM III 800 MHZ',128,'20','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',8,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (141,9,'','',1,'','','0AIUG1D300009','00019-094-481-379',NULL,NULL,'','','',0,'','ASEM','MINIPANEL TE 801','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',7,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (142,8,'','',4,'10.100.143.1','ANTINCENDIO','0PMIGH2300001','00019-104-578-078',NULL,NULL,'','','PENTIUM IV 2 GHz',512,'40 GB IDE','ASEM','TANK 845I P4','','','',0,'','ATI RADEON 7500','intel pro 100 VE','','','','LETTORE CD ROM','','','','',NULL,'','255.255.0.0','','10.100.253.253','','','W','SERVIZI','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (143,9,'','',1,'','','0AIUG1D300008','00019-094-481-378',NULL,NULL,'ASEM 801','','PENTIUM III 800 MHz',128,'40 GB IDE','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','','LETTORE CD ROM SLIM','','','','',NULL,'','','','','','','','','','',7,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (144,3,'','',1,'172.16.2.2','FineLinea32','0AITE0YB00055','00003-007-743-190',NULL,NULL,'ASEM 702','finelinea','AMD K6-II 500 MHZ',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (ISA)','','','NO','CD-ROM','','','','',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (145,8,'','',5,'','LINE3SP','0PDEGL6300005','00019-082-350-260',NULL,NULL,'','halle','PENTIUM IV 1.8 GHz',512,'20','ASEM','TANK DTP4','','','',21,'CRT','ATI RADEON 7500','SIS 900 ONBOARD','D-LINK DFE 538-TX','','NO','LETTORE CD-ROM','','','','PASSWORD BOOT MANAGER: halle',NULL,'','','','','','sb','','','','',7,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (146,8,'','',3,'140.80.0.2','LINE_3','0PDEGL6300002','00019-082-350-262',NULL,NULL,'','halle','PENTIUM IV 1.8 GHz',512,'20 Gb','ASEM','TANK 845S DTP4','','','',21,'CRT','ATI RADEON 7500','SIS900 ONBOARD','D-LINK DFE538 TX PCI','','SI','LETTORE CD-ROM','','','','',NULL,'','255.255.252.0','','','','','','','','',7,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (147,8,'','',4,'','','0PDEGL6300003','00019-082-350-264',NULL,NULL,'','','PENTIUM IV 1.8 GHz',512,'20 Gb','ASEM','TANK 845S DTP4','','','',15,'CRT','','','','','','','','','','',NULL,'','','','','','','','','','',7,3,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (148,9,'','',2,'','','0AIUG1D300011','00019-094-481-368',NULL,NULL,'ASEM 801','','',0,'','ASEM','MINIPANEL TE 801','','','',13,'LCD','','','','','','','','','','',NULL,'','','','','','','','','','',7,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (149,9,'','',2,'','','0AIUG1D300006','00019-094-481-367',NULL,NULL,'ASEM 801','','',0,'','ASEM','MINIPANEL TE 801','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',7,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (150,9,'','',2,'','','0IAUG1D300010','00019-094-481-386',NULL,NULL,'ASEM 801','','',0,'','ASEM','MINIPANEL TE 801','','','',13,'LCD','','','','','','','','','','',NULL,'','','','','','','','','','',7,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (151,9,'','',1,'','','0IAUG1D300007','00019-094-481-380',NULL,NULL,'ASEM 801','','',0,'','ASEM','MINIPANEL TE 801','','','',13,'LCD','','','','','','','','','','',NULL,'','','','','','','','','','',7,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (152,8,'','',4,'','','0PDHGL6300007','00019-082-350-137',NULL,NULL,'','','PENTIUM IV 1.8 GHz',512,'20 Gb','ASEM','TANK 845S DTP4','','','',21,'CRT','','','','','','','','','','',NULL,'','','','','','','','','','',7,2,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (153,8,'','',NULL,'192.168.28.201','tappianva','0PDFDJ6100024','00003-941-789-786',NULL,NULL,'','tappianva','celeron 633',64,'20','ASEM','TANK','','','',14,'CRT','sis630','','','','SI','CD-ROM','','','','',NULL,'','','','','','','D','DOMINIOSB','','',13,50,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (154,9,'','',2,'','','0AITN0YB00007','00019-094-924-187',NULL,NULL,'ASEM 702','','AMD K6-II 500',64,'20 Gb','ASEM','MINIPANEL TE 702','','','',13,'TFT','','','','','','','','','','',NULL,'','','','','','','','','','',8,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (155,8,'','',3,'','','0PDHGL6300006','00019-082-350-148',NULL,NULL,'','halle','PENTIUM IV 1.8 GHz',512,'20 Gb','ASEM','TANK 845S DTP4','','','',21,'CRT','','','','','','','','','','',NULL,'','','','','','sb','','','','',7,1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (156,8,'','',3,'192.168.3.16','REPELE16','0PMWGP1300002','00019-107-424-330',NULL,NULL,'ASUS P4S533','','PENTIUM IV 2.4 GHz',512,'20 Gb','ASEM','TANK 845MX MT P4','','','',0,'','ATI RADEON 7500 LE','INTEGRATA','SURECOMM EP320X-S','','SI','','','','','',NULL,'','255.255.252.0','','','','<<ris.ced.>>','D','SB-PRODUCTION','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (157,16,'','',1,'172.16.2.12','Finelinea51-52','R6900703','00019-111-071-935',NULL,NULL,NULL,'finelinea','CELERON 1200 MHz',256,'20 Gb','SIEMENS','PANEL PC-670','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (PCI)','INTEL PRO 100','','Si','CD-ROM','','','','',NULL,'','','','','','','W','SRV-LOTTI','','',1,15,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (158,9,'','Spagna Linea8',2,'','','0AIUG1D300012','00019-105-703-204',NULL,NULL,'ASEM 801','','PENTIUM III 850',256,'20 Gb','ASEM','MINIPANEL TE 801','','','',12,'LCD','INTEGRATA','','','','SI','','','','','',NULL,'','','','','','','','','','',13,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (159,16,'Pc etichettatrice Avery','Finelinea 49 - 50',1,'172.16.2.11','finelinea49-50','RS23797503','00019-111-071-937',NULL,NULL,NULL,'finelinea','CELERON 1200 MHz',256,'20 Gb','SIEMENS','PANEL PC-670','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (PCI)','INTEL PRO 100','','SI','CD-ROM','','','','',NULL,'','','','','','','W','SRV-LOTTI','','',1,13,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (160,9,'','',NULL,'','','0AIUM1F200001','',NULL,NULL,'ASEM 801','','PENTIUM III 850',128,'20 Gb','ASEM','MINIPANEL TE 801 15','','','',15,'LCD','','','','','','','','','','',NULL,'','','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (161,9,'','',1,'172.16.2.23','Finelinea64','3557','00019-110-417-768',NULL,NULL,'','finelinea','PENTIUM III 1 GHZ',256,'40 gb','EvY','Expert pc 312k','','','',12,'LCD','CT69000','PCMCIA Avaya (PCI)','','','INTEGRATA','CD-ROM','','','','- Per il touch screen installare il Rxxx con 1 device\r\n- Il PC ha la porta COM3 che viene rilevata correttamente dal sistema operativo, ma non riesce ad andare in comunicazione',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,26,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (162,3,'','Area stampe jolly imp. 54',8,'172.16.2.51','stampejolly54','0AITE0YB00031','00003-007-743-232',NULL,NULL,'','finelinea','AMD K6-II 500',128,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','D-Link DE-220(ISA)','','','NO','CD-ROM','','','','',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (163,9,'','',1,'172.16.2.3','finelinea33','3790','00019-110-280-123',NULL,NULL,NULL,'finelinea','PENTIUM IV 1 GHZ',256,'30 Gb','EvY','Expert PC 312K','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','INTEL PRO 100+','','SI','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',1,3,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (164,3,'','',8,'172.16.2.50','stampejolly49','0AITE0YB00024','00003-948-914-017',NULL,NULL,'','finelinea','AMD K6-II 500',64,'20 Gb','ASEM','VISION 702','','','',12,'LCD','INTEGRATA','D-LINK DE 220 P','','','NO','CD-ROM','','','','',NULL,'','','','','','','','','','',13,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (165,17,'','',3,'10.101.107.1','POPOLIG1','0AIZ13B200001','',NULL,NULL,NULL,'1011071','PENTIUM IV 1.8 Ghz',512,'40 GB ATA RAID 1','ASEM','MERCURY PB921','','','',20,'LCD','ATI RADEON 7000','INTEGRATA','','','SI','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','','','1011071','W','asettici','operatore','operatore',5,7,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (166,9,'','',1,'','ETPAL1','0AIUG1M300004','00019-112-797-545',NULL,NULL,'ASEM 801','','PENTIUM III 1.2GHZ',256,'40 GB','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','ONBOARD','','','NO','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',8,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (167,9,'PC etichettatrice palette','Donnery - linea 2',1,'','etpal2','0AIUG1M300002','00019-112-797-547',NULL,NULL,'ASEM 801','','PENTIUM III 1.2 GHZ',256,'32 GB','ASEM','MINIPANEL TE 801 - 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','','LETTORE CD-ROM','','','','',NULL,'','','','','','','','','','',8,2,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (168,17,'PC trasporti/scorta linea G Popoli','Popoli - Asettico linea G',5,'10.101.107.2','POPOLIG2','0AIZ13B200003','00019-114-093-159',NULL,NULL,NULL,'popoli','PENTIUM IV 1.8 GHZ',512,'40 GB ATA RAID 1','ASEM','MERCURY PB 921','','','',20,'LCD','ATI RADEON 7000','INTEGRATA','','','SI','','','','','',NULL,'','255.255.0.0','','10.101.0.1','','1011072','W','ASETTICI','operatore','',5,7,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (169,17,'','',4,'10.101.107.3','POPOLIG3','0AIZ13B200004','00019-114-093-160',NULL,NULL,'','1011073','PENTIUM IV 1.8 GHZ',512,'40 GB ATA RAID 1','ASEM','MERCURY PB 921','','','',20,'LCD','ATI RAGE 128','INTEGRATA','','','SI','MASTERIZZATORE','SAMSUNG 48X','','','accelerazione grafica disabilitata per problemi di immagine (si vedono dei punti che sporcano lo schermo)',NULL,'','255.0.0.0','','','','1011073','W','ASETTICI','','',5,7,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (170,8,'','',NULL,'','ericcson','8F31137','',NULL,NULL,NULL,'ericcson','PENTIUM PRO 166 MMX',64,'2 GB su cassetto','Olidata','Alicon-II','','','',0,'','Cirrus GD 5426 ISA','3COM 3C905B-TX','','','NO','Lettore CD-ROM','','','','manca etichetta COA\r\nIP address da richiedere al CED',NULL,'','','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (171,8,'','Magazzino officina elettrica',NULL,'','','0PDAEB6200001','','2000-11-28',NULL,'','','PENTIUM III 733 MHz',128,'10 GB IDE','ASEM','TANK DT BX','','','',0,'','ATI RAGE PRO TURBO','3COM 3C905C PCI','','','NO','LETTORE CD ROM','','','','controllare lettore floppy: non funziona bene',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (177,8,'','',5,'118.1.1.201','SUPERVISORE','0PDPEG7200014','',NULL,NULL,'','','PENTIUM III 1Ghz',128,'20 gb','ASEM','TANK P3','','','',0,'','INTEGRATA (Intel 82815)','3COM 3C905B-TX','','','','LETTORE CD-ROM','','','','Manca  licenza COA.',NULL,'','255.255.0.0','','','','','W','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (178,8,'','',5,'192.168.2.87','LINEA65','0PDPEG7200010','00021-018-213-595',NULL,NULL,'','','PENTIUM III 1 GHz',128,'20 GB','ASEM','TANK','','','',0,'','INTEGRATA (INTEL 82815)','3COM 3C905B-TX PCI','','','','LETTORE CD-ROM 52x','','','','Il PC comunica con un protocollo proprietario OGS',NULL,'','255.255.252.0','','','','','','','','',1,27,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (179,8,'','',5,'172.16.16.42','LINEA61','0PDPEG7200007','00021-018-213-595',NULL,NULL,NULL,'','PENTIUM III 1 GHz',128,'20 GB','ASEM','TANK','','','',0,'','INTEGRATA (INTEL 82815)','3COM 3C905C PCI','','','','LETTORE CD-ROM 52X','','','','',NULL,'','255.255.255.0','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (180,8,'','',NULL,'192.168.2.86','LINEA64','QJ084852','','2005-04-20','20/04/2005 8:54:00',NULL,'supervis','PENTIUM MMX 233',64,'2 Gb IDE','SIEMENS','SCENIC PRO D5 233','','','',0,'','MATROX MISTIQUE INTEGRATA','3COM 3C905B TX PCI','','','NO','LETTORE CD ROM','','','','',NULL,'','255.255.252.0','','','','','W','ASETTICI','administrator','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (181,8,'','',NULL,'','','','',NULL,NULL,'','','80486 dx4 75 Mhz',8,'210 Mb','silicon valley computer','','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',13,99,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (183,8,'','',5,'118.1.1.222','LINEA60','0PTAEF6200059','00021-017-371-797',NULL,NULL,NULL,'','PENTIUM III 800 Mhz',128,'10 GB su cassetto','ASEM','TANK','','','',0,'','ATI RAGE PRO XL','3COM 3c905b PCI','','','','LETTORE CD-ROM 52x','','','','',NULL,'','255.255.0.0','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (184,8,'','',5,'<varia>','<varia>','','',NULL,NULL,'','','Pentium III 1 Ghz',128,'20 Gb','ASEM','TANK','','','',0,'','INTEGRATA (Intel 82815)','3COM 3C905C PCI','Intel PRO 100 S','','NO','Lettore CD-Rom','','','','-Il PC possiede 3 configurazioni hardware differenti a seconda della linea di cui deve fare la raccolta dati\r\n-mancano Numero di serie e 3 etichette COA',NULL,'','','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (185,17,'','',4,'10.101.108.3','POPOLIH3','0AIZ13B200006','00019-131-804-759',NULL,NULL,NULL,'popoli','PENTIUM IV 1.8 GHz',512,'40 GB Rimovibile','ASEM','PB-921','','','',0,'','ATI RADEON VE 7000','INTEL PRO 100/VM','SURECOM EP-32X','','','MAST. CD 52X32X52X','','','','',NULL,'','255.0.0.0','','10.101.0.1','','1011083','','','','',5,8,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (186,17,'','officina elettrica',5,'10.101.108.2','POPOLIH2','0AIZ13B200005','00019-131-804-760',NULL,NULL,'','popoli','PENTIUM IV 1.8GHz',512,'40 Gb Rimovibile','ASEM','PB 921','','','',0,'','ATI RADEON 7000','INTEL PRO 100 VM','','','','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','10.101.0.1','','1011082','','','','',5,8,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (187,17,'','',3,'10.101.108.1','POPOLIH1','0AIZ13B200009','00019-131-804-735',NULL,NULL,NULL,'1011081','PENTIUM IV 1.8 GHz',512,'40 GB SU CASSETTO','ASEM','PB 921','','','',0,'','','INTEL PRO 100 VM','','','','LETTORE CD-ROM','','','','da sistemare password',NULL,'','255.0.0.0','','10.101.0.1','','1011081','','','','',5,8,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (188,8,'','vicino officina meccanica',NULL,'192.168.0.157','SB_LAB','0PDFEF6200002','',NULL,NULL,NULL,'sblab','CELERON 633 Mhz',512,'20 Gb','ASEM','TANK FX DT','','','',15,'LCD','SIS 630','SIS 900','','','NO','LETTORE CD-ROM','','','','Il pc aveva originariamente windows NT. è stata comprata una nuova licenza a windows 2000 (downgrade di XP pro retail)\r\nPassword amministrativa: Administrator',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (189,9,'','',1,'172.16.4.97','po-lotti07','0AIUG1M300005','00019-112-797-544',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 1.2 GHz',256,'30 GB','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','Avaya Wireless (PCI)','INTEL GD82559R NIC','','','LETTORE CD-ROM','','','','',NULL,'10.101.107.7','255.255.255.0','255.255.0.0','','10.101.0.1','rintracciabilitapo','W','po-lotti','finelinea','',5,7,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (190,9,'','',1,'172.16.4.98','po-lotti08','0AIUG1M300006','00019-112-797-543',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 1.2 GHz',256,'30','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEL GD82559R','INTEL GD82559ER','','','LETTORE CD-ROM','','','','',NULL,'10.101.108.7','255.255.255.0','255.255.0.0','10.101.0.1','10.101.0.1','rintracciabilitapo','W','po-lotti','finelinea','',5,8,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (191,17,'','Quadro PLC del Reparto SIPA',3,'10.100.141.1','SILOS-DATI','0AIZ13B200010','00019-118-662-741',NULL,NULL,'BCM BC845-DL','dati','PENTIUM IV 1.8 GHz',512,'40 GB RAID rimovibil','ASEM','PB 921','','','',0,'','ATI RADEON 7000','INTEL PRO 100 VE','3COM 3C905B TX PCI','','','LETTORE CD-ROM','','','','Sk Array Adaptec 2400A - Nome array RAID: silos - Password: silos  -  RMA Z6323',NULL,'192.168.0.129','255.255.0.0','255.255.252.0','','','sanbe','W','PLASTICA','silos','dati',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (192,9,'','stampe jolly',1,'172.16.5.95','ETICHEMERG','0AIUG1D200020','00019-113-515-529',NULL,NULL,'ASEM 801','fllottie','PENTIUM III 850 Mhz',128,'20 GB','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','NITEGRATA','INTEGRATA','','','','LETTORE CD-ROM','','','','Il PC è su un dominio che si chiama DOMINIOAG\r\n',NULL,'','255.255.255.0','','','','srvlotti','','','','',14,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (193,9,'Pc Etichettatrice palette','Fine linea 58',1,'172.16.2.26','Finelinea58','0AIUG1M300003','00019-112-797-546',NULL,NULL,'ASEM 801','finelinea','PENTIUM III 1.2 GHz',256,'30 GB','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','ORINOCO PC-Card - ISA','INTEGRATA','','NO','LETTORE CD-ROM','','','','installati i gommini di protezione HD\r\nil PC ha una doppia parallela',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,22,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (194,8,'','',3,'118.1.1.201','SUPERVISORE','0PDPEG7200013','00021-019-711-851',NULL,NULL,NULL,'','PENTIUM III 1 GHz',128,'20 Gb','ASEM','TANK P3','','','',21,'CRT','INTEGRATA (Intel 82815)','3COM 3C905B-TX','','','','LETTORE CD-ROM','','','','il documento di verbale di collaudo è relativo ad un altra macchina',NULL,'','255.255.0.0','','','','','W','ASETTICI','','',1,28,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (195,8,'','',NULL,'118.1.1.222','LINEA60','0PDPEG7200012','00021-017-371-696','2005-12-21',NULL,'ASUS','','PENTIUM III 1 GHz',128,'40 Gb IDE 2.5 pollic','ASEM','TANK 815E DT','','','',0,'','INTEGRATA','3COM ETHERLINK III PCI','','','si','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','','W','ZONA2','administrator','',13,0,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (196,8,'','',4,'192.168.0.80','DATI66','0PDPEG7200011','00021-019-633-455',NULL,NULL,NULL,'dati','PENTIUM III 1 GHz',128,'20 Gb','ASEM','TANK P3','','','',0,'','','INTEL PRO 100','3COM ETHERLINK PCI','','','','','','','',NULL,'118.1.1.202','255.255.252.0','255.255.0.0','','','','W','ASETTICI','administrator','',1,28,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (198,8,'','',5,'192.168.2.87','LINEA65','0PDNGS6300015','00045-484-014-107','2004-05-07','07/05/2004 7:48:00',NULL,'supervisione','PENTIUM IV 2.8 GHz',512,'40 GB IDE','ASEM','TANK 845 MX DS','','','',0,'','ATI RADEON 7000','SIS 900 ONBOARD','','','SI','LETTORE CD-ROM 52X','','','','PC arrivato con windows XP preinstallato - eseguito downgrade a windows nt',NULL,'','','','','','','','','administrator','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (199,9,'PC Etichettatrice palette','Officina elettrica',1,'','GADAGNE1','0AIUG1M300001','00019-112-797-548','2004-05-20','20/05/2004 10:05:00','ASEM 801','','PENTIUM III 1.2 GHz',256,'40 Gb','ASEM','Minipanel TE 801 12p','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD ROM','','','','',NULL,'','','','','','','','','','',6,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (202,9,'','donnery',2,'','','0AIUF1M300001','00019-118-662-858','2004-06-23','23/06/2004 7:55:00','ASEM 801','fardello','PENTIUM III 1.2 GHz',256,'40 Gb','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD ROM','','','','',NULL,'','','','','','','','','','',13,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (203,9,'','',3,'172.16.2.25','FINELINEA66','0AIUF1M300002','00019-118-662-857','2004-06-24','24/06/2004 8:47:00','ASEM 801','finelinea','PENTIUM III 1.2 GHz',128,'40 Gb','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','INTEGRATA INTEL','','NO','LETTORE CD ROM','','','','Scheda MultiIO NetMos PCI 9835\r\n2 Lpt - 7 Rs232  (Touch Screen su COM5)\r\n',NULL,'','255.255.0.0','','','','','W','SRV-LOTTI','','',1,28,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (204,9,'PC Fardello','Valencia',4,'10.101.108.4','valencia1','0AIUG1M300007','00019-118-662-298','2004-07-01','01/07/2004 16:06:00',NULL,'fardello','PENTIUM III 1.2 GHz',256,'40','ASEM','MINIPANEL TE','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','','','','W','SRV-LOTTI','','',13,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (205,8,'','Officina elettrica (scorta imp63)',NULL,'10.100.125.1/3','DATI63-LINEA63','N00000750/S','00019-107-984-532','2005-05-23','23/05/2005 16:36:00','','1001251|1001253','PENTIUM IV 3 GHz',512,'80 GB IDE','INTERPUTER','assemblato','','','',0,'','integrata (intel 815)','INTEL PRO 100 VE','','','SI','LETTORE CD-ROM 52X','','','','La macchina ï¿½ in dual boot-le impostazioni separate dal | sono specifiche a seconda del boot',NULL,'','255.255.0.0','','10.100.253.253','','1001251|1001253','W','ASETTICI','operatore','operatore',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (206,8,'','',NULL,'','','','','2005-06-16','16/06/2005 8:21:00','','','PENTIUM III 800 MHz',128,'20 gb ide','OLIDATA','assemblato','','','',0,'','ATI RAGE PRO 2','','','','SI','LETTORE CD ROM 52X','','','','',NULL,'','','','','','','','','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (207,8,'','PRESSO AREA STAMPA JOLLY 49',NULL,'172.16.2.50','S-JOLLYEMERG','0PDFDJ6100019','','2005-06-24','24/06/2005 8:00:00','ASUS CUSI FX','finelinea','Celeron 633',64,'20 Gb IDE','ASEM','TANK FX','','','',0,'','INTEGRATA','INTEGRATA','','','SI','LETTORE CD ROM 52x','','','','',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','finelinea','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (208,9,'','',1,'172.16.2.253','FLSCORTA-2','0AIUG1M300009','00019-118-661-913','2004-08-25','25/08/2004 9:15:00','ASEM 801','finelinea','PENTIUM III 1.2 GHz',256,'40 Gb','ASEM','MINIPANEL TE 801 12p','','','',12,'LCD','INTEGRATA','PCMCIA Orinoco (PCI)','INTEGRATA','','NO','LETTORE CD-ROM','','','','Scheda MultiIO NetMos PCI 9835\r\n2 Lpt - 7 Rs232  (Touch Screen su COM5)',NULL,'','255.255.0.0','','','','','W','SRV-LOTTI','','',1,18,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (209,8,'','laboratorio presso impianto asettico 63',4,'192.168.0.209','DATI63-64-65','90581533','','2004-08-31','31/08/2004 9:37:00',NULL,'dati','PENTIUM III 450 Mhz',64,'2 x 20 GB','OLIDATA','WMT17','','','',0,'','CIRRUS GD-5426 ISA','3COM Etherink XL','','','NO','LETTORE CD-ROM','','','','Manca Etichetta COA\r\nPorta COM2 onboard Danneggiata; sostituita con una scheda seriale ISA',NULL,'','255.255.252.0','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (210,17,'','CED',NULL,'192.168.0.17','DATI_POZZI','N000000749/S','00019-136-323-658','2005-05-12','12/05/2005 14:59:00','','pozzi','PENTIUM IV 3 GHz',512,'2x80 GB RAID ATA 100','INTERPUTER','assemblato','','','',0,'','INTEGRATA (INTEL)','Marvell 88E 8001 GbLAN','','','','LETTORE CD ROM 52X','','','','parametri MYSQL:\r\nutente: root - password: cif\r\nutente: PozziSRV - password:server\r\nutente: PozziCLT - password:client\r\nPARAMETRI RAID:\r\ndescrizione: raid dati pozzi\r\nusername: raid-admin\r\npassword: raid',NULL,'','255.255.252.0','','192.168.2.48','','<ass. ced>','D','DOMINIOSB','administrator','',1,-1,'4011700801');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (211,9,'','',1,'172.16.2.254','FLSCORTA-1','0AIUG1M300010','00019-118-661-912','2004-09-14','14/09/2004 12:06:00','ASEM 801','finelinea','PENTIUM III 1.2 GHz',256,'40 GB','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','PCMCIA Avaya (PCI)','INTEL PRO 100','','NO','LETTORE CD SLIM','','','','',NULL,'','255.255.0.0','','','','sanbe','W','SRV-LOTTI','','',1,9,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (212,8,'','',NULL,'10.100.125.150','EFFICIENZA63','HUB4500Q52','00045-543-771-062','2005-06-27','27/06/2005 8:28:00',NULL,'100125150','PENTIUM IV 2.8 GHz',512,'40 GB IDE','HP','DX2000 MT (DZ199T)','','','',0,'','INTEL 82865G INTEGRATA','INTEL PRO 100/VE','','','CON CASSE','LETTORE CD ROM 52X','','','','',NULL,'','255.255.0.0','','10.100.253.253','','100125150','W','ASETTICI','operatore','operatore',1,25,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (213,8,'','Controllo centralino',3,'192.168.3.196','SUP-ERICSSON','0PDFDJ6100014','00019-107-424-355','2004-09-15','15/09/2004 16:10:00',NULL,'aiwa','CELERON 650',128,'20 GB','ASEM','TANK FX DT','','','',0,'','SIS INTEGRATA','3COM 3C905B-TX PCI','','','SI','LETTORE CD-ROM 52X','','','','Questo PC serve temporaneamente per il controllo del vecchio centralino\r\n24/11/2004 account \'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'',NULL,'','255.255.252.0','','','','aiwa','W','servizi','ericsson','aiwa',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (215,9,'','magazzino',2,'','FARDELLO66','0AIUG1M300008','00019-118-661-914','2004-10-01','01/10/2004 14:22:00','ASEM 801','fardello','PENTIUM III 1.2 GHz',64,'40 Gb','ASEM','Minipanel TE 801','','','',12,'LCD','INTEGRATA','INTEL GD82559 integrata','','','NO','LETTORE CD ROM SLIM','','','','',NULL,'','','','','','sanbe','W','fardelli','fardello','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (216,8,'','Officina elettrica',NULL,'','','','','2005-05-16','16/05/2005 8:50:00','','','',0,'','INTERPUTER','','','','',0,'','','','','','','','','','','',NULL,'','','','','','','','','','',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (217,8,'','',NULL,'auto','STAMPEJOLLY','0PDFDJ6100023','00003-941-789-785',NULL,NULL,NULL,'-','CELERON 500~',128,'40GB','ASEM','TANK FX DT','','','',0,'-','SIS630 (integrata)','SIS 900 PCI (integrata)','-','','DISABILITA','LETTORE 52X','-','','','Preparato da Bettin Francesco il 07-10-2004\r\nconsegnata la copia di un cd con:\r\n - immagine pc installato\r\n - driver\r\n - windows98\r\n - microwin 3.2\r\n - Etichettatrice palette 3.1.9\r\n - Manuale eticpal 3.1.0\r\n - Programma plc 3.7.9',NULL,'-','-','-','-','-','-','W','TRACCIABILITA','-','-',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (218,17,'','',5,'10.101.100.1','POPOLISP','0AIZ13B200011','00019-118-661-710','2004-10-22','22/10/2004 9:47:00','','1011001','PENTIUM IV 1.8 GHz',512,'40 GB RAID IDE','ASEM','PB921','','','',0,'','ATI RADEON 7500','INTEL PRO 100 +','','','','LETTORE CD-ROM','','','','PC con multi configurazione per sostituire sia i PC di supervisione che quelli di raccolta dati\r\ngli IP e i nomi dei PC per le due raccolte dati sono gli stessi di quelli dei rispettivi PC posizionati attualmente in linea.\r\nla password per gli array RAID ï¿½: popoli\r\nper lo storage manager pro: user=administrator password:adaptec',NULL,'','255.255.0.0','','10.101.0.1','','1011001','W','asettici','administrator','1011001',5,43,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (219,3,'','',3,'10.103.143.3','CABINE','0AIUH1LM00001','00045-514-064-462','2004-11-26','26/11/2004 10:09:00','ASEM 801','cabine','Pentium III 1.2Ghz',256,'40 GB','Asem','Vision 801','','','',15,'LCD','NVIDIA ALADIN TNT 2','INTEL GD82559ER PCI','-','','NO','CD-ROM TEAC CD-224E','-','','','fornito con licenza di windows xp, ma installato windows 2000 [JYH9R-7MDYT-KVXXX-TDMR9-9C2GG]',NULL,'','255.255.0.0','','','','sanbe','','','administrator','sanbe',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (220,3,'Pc Supervisione carico silos Requena','Officina elettrica',3,'10.110.141.2','SILOS-REQUENA','0AIUI1MM00002','00045-531-404-229','2004-11-26','26/11/2004 10:30:00','ASEM 801','','PENTIUM III 1.2 GHz',256,'40 Gb','ASEM','VISION 801 15 \'\'','','','',15,'LCD','NVIDIA ALADDIN TNT2','INTEL GD82559','','','NO','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','','','','','','administrator','',10,41,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (221,8,'','Uff. Mariottini',NULL,'192.168.32.24','mariottini_f','','','2004-12-10','10/12/2004 12:13:00',NULL,'finelinea','PENTIUM IV 3.0 GHz',512,'40','Olidata','','','','',15,'CRT','?','?','D-LINK DFE538-TX','','SI','Lettore CD-ROM','','','','Inserito, anche se appartiene al CED. Modificato per poter fare la funzione di una stampante jolly\r\n****MANCA LICENZA X OFFICE!!!****',NULL,'172.16.32.99','255.255.255.0','255.255.255.0','192.168.32.251','','bigduemila','D','DOMINIOSB','finelinea','fllottine',11,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (222,8,'','Ufficio di Puglielli',NULL,'172.16.4.99','PO-LOTTIJOLLY','','','2004-12-10','10/12/2004 13:43:00',NULL,'finelinea','PENTIUM II 350 MHz',128,'6','','','','','',15,'CRT','ATI RAGE II 2c','INTEGRATA','','','no','LETTORE CD-ROM','','','','',NULL,'','255.255.255.0','','','','rintracciabilitapo','W','PO-LOTTI','finelinea','',5,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (223,8,'','',NULL,'192.168.0.78','DATI60','0PDPEG7200015','','2005-01-24','24/01/2005 15:55:00','','dati','PENTIUM III 1.0 GHz',192,'20 Gb IDE','ASEM','TANK 815E DT','','','',0,'','INTEGRATA (i815)','3COM 3C905 - TX PCI','','','SI','LETTORE CD 52x','','','','',NULL,'','255.255.255.0','','','','','W','ASETTICI','administrator','',1,23,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (224,8,'','',NULL,'192.168.0.248','ALL_TEC','','','2005-01-31','31/01/2005 13:59:00','','allarmi','',0,'','INTERCOMP/H','','','','',0,'','','','','','','Lettore CD-ROM','','','','preparato come gestione allarmi, poi gestione tecnowatt, poi mai usato.',NULL,'','255.255.252.0','','','','allarmi','D','DOMINIOSB','','',13,0,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (225,8,'','',3,'10.100.125.1','LINEA63','','00019-136-785-717','2005-03-14','14/03/2005 9:05:00',NULL,'1001251','PENTIUM IV',512,'40','INTERPUTER','pc assemblato','','','',0,'','INTEGRATA (intel)','INTEGRATA (INTEL)','','','SI','LETTORE CD-ROM LG 52X','','','','',NULL,'','255.255.0.0','','10.100.253.253','','1001251','W','ASETTICI','operatore','operatore',1,25,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (226,8,'PC Raccolta dati Linea 63 nuovo','Linea 63',4,'10.100.125.3','DATI63','','00019-136-323-657','2005-03-14','14/03/2005 9:06:00',NULL,'1001253','Pentium IV 3GHz',512,'40','INTERPUTER','pc assemblato','','','',0,'','INTEGRATA (intel)','INTEGRATA (intel)','','','SI','LETTORE CD-ROM LG 52x','','','','al PC mancano 2 ventoline di raffreddamento (le aspettiamo da interputer)\r\nuser name mysql:root password:1001253',NULL,'','255.255.0.0','','10.100.253.253','','1001253','W','ASETTICI','operatore','operatore',1,25,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (227,8,'','',NULL,'192.168.0.249','ACQ_DATI','','','2005-04-06','06/04/2005 17:03:00','','bruno','Pentium II 450',192,'20 Gb','INTERCOMP','','','','',0,'','Matrox Millennium II','3COM 3C905B tx','','','NO','','','','','',NULL,'','255.255.252.0','','','','bruno','D','DOMINIOSB','administrator','bruno',1,44,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (228,8,'','Area stampe jolly popoli',NULL,'172.16.4.99','PO-LOTTIJOLLY','','','2005-05-03','03/05/2005 12:32:00',NULL,'finelinea','PENTIUM IV 2.4 GHz',512,'40 GB IDE','ASSEMBLATO','ASSEMBLATO','','','',0,'','NVIDIA TNT2 M64','INTEGRATA (SIS900)','INTEGRATA (SIS900)','','SI','LETTORE CD ROM ASUS 52X','','','','Pc Acquistato direttamente da Gran Guizza - POPOLI',NULL,'10.101.100.7','255.255.255.0','255.255.0.0','','','rintracciabilita','W','PO-LOTTI','finelinea','',5,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (229,6,'','',NULL,'192.168.0.108','STA-PC17','03082168N06','00045-425-054-154','2005-07-29','29/07/2005 11:40:00','','halle','PENTIUM IV-M 1.8 GHz',256,'40 GB','Fujitsu siemens','LIFEBOOK C 1020','','','',15,'LCD','integrata','integrata','','','si','UNITA\' COMBO','','','','il PC ha la batteria che non funziona\r\nConfigurata connessione in ingresso nel modem, utente sb pws sb\r\nsono stati forniti 2 CD con i programmi plc delle linee ed i programmi software etichettatrice palette e danfoss necessari',NULL,'','255.255.252.0','','192.168.2.251','','','D','DOMINOSB','gobbo','gobbo',7,1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (230,8,'','',NULL,'10.100.126.1','LINEA64','','00019-136-880-777','2005-09-26','26/09/2005 10:05:00','ASUS P5GD1-VM','1001261','PENTIUM IV 3 GHZ',512,'40 GB IDE (2.5 polli','assemblato - interputer','ECO SLIM','','','',0,'','INTEGRATA (I815)','INTEL PRO 100 VE','','','SI','LETTORE CD ROM','','','','',NULL,'','255.255.0.0','','10.100.253.253','','1001261','W','ASETTICI','operatore','operatore',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (231,8,'','',NULL,'10.100.126.3','DATI64','','00019-136-880-371','2005-09-26','26/09/2005 15:31:00','ASUS P5GD1-VM','1001263','PENTIUM IV 3 GHz',512,'40 Gb IDE (2.5 polli','assemblato - INTERPUTER','ECO SLIM','','','',0,'','INTEGRATA (I815)','INTEL PRO 100 VE','','','SI','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','10.100.253.253','','1001263','W','ASETTICI','operatore','operatore',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (232,8,'','Magazzino Officina Elettrica',NULL,'10.100.126.1/3','DATI64-LINEA64','','00019-136-880-776','2005-09-26','26/09/2005 16:51:00','ASUS PGD5-VM','','PENTIUM IV 3 GHz',512,'80 Gb S-ATA','Assemblato - INTERPUTER','ECO SLIM','','','',0,'','INTEGRATA (I815)','INTEL PRO 100 VE','','','SI','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','10.100.253.253','','','W','ASETTICI','','',1,-1,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (233,8,'','Officina elettrica',NULL,'10.100.123.1','LINEA60','','00019-196-880-775','2005-09-27','27/09/2005 10:55:00','ASUS P5GD1-VM','1001231','PENTIUM IV 3GHz',512,'40 GB IDE (2.5 polli','assemblato - INTERPUTER','ECO SLIM','','','',0,'','INTEGRATA (I815)','INTEL PRO 100 VE','','','SI','LETTORE CD ROM','','','','',NULL,'','255.255.0.0','','255.255.0.0','','1001231','W','ASETTICI','operatore','operatore',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (234,8,'','Officina elettrica',NULL,'10.100.123.3','DATI60','','','2005-09-27','27/09/2005 11:18:00','ASUS P5GD1-VM','1001233','PENTIUM IV 3 GHz',512,'40 GB IDE (2.5 polli','assemblato - INTERPUTER','ECO SLIM','','','',0,'','INTEGRATA (I815)','INTEL PRO 100 VE','','','SI','LETTORE CD-ROM','','','','',NULL,'','255.255.0.0','','10.100.253.253','','1001233','W','ASETTICI','operatore','operatore',1,-1,NULL);
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (235,17,'','',NULL,'10.120.103.3','LINE3-HMI-RD','0AIUU1N300050','00045-600-955-892','2005-12-13',NULL,'ASEM 801','1201033','PENTIUM III 1.2GHz',512,'40 GB IDE','ASEM','VISION 801 15 POLLICI','','','',15,'LCD','INTEGRATA (TNT2)','INTEL 82559GDR','MODEM','','','LETTORE CD SLIM','','','','',NULL,'DHCP','255.255.0.0','DHCP','','DHCP','1201033','','','operatore','operatore',6,3,'');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (236,17,'','',NULL,'','','0AIZI3A500001','','2006-01-04',NULL,'ROCKY-4786EV-R30','','PENTIUM IV 2.4 GHZ',512,'80 GB SATA RAID','ASEM','PB922I P4','','','',0,'','INTEGRATA','','','','','LETTORE CD ROM','','','','',NULL,'','','','','','','','','','',1,71,'5012500201');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (237,9,'','',NULL,'10.121.103.8','ETICHFARD3','0AIUG1NC00001','00045-590-241-355','2006-01-13',NULL,'ASEM 801-TM','1211038','PENTIUM III 1.2 GHz',256,'40 GB IDE','ASEM','MINIPANEL TE 801 12P','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD SLIM','','','','Fornito all\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'acquirente con modem PCI',NULL,'','255.255.0.0','','','','1211038','','','fardello','',8,3,'5075430301');
INSERT INTO `apparecchi` (`ID`,`Tipo`,`Descrizione`,`posizione`,`id_pc_tipifunzione`,`IPAddress`,`IDrete`,`SN`,`COA`,`Datainst`,`Datainst1`,`madre`,`VNCPWD`,`CPU`,`RAM`,`HD`,`marca`,`modello`,`marcamon`,`modmon`,`SNmon`,`pollici`,`tipomon`,`skvideo`,`skrete1`,`skrete2`,`skrete3`,`audio`,`lettore1`,`lettore2`,`modlet1`,`modlet2`,`Note`,`Utabit`,`IPAddress2`,`Netmask`,`Netmask2`,`Gateway`,`Gateway2`,`AdminPWD`,`TipoGruppo`,`NomeGruppo`,`UserName`,`UserPWD`,`id_aziende`,`progressivoimpianto`,`commessa`) VALUES (238,9,'','',NULL,'10.150.102.7','eticpal2','0AIUE1NM00001','00045-594-852-082','2006-01-23',NULL,'ASEM 801','finelinea','PENTIUM III 1.2 ghz',512,'40 GB IDE','ASEM','VISION 801 12','','','',12,'LCD','INTEGRATA','INTEGRATA','','','NO','LETTORE CD SLIM','','','','',NULL,'','255.255.0.0','','','','1501027','','','finelinea','',15,2,'5105490101');

#
# Table Objects for table aziende
#

CREATE TABLE `aziende` (
  `id_azienda` int(11) NOT NULL default '0',
  `id_paesi` char(2) default NULL,
  `sito` varchar(50) default NULL,
  `netmask` varchar(15) default NULL,
  `gateway` varchar(15) default NULL,
  `gatewayazienda` varchar(15) default NULL,
  PRIMARY KEY  (`id_azienda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table aziende
#

INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (1,'IT','Scorzè','255.255.0.0','192.168.2.48',NULL);
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (3,'IT','Paese','','','192.168.2.251');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (4,'ES','loja','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (5,'IT','Popoli','255.255.0.0','10.101.0.1','192.168.2.251');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (6,'FR','Gadagne','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (7,'DE','Halle','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (8,'FR','Donnery','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (9,'FR','Volvic','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (10,'ES','Requena','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (11,'IT','Nepi','255.255.255.0','192.168.32.251','192.168.2.251');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (12,'ME','Tehuacan','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (13,'IT','Altro','','','');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (14,'IT','Biella','255.255.255.0','192.168.5.251','192.168.2.251');
INSERT INTO `aziende` (`id_azienda`,`id_paesi`,`sito`,`netmask`,`gateway`,`gatewayazienda`) VALUES (15,'PL','Ozorkow','','','');

#
# Table Objects for table cronologia
#

CREATE TABLE `cronologia` (
  `ID` int(11) NOT NULL auto_increment,
  `Apparecchio` int(11) default NULL,
  `data` date default NULL,
  `evento` longtext,
  `data1` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table cronologia
#

INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (20,127,'2002-12-06','Smontato e controllato per malfunzionamento; da spedire in assistenza','06/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (21,116,'2002-12-11','inserito sul finelinea 39 con il programma nuovo','11/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (22,17,'2002-12-11','problemi con il driver di rete (ingolfa il router)','11/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (23,17,'2003-01-07','riprogrammato e rinominato come finelinea31','07/01/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (24,14,'2003-01-07','problemi sulla scheda PCMCIA; portato in officina elettrica','07/01/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (25,17,'2003-01-30','riprogrammato di nuovo e reinstallato tutto causa problemi con MS Word','30/01/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (26,17,'2003-02-06','riprogrammato per andarein ungheria. Aggiornato il SW dell\'etichettatrice palette','06/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (27,103,'2003-01-30','Tolta la scheda Wireless ed inserita una sceda di rete ethernet','30/01/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (28,17,'2003-02-07','tolte wireless e doppia seriale. Sostituito con un modem PCI','07/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (29,28,'2003-02-07','problemi all\'hard disk; reinstallato SO e programmi etichettatrice; il disco NON è stato sostituito.','07/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (30,27,'2003-02-07','spostato su fine linea 55 in seguito a problemi sul rispettivo PC','07/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (31,137,'2003-02-11','spedito ad halle','11/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (32,134,'2003-02-11','spedito ad halle','11/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (33,128,'2003-02-11','da cicrespi','11/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (34,142,'2003-02-13','installati sistema operativo e driver','13/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (35,27,'2003-02-14','portato in officina per aggiunta programma etichettatrice palette','14/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (36,28,'2003-02-14','rimesso in linea sullla relativa postazione. Da trovare i drivers della scheda seriale','14/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (37,143,'2003-02-14','Configurato OS, Office e driver stampanti','14/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (39,27,'2003-02-18','reinstallato OS e applicativi causa problemi con Word','18/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (41,17,'2003-02-20','Controllato il modem e spedito definitivamente il PC in ungheria','20/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (42,14,'2003-02-20','Tolto dalla linea 31 e sostituito sulla linea 56 al posto del finelinea 56 che ha problemi','20/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (49,28,'2003-02-20','Sostituito hard disk con uno usato per le SIPA (1,7 Gb). installato utto il software escluso l\'etichettatrice','20/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (50,37,'2003-02-27','spsotato sull\'etichettatrice fardello linea 66','27/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (51,116,'2003-02-25','Inserito sul finelinea 64','25/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (52,116,'2003-02-28','Ripristinata password VNC','28/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (53,35,'2003-02-26','Inviato in riparazione causa blocco alimentatore','26/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (54,28,'2003-02-25','Inserito sulla linea 39','25/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (55,144,'2003-02-28','Problemi alla scheda PCMCIA','28/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (56,127,'2003-03-03','Tornato da riparazione; sostituiti MB,HDcavi, fatto backup,ventole, check generale e burn-in test','03/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (57,142,'2003-02-26','Prestato a Bernardi come suo PC','26/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (58,115,'2003-03-05','Inserito il modem','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (59,127,'2003-03-11','Installato su Finelinea 66 con il programma di trasferimento etichette nuovo','11/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (61,144,'2003-03-11','Ancora problemi alla scheda PCMCIA; portato in officina elettrica','11/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (62,26,'2003-03-12','installato software nuovo etichettatrice e inserito su linea 53\r\n(prima era finelinea 54/.1.229','12/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (63,21,'2003-03-12','INstallata versione nuova di FlClientGE','12/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (64,25,'2003-03-12','Preparato per finelinea56 con i nuovi programmi di stampa e trasferimento etichette','12/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (65,148,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (66,149,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (67,150,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (68,147,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (69,138,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (70,143,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (71,141,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (72,151,'2003-03-05','Spedito ad halle','05/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (73,124,'2002-12-02','Spedito a Biella','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (74,125,'2002-12-02','Spedito a Biella','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (76,118,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (77,119,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (78,120,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (79,121,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (80,122,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (81,123,'2002-12-02','Spedito a Popoli','02/12/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (83,152,'2003-03-14','Spedito ad Halle','14/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (84,145,'2003-03-14','Spedito ad Halle','14/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (85,146,'2003-03-14','Spedito ad Halle','14/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (86,115,'2003-03-14','Spedito ad Halle','14/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (87,15,'2003-03-28','Portato in officina in seguito a guasto sul video','28/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (88,144,'2003-03-28','Installato come finelinea 32 con i programmi nuovi','28/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (89,14,'2003-03-27','Inserito in linea 54','27/03/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (90,28,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (91,126,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (92,24,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (93,14,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (94,27,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (95,25,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (96,33,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (97,34,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (98,102,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (99,99,'2003-04-01','Aggiornato e reimpostato il programma di trasferimento etichette Marsoft','01/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (100,136,'2003-04-02','Spedito a Volvic','02/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (102,35,'2003-02-26','riparazione (finelinea 64/192.168.1.218)','26/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (103,128,'2003-02-28','Spedito a volvic al posto della sua destinazione originaria (Acqua di nepi)','28/02/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (104,154,'2003-04-11','Tornato da riparazione (ex pc etichettatrice fardello linea 66)','11/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (105,154,'2003-04-12','Configurato per l\\\'invio a Nepi','12/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (106,14,'2003-04-15','cambiato indirizzo IP','15/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (107,15,'2003-04-22','Reinstallato sull\\\'impianto 57 con il software nuovo','22/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (108,16,'2003-04-17','cambiato IP address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (109,18,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (110,19,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (111,20,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (112,21,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (113,23,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (114,24,'2003-04-22','cambiato indirizzo IP','22/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (115,25,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (116,26,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (117,27,'2003-04-17','cambiato indirizzo IP','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (118,31,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (119,32,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (120,33,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (121,34,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (122,36,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (123,127,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (125,29,'2003-04-17','Cambiato IP Address','17/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (126,103,'2003-05-09','Montata una seconda scheda di rete per la gestione della parte wireless e inserito uno sdoppiatore di rete per far comunicare entrambe le schede su un unico cavo','09/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (127,102,'2003-05-09','Impostato l\\\'indirizzo IP in modo da far collegare la macchina alla sottorete wireless. La macchina NON è stata riavviata.','09/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (128,35,'2003-05-05','Ritornato dalla riparazione e riconfigarato come finelinea 64 + programma nuovo','05/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (129,144,'2003-04-13','cambiato IP address','13/04/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (130,35,'2003-05-19','riconfigurato come finelinea 63 sinistro e installato in macchina','19/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (131,153,'2003-05-20','cambiato hard disk e reinstallato ex novo tutto il software','20/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (132,116,'2003-05-23','trovata wireless non funzionante: il problema si è ripristinato staccando e rimettendo la scheda','23/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (133,33,'2003-05-23','sostituita ventola CPU causa guasto','23/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (134,123,'2003-05-26','ritornata da popoli causa mancata costruzione della linea. impiegata sulla linea E in sostituzione dell\\\'etichettatrice originaria che ha problemi.','26/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (135,121,'2003-05-26','inviato in riparazione','26/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (136,123,'2003-05-27','inviata a popoli','27/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (138,39,'2003-05-30','fatto aggiornamento a windows 2000 SP3 ed installati drivers aggiornati, VNC e Word','30/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (139,38,'2003-05-29','fatto aggiornamento a windows 2000 SP3 ed installati drivers aggiornati, VNC e Word','29/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (140,33,'2003-05-29','inviato in riparazione causa schermo LCd che diventava bianco','29/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (141,99,'2003-05-30','reinstallato sistema operativo, software di etichettatura e di trasferimento dati ex-novo','30/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (142,144,'2003-05-30','aggiornato alla nuova versione del software di etichettatura','30/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (143,28,'2003-05-20','Disabilitazione programma di  trasferimento etichette marsoft','20/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (144,24,'2003-05-22','Disabilitazione programma di  trasferimento etichette marsoft','22/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (145,25,'2003-05-22','Disabilitazione programma di  trasferimento etichette marsoft','22/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (146,35,'2003-05-21','Disabilita compattazione dei database all\\\'avvio','21/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (147,35,'2003-06-03','sostituita scheda wireless e inserita al suo posto una scheda di rete fissa.','03/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (148,24,'2003-06-03','ripristinato trasferimento etichette','03/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (149,25,'2003-06-03','ripristinato trasferimento etichette','03/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (150,154,'2003-06-13','preparato con il software aggiornato e inserito temporaneamente in linea 46 a causa del bolcco macchina della stessa. ','13/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (151,154,'2003-06-14','Tolto dalla linea 46 e riportato in officina elettrica','14/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (152,154,'2003-06-05','rinvenuto in officina elettrica in seguito a mancata spedizione','05/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (153,154,'2003-06-16','configurato come linea 66 e messo in impianto temporaneamente','16/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (154,21,'2003-06-13','tolto dalla linea per guasto all\\\'hard disk','13/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (155,21,'2003-06-14','sostituito hard disk, installati programmi e rimesso in linea\r\n','14/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (156,127,'2003-06-17','sostituito hard disk e installata nuova versione applicativi ','17/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (157,19,'2003-06-19','tolto dalla linea 43 ','19/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (158,19,'2003-06-20','inserito in linea 43 con il software nuovo','20/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (159,127,'2003-06-19','inserito in finelinea 43','19/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (160,127,'2003-06-20','sostituito di nuovo hard disk e installati applicativi nuovi','20/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (161,157,'2003-06-23','Configurato con il nuovo software e preparato per la linea 31','23/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (162,157,'2003-06-23','installata biseriale netmos','23/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (163,127,'2003-06-26','preparato per il finelinea 45','26/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (164,156,'2003-06-26','ripristinato SO da precedente immagine HD in quanto l\\\'hard disk originale è stato scambiato con un maxtor','26/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (165,20,'2003-06-26','tolto dalla linea per successiva reinstallazione','26/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (166,127,'2003-06-26','inserito in linea 45\r\n','26/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (167,24,'2003-06-25','Tolto dalla linea per reinstallazione','25/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (168,14,'2002-11-27','riparato hard disk','27/11/2002');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (169,20,'2003-06-27','preparato per il finelinea 63 destro; installata scheda di rete fissa\r\n','27/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (170,24,'2003-06-27','tramite il ghost del pc n°20 è stata ripristata l\\\'istallazione del sistema operativo e dei nuovi applicativi. Il sistema è stato poi configurato per la linea 54','27/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (171,14,'2003-06-30','tolto dalla linea per successiva riprogrammazione','30/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (172,156,'2003-06-30','Inserita scheda RS-485 per controllo PLC','30/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (173,157,'2003-06-25','Installato su finelinea51-52','25/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (175,24,'2003-06-30','Inserito in linea 54. Il VNC non parte automaticamente ed è da sistemare','30/06/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (176,14,'2003-07-02','Inserito in linea 34-35','02/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (177,20,'2003-07-03','Inserito in linea 63-dx. Ha avuto problemi con la connessione di rete. Ho dovuto dare alla connessione di rete fissa l\\\'indirizzo .2.121','03/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (178,34,'2003-07-03','Tolto dalla linea per reinstallazione','03/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (179,18,'2003-07-03','Tolto dalla linea  per reinstallazione','03/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (180,20,'2003-07-04','disabilitato il driver della scheda di rete fissa in quanto in presenza di due schede di rete, il programma FLCLIENTGE non funziona','04/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (181,37,'2003-07-07','tolto dalla linea. Il quadro che conteneva il Pc è caduto a terra e il Pc è gravemente danneggiato','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (182,158,'2003-07-07','Pc acquistato per essere spedito a Donnery. ORa attualmete è impiegato in sostituzione del Pc etichettatrice fardella della linea 66','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (187,34,'2003-07-07','preparato per finelinea 66','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (188,34,'2003-07-07','intallato su finelinea 66\r\n','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (189,154,'2003-07-07','tolto dalla linea e riconfigurato come pc etichettatrice fardello per donnery. Spedito via successivamente','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (190,18,'2003-07-07','Preparato per finelinea63sx','07/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (191,159,'2003-07-08','installati programmi per etichettatrice palette. Bisogna settare la linea di lavoro.','08/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (192,35,'2003-07-08','tolto dalla linea per configurazione e spedizione a nepi','08/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (193,33,'2003-07-08','tornato da riparazione','08/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (194,33,'2003-07-09','preparato per finelinea 60','09/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (195,18,'2003-07-08','Inserito in linea 63 sx. ha avuto problemi a scaricare le etichette\r\n','08/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (197,33,'2003-07-10','causa rottura monitor del Pc su finelinea46, il pc è stato riconfigurato e spostato su quest\'ultima','10/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (198,159,'2003-07-10','Inserito su finelinea 49. Ci sono stati un po\' di problemi con il programma di trasferimento etichette, sistemati settando ad 1 il valore AUTOMATICSEND della chiave HKLM\\software\\atpres\\monclientge','10/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (199,116,'2003-07-01','Trovato con il display spaccato; il PC è comunque funzionante\r\n','01/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (200,142,'2003-07-10','Reinstallato completamente per il test di un OPC server','10/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (201,21,'2003-07-10','Tolto dalla linea e riportato in officina per reinstallazione','10/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (202,23,'2003-07-10','Tolto dalla linea e riportato in officina per reinstallazione','10/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (204,160,'2003-07-14','Staccato dal Box','14/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (205,23,'2003-07-15','inserito in finelinea 60 con i programmi nuovi','15/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (206,31,'2003-07-15','tolto dalla linea per reinstallazione','15/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (207,31,'2003-07-16','preparato per linea 61','16/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (208,31,'2003-07-18','installato sull macchina e tolto via subito causa problemi sul disco','18/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (210,31,'2003-07-21','sostituito hard disk e reinstallati programmi. Preparato per linea 61\r\n','21/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (211,32,'2003-07-22','tolto dalla linea per reinstallazione','22/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (212,31,'2003-07-22','installato in linea','22/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (213,21,'2003-07-17','inviato in riparazione','17/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (214,37,'2003-07-17','inviato in riparazione','17/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (215,116,'2003-07-23','tolto dalla linea per invio in riparazione','23/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (216,32,'2003-07-24','inserito in linea 65 con i programmi nuovi','24/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (217,17,'2003-07-22','Ritornato dall\'ungheria e preparato per test','22/07/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (219,17,'2003-08-05','installato in test sul 57 dx ','05/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (220,36,'2003-08-05','preparata con il programma VECCHIO, testata e mandata in spagna per sostituire la macchina presente in loco','05/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (221,29,'2003-08-06','portato in officina elettrica fino alla fine dei test col pc #17','06/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (224,17,'2003-08-08','riportato in officina elettrica\r\n','08/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (225,29,'2003-08-08','rimesso sul 57 dx\r\n','08/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (226,17,'2003-08-25','installato su finelinea63-sx\r\nha visual basic installato','25/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (229,18,'2003-08-25','riportato in officina ma pronto per essere ripristinato nella sua posizione in caso di problemi.','25/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (230,17,'2003-08-27','riportato in officina elettrica','27/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (231,18,'2003-08-27','ripristinato nella sua posizione originale','27/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (232,162,'2003-08-27','Arivato dalla spagna con le seriali \'rotte\'. Verificata funzionalità seriali ed preparato con gli applicativi per la linea 31','27/08/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (233,162,'2003-09-01','ripreparato con programmi nuovi in test per finelinea 46\r\n','01/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (234,162,'2003-09-01','inserito in linea\r\n','01/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (236,33,'2003-09-04','inserito in linea 41-42 per guasto improvviso del relativo PC','04/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (237,16,'2003-09-04','tolto dalla linea','04/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (238,124,'2003-09-08','ritornato da biella e riprogrammato con il programma nuovo','08/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (239,125,'2003-09-08','ritornato da biella e riprogrammato con il programma nuovo','08/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (240,33,'2003-09-11','sistemato IP address','11/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (241,17,'2003-09-15','installato su finelinea 49-50','15/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (242,159,'2003-09-15','rottura e sostituito dal finelinea 49 -50 -> portato in officina','15/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (243,16,'2003-09-15','Sostittuito Hard disk che presentava  problemi di allocazione con la FAT. Rispristinata immagine del software ed aggiornato il programma di trasferimento alla versione 2.11. Installato sul fine linea 31','15/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (244,17,'2003-09-17','tolto dalla linea in seguito alla rimessa in servizio del PC originale, formattato e ripristinato per la linea 43. In seguito è stato installato sulla linea 43 al posto del Pc presente, che  si sospetta essere lento.','17/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (245,159,'2003-09-17','Al PC sono state resettate le impostazioni del BIOS, caricando LOAD BIOS SETUP dal menu di configurazione BIOS. Il Pc ha ripreso a funzionare ed è stato rimesso in linea.','17/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (246,19,'2003-09-17','Tolto dalla linea. Gli operatori dicono che ha problemi (verificare)','17/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (247,113,'2003-09-17','ritornato dall\'auteco dalla riparazione (era stato spedito precedentemente per la riprogrammazione dell\'hard disk con i loro software)','17/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (248,162,'2003-09-23','tolto dalla linea. Ha problemi vari da verificare.','23/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (249,19,'2003-09-23','Installato in linea 46','23/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (250,128,'2003-09-29','Tornato da volvic, riformattato e reinstallato con il software nuovo, tolta sezione Wi-Fi e spedito in germania con funzione di etichettatore di emergenza palette','29/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (251,162,'2003-09-29','inviato in riparazione ','29/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (252,39,'2003-10-03','INstallato sul picking con i programmi nuovi','03/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (253,99,'2003-10-15','tolto dalla linea per risettaggio per scorta','15/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (254,163,'2003-10-15','installato su finelinea33 (**non funge!!**)','15/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (255,99,'2003-10-17','reinserito in linea 33','17/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (256,163,'2003-10-17','inviato in riparazione','17/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (257,37,'2003-10-27','tornato da riparazione','27/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (258,21,'2003-10-27','Tornato da riparazione e aggiornato a windows 2000','27/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (260,164,'2003-10-27','Tornato dall\'ungheria, aggiornato a 2000, fatto il ghost, configurato come etichettatore di emergenza con scheda fissa','27/10/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (261,17,'2003-11-03','Tolto dalla linea per controllo e burn-in test\r\n','03/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (262,17,'2003-11-07','inviato in riparazione: RMA=Z5065','07/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (263,37,'2003-11-12','installato l\'ambiente di sviluppo per la giove 64','12/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (264,163,'2003-11-26','Tornato dalla riparazione','26/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (265,126,'2003-11-26','tolto dalla linea e sostituito con un PC vision; preparato in configurazione dual-boot con i profili di picking e alza-abbassa','26/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (266,139,'2003-11-28','ritornato da volvic e riconfigurato per donnery','28/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (267,135,'2003-11-28','Arrivato da Volvic e configurato per l\'invio a Donnery','28/11/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (268,99,'2003-12-16','tolto dalla linea 33, preparato con versione nuova applicativi e inserito su finelinea 39','16/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (269,28,'2003-12-16','TOLTO DALLA LINEA PER UPGRADE A WIN2K','16/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (270,17,'2003-12-17','ritornato da riparazione\r\n','17/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (271,20,'2003-12-17','Aggiornato a windows 2000 con i programmi di etichettatura nuovi','17/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (272,18,'2003-12-17','Aggiornato a windows 2000 con i programmi di etichettatura nuovi','17/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (273,34,'2003-12-17','Aggiornato a Windows 2000 con i programmi nuovi','17/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (275,31,'2003-12-18','tolto dalla linea per problemi su disco: sostituito hard disk e installato windows 2000 con software nuova versione','18/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (276,18,'2003-12-18','sistemata seriale NETMOS','18/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (277,16,'2003-12-18','aggiornato a windows 2000 e installate ultime versioni programmi di etichettatura','18/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (278,27,'2003-12-18','sistemato lettore badge ','18/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (279,25,'2003-12-23','ripristinato finelinea con gli applicativi nuova versione e windows 2000 professional','23/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (280,24,'2003-12-23','Aggiornato a Windows 2000 con le nuove versioni dei programmi','23/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (281,135,'2003-12-03','inviato a donnery','03/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (282,167,'2003-12-03','Inviato a a Donnery','03/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (283,166,'2004-01-07','Inviato a a Donnery','07/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (284,136,'2003-12-03','tornato da volvic e inviato a a Donnery','03/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (285,139,'2003-12-03','Inviato a a Donnery','03/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (286,144,'2004-01-16','Aggiornato a Windows 2000 con i programmi nuovi','16/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (287,17,'2004-01-23','portato in officina elettrica per controllo','23/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (289,99,'2003-12-23','Tolto dalla linea 39, usato per fare la migrazione a windows 2000 sui finelinea 53,54,56 e successivamente riposto in officina elettrica (magazzino)','23/12/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (291,170,'2004-01-23','Aggiornato programma supervisione da Auteco e fatto il ghost del disco','23/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (293,116,'2004-01-23','Messo sulla linea 43','23/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (294,116,'2003-09-07','Tornato dalla riparazione e riconfigurato come PC di scorta per le etichettatrici SB','07/09/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (295,33,'2004-01-28','aggiornato software eticpal','28/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (297,33,'2004-01-29','Installato su linea 41-42','29/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (298,161,'2004-01-30','non si accende più. portato in officina','30/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (299,179,'2004-02-03','aggiornato software OGS con copia della cartella BENEDETT da rete. Rifatta l\'immagine del PC','03/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (300,27,'2004-02-12','portato in officina elettrica causa danneggiamento del disco','12/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (301,161,'2004-02-12','Cambiato il disto, reinstallato software e riportato in linea','12/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (302,116,'2004-02-12','Sistemato sulla linea 55','12/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (303,161,'2004-02-16','il pc ha perso la configurazione automatica IO/DMA: impostati i parametri manualmente','16/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (304,17,'2004-02-17','inserito in linea 43; la porta COM2 non funziona','17/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (305,162,'2004-02-17','riportato in officina elettrica','17/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (306,27,'2004-02-20','Il disco non è danneggiato, ma la scheda madre si. mandato ad ASEM in riparazione\r\n','20/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (307,165,'2004-02-19','Inviato a popoli','19/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (308,168,'2004-02-19','Inviato a popoli','19/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (310,169,'2004-02-19','inviato a popoli','19/02/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (311,29,'2004-03-11','portato in officina elettrica\r\n','11/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (312,162,'2004-03-11','inserito in linea 53','11/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (313,189,'2004-03-12','Inviato a popoli','12/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (314,190,'2004-03-12','Inviato a popoli','12/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (315,191,'2004-03-16','Il Pc è arrivato senza controller RAID, senza i due cassetti hot-swap e senza un HD. In data di oggi è stato richiesto il reintegro della merce mediante una seconda bolla di vendita','16/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (316,185,'2004-03-01','Inviato a popoli','01/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (317,186,'2004-03-01','INviato a popoli','01/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (318,187,'2004-03-01','inviato a popoli','01/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (319,29,'2004-03-19','sostituito hard disk in seguito a danneggiamento fisico; sul telaio che porta il disco rigido sono stati inoltre aggiunti dei gommini antivibrazione.','19/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (320,29,'2004-03-19','installato su impianto 53','19/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (321,162,'2004-03-19','portato in officina per problemi di crash','19/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (322,29,'2004-03-22','inviato l\'hard disk difettoso ad ASEM per sostituzione; numero di rientro Z5897','22/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (323,162,'2004-03-22','Sono stati aplicati gommini antivibranti sull\'Hard disk del pc, è stato fatto un test completo del disco ed è stata ripristinata la macchina con il disco immagine','22/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (324,27,'2004-03-25','Tornato dalla riparazione. Dissipatore troppo grande che faceva contatto sui jumpers della scheda madre (probabilmente per dilatazione termica)','25/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (325,178,'2004-03-30','Inserito in linea 65 causa guasto Pc di supervisione','30/03/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (326,27,'2004-04-01','messo su finelinea 55 (ritornato da riparazione)','01/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (327,116,'2004-04-01','riportato in officina','01/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (328,35,'2004-04-09','Aggiornato software etichettatrice palette','09/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (329,189,'2004-04-08','Aggiornato software etichettatrice palette, rintracciabilità e installata antennina','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (331,118,'2004-04-08','Aggiornati software di etichettatura e invio etichette. Sostituira scheda NETMOS con porta COM3 non funzionante','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (332,119,'2004-04-08','Aggiornati software di etichettatura e invio etichette. Sostituira scheda NETMOS con porta COM3 non funzionante','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (333,120,'2004-04-08','Aggiornati software di etichettatura e invio etichette. Sostituira scheda NETMOS con porta COM3 non funzionante','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (334,121,'2004-04-08','Ritornato da riparazione e tenuto in magazzino da tempo. Al PC è stato aggiornato il software di etichettatura e di trasferimento etichette, ma NON è stata sostituita la porta seriale difettosa','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (335,123,'2004-04-08','Aggiornati software di etichettatura e invio etichette. Sostituita scheda NETMOS con porta COM3 non funzionante','08/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (336,37,'2004-04-13','Il Pc si trova sull\'etichettatrice fardelli impianto 64. ','13/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (340,116,'2004-04-14','riportato in officina elettrica. bisogna fare controllo sulle seriali','14/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (341,193,'2004-04-14','inserito nella linea 58','14/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (342,33,'2004-04-22','tolto dalla linea e  portato in officina elettrica','22/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (343,116,'2004-04-22','Inserito sulla linea 41-42','22/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (344,117,'2004-04-23','Rotto alimentatore; sostituito con quello del PC usato per il tuttonormel (160)','23/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (345,26,'2004-04-26','Bruciato adattatore wireless. Sostituito con uno equivalente. Sostituito anche dissipatore e ventola CPU con uno fuori standard ','26/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (346,33,'2004-04-26','reinstallato sistema operativo e software. pronto per installazione su linea','26/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (347,26,'2004-04-26','Portato in officina ','26/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (348,162,'2004-04-26','Inserito nell\'impianto 57 dx ','26/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (349,26,'2004-04-27','reinserito in linea','27/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (350,116,'2004-04-27','inserito nella linea 46','27/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (351,33,'2004-04-27','Inserito in linea 41-42','27/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (352,19,'2004-04-27','tolto dalla linea per controllo. A volte esce dal programma di etichettatura e torna al desktop','27/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (353,19,'2004-04-28','trovata ventola CPU bloccata. Sostituita con una nuova. Messo in burning- test','28/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (354,16,'2004-04-28','inserito sull\'impianto 41-42','28/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (355,19,'2004-04-29','aggiunti gommini antivibrazione sull\'Hd e reinstallato sia il programma di etichettatura palette che word','29/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (356,116,'2004-04-29','tolto dalla linea per un problema sul programma di etichettatura','29/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (357,116,'2004-05-03','installato visual basic e MSDN','03/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (358,19,'2004-04-29','inserito in linea 46. disabilitato VNC e impostati diritti amministrativi su utente finelinea','29/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (359,28,'2004-05-04','Tolto dalla linea per provare il PC di scorta2','04/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (360,116,'2004-05-04','Inserito sul finelinea 39 per test','04/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (361,33,'2004-04-29','tolto dalla linea e riportato in officina elettrica','29/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (362,33,'2004-05-04','preparato per il finelinea31','04/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (364,190,'2004-05-05','predisposto collegamento su cavo e indirizzo IP su rete teleservice. testato il collegamento con successo','05/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (365,189,'2004-05-05','attivata ethernet onboard. Manca da verificare la configurazione','05/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (366,28,'2004-05-06','installate patch di sicurezza','06/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (367,28,'2004-05-06','Reinserito in linea 39','06/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (368,116,'2004-05-06','Tolto dalla linea e portato da Tonegato ','06/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (369,33,'2004-05-10','Installato sulla linea 31','10/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (370,144,'2004-05-10','portato in officina elettrica. Non riesce a riconoscere più la scheda PCMCIA e si blocca quando questa viene inserita. Provato a cambiare adattatore ma senza risultato','10/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (371,162,'2004-05-10','Inserito sull\'impianto 32','10/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (372,144,'2004-05-11','Inviato in riparazione con adattatore, schedina e  driver schedina; numero rientro: Z6196','11/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (373,99,'2004-05-11','Inserito in linea 32. ha problemi sulla seconda porta seriale (COM2)','11/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (374,162,'2004-05-11','Tolto dalla linea e rimesso a magazzion','11/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (375,116,'2004-04-22','da fare ancora il controllo sulle  seriali del PC, e formattare la macchina alla prima occasione','22/04/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (376,116,'2004-05-12','Reinstallato da zero tutto il sistema operativo e gli applicativi, applicate le patch e posto a magazzino come scorta','12/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (377,194,'2004-05-10','scambiato hard disk con quello del pc 177 causa blocco sistema operativo','10/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (378,194,'2004-05-13','applicate patch di sicurezza, ripristinato sistema operativo, fatto il ghost sull\'hard disk originale. riscambiato quest\'ultimo con l\'hard disk del pc 177','13/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (379,177,'2004-05-10','tolto l\'hard disk originale e inserito quello del PC 194. Configurazione di Windows NT errata, probabilmente dovuta a qualche software non autorizzato installatovi. Rimossi alcuni player DiVX e altri programmi non autorizzati e fatto un controllo antivirus sulla macchina. installate patch di sicurezza windows NT','10/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (380,177,'2004-05-13','reinserito hard disk originale. da aggiornare con ghost\r\n','13/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (381,177,'2004-05-13','Applicate le patch di sicurezza e sistemato il PC in magazzino','13/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (382,39,'2004-05-14','Il programma sul PC improvvisamente non genera più l\'etichetta;Il pc è stato tolto dalla linea e sostituito con la scorta','14/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (383,126,'2004-05-14','messo sukl picking per sostituzione pc originale che ha problemi','14/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (384,39,'2004-05-19','reinserito  sul picking','19/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (385,162,'2004-05-17','installato per prova office 2003 e testato con successo il programma di etichettatura. La prova ha avuto esito positivo e si è provveduto a ripristinare la situazione iniziale','17/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (386,126,'2004-05-19','riprotato in officina elettrica','19/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (387,25,'2004-05-19','disabilitata accelerazione scheda video e applicate patch di sicurezza','19/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (388,24,'2004-05-19','disabilitata accelerazione scheda video e applicate patch di sicurezza','19/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (389,168,'2004-05-26','sostituita scheda madre, micro e memoria con quella del PC 191 causa guasto. Il PC è stato rispedito poi in sede.','26/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (390,191,'2004-05-26','al PC sono stati tolti: scheda madre, CPU, memoria per sostituirli su quelli del PC 169 che ha un guasto hardware. Il PC è in attesa dei componenti in riparazione ad ASEM (RMA: Z6323)','26/05/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (391,169,'2004-06-07','Disabilitata accelerazione grafica per problemi di visualizzazione','07/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (392,162,'2004-06-11','Inviato in riparazione (Z6425). Ci devono preventivare anche una tastiera NMB\r\n ','11/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (395,144,'2004-06-16','Rientrato dalla riparazione ed installato come finelinea 32.<br> \r\nGuasto riscontrato: Schedina wireless montata rovescia.','16/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (396,99,'2004-06-16','Riportato in officina, sarà preparato ed installato sulla giove 66','16/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (397,99,'2004-06-17','La porta com 2 funziona correttamente! bastava configurare correttamente gli switch.','17/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (398,99,'2004-06-18','installato su etic fardello linea 66','18/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (399,158,'2004-06-18','riportato in officina da linea 66 etic fardello','18/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (400,28,'2004-06-22','Portato in officina per controllo in quanto si bloccava all\'avvio; sostituita ventola e reinstallato S.O. e applicativi; PC pronto per ripristino su linea','22/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (401,116,'2004-06-22','installato in linea 39','22/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (402,116,'2004-06-22','tolto da linea 39 e riportato in officina come scorta','22/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (403,28,'2004-06-22','rimesso su linea 39','22/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (404,191,'2004-06-22','Arrivati i pezzi mancanti e ripristinata la configurazione hardware originale','22/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (405,164,'2004-06-25','ieri il PC non riusciva a terminare la sequenza di boot. Fatta la sostituzione del disco, tolto la scheda netMOS, ripristinata l\'immagine del sistema operativo da CD e riportato presso l\'etichettatrice jolly','25/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (406,158,'2004-06-28','spedito in Spagna linea 8 su etichettatrice fardello','28/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (407,121,'2004-01-01','Il PC è stato mandato in riparazione direttamente da Gran Guizza per guasto alimentatore AT. Contemparaneamente è stato spedito anche un secondo PC di rimpiazzo che poi è rimasto sulla linea 5. Attualmente questi è ancora sulla linea, mentre il PC 121 fa da scorta. Ha inoltre una Porta seriale (COM3) non funzionante.','01/01/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (408,121,'2004-06-21','Sostituita scheda netMOS con porta seriale non funzionante; il PC è stato poi installato sulla linea 5 al posto del PC originario (#123)','21/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (409,123,'2004-06-21','Il PC è stato portato in san benedetto per problemi alla comunicazione wireless','21/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (410,123,'2004-06-29','Reinstallato ex-novo, configurato come etichettatore di scorta e spedito a popoli con una scheda wireless nuova','29/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (411,190,'2004-06-21','Controllato l\'avvio automatico del sistema operativo con l\'utente di default','21/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (412,189,'2004-06-21','Configurata seconda scheda (ethernet onboard) e controllato Gpedit','21/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (413,35,'2004-06-21','E\' stata montata la rete di tracciabilità dell lotto ed il PC è stato collegato in rete con il server; sono stati anche abilitati ed aggiornati tutti i programmi della rintracciabiltà.','21/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (414,202,'2004-06-24','rimandato ad asem x aggiunta touchscreen','24/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (415,203,'2004-06-24','rimandato ad asem x aggiunta touchscreen \r\n\r\n','24/06/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (418,39,'2004-07-14','Aggiunto in esecuzione automatica uno script per la copia dei layout dal server','14/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (419,38,'2004-07-14','Aggiunto in esecuzione automatica uno script per la copia dei layout dal server','14/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (420,202,'2004-07-15','Tornato dalla riparazione; aggiunto T/Screen','15/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (421,203,'2004-07-15','Tornato dalla riparazione; aggiunto T/Screen','15/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (422,178,'2004-07-26','tolto dalla linea','26/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (423,198,'2004-07-26','Il PC è stato ripristinato da un ghost del PC precedente che ha fuso la scheda madre e il micro. è stato controllato per evitare conflitti tra periferiche ed è stato messo in linea. Ad oggi, i test di funzionamento sono stati positivi..','26/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (424,202,'2004-08-04','aggiunto programma etichettatura fardello, corretti alcuni bug sul software e spedito a destinazione','04/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (425,33,'2004-07-24','Tolto dalla linea per problemi vari (si bloccava)','24/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (426,33,'2004-08-12','Riformattato, reinstallati i programmi, fatto il check del disco, della CPU e della memoria e rimesso in linea','12/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (427,116,'2004-07-24','installato in linea 31','24/07/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (428,116,'2004-08-12','riportato in officina','12/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (429,203,'2004-08-13','preparato per etichettatrice palette; da inserire in linea 56','13/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (430,33,'2004-08-13','ritolto dalla linea per problemi vari; il PC è stato discontinuato a partire da oggi.','13/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (431,116,'2004-08-13','rimesso in linea 31','13/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (432,203,'2004-08-18','Inserito in Linea 56','18/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (433,198,'2004-08-18','- Crash del Disco\r\n- Al primo reboot ha dato \"Disk Boot Failure\"\r\n-Dopodichè è stato eseguito un CheckDisk che ha corretto alcuni indici\r\n-Per una decina di riavvii e CheckDisk non ha più dato alcun problema\r\n-E\' tornato quindi a magazzino\r\n','18/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (434,25,'2004-08-18','In Officina Per Riparazione','18/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (435,25,'2004-08-19','- Crash HD (Disk Boot Failure)\r\n- Sostituito HD 40 GB e Ventola MicroProcessore\r\n- Rimesso in Linea 56','19/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (436,34,'2004-08-19','Tolto dalla 66 per installare un 801 per la gestione della doppia etichettatrice.\r\n-Sostituita ventola Microprocessore','19/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (437,203,'2004-08-19','Installato in Linea 66 per gestione Doppia etichettatrice','19/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (438,34,'2004-08-20','Installato in Linea 43','20/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (439,17,'2004-08-20','Tolto da Linea 43 \r\n- Settori danneggiati del Disco\r\n- Sostituito HD con 40 Gb\r\n-Abilitata COM2 (impostati switch a fianco del PC)\r\n-Preparato per Linea 31','20/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (440,17,'2004-08-20','Inserito in Linea 31','20/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (441,208,'2004-08-25','preparato come finelinea di scorta 2. Quando arriva il PC originale di scorta, questo andrà a sostituirlo','25/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (442,16,'2004-08-25','ssostituito hard disk con quello originariamente presente sul finelinea31 (ora discontinuato)','25/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (443,16,'2004-08-26','Alzata l\'etichettatrice in modo da attenuare le vibrazioni','26/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (444,209,'2004-08-31','Sostituito alimentatore per guasto e installate le  patch','31/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (445,209,'2004-09-01','Tutto l\'hardware del PC a parte alimentatore, scheda e CPU è stato sotituito su di un\'altra macchina (causa ulteriore guasto alimentatore). Al Pc è stata inoltre aggiunta una scheda seriale ISA per sostituire la porta COM2 onboard che risulta essere danneggiata','01/09/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (446,170,'2004-09-01','Cambiata scheda video con una Cirrus GD 5426','01/09/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (447,162,'2004-09-06','tornato dalla riparazione. Manca la tastiera che avevamo richiesto in più','06/09/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (448,213,'2004-09-15','Ex repele 39, convertito su richiesta di Guggia daniele a PC per controllo e supervisione centralino telefonico Ericcson','15/09/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (449,215,'2004-10-01','N.B. Al Pc è stato sostituito il modulo di memoria originale con uno più piccolo, in quanto verrà destinato alla gestione dell\'etichettatrice fardello impianto 66','01/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (450,213,'2004-09-29','Inserito in linea da Vecchi davide','29/09/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (451,146,'2004-10-05','Tornato da Halle per problemi all\'alimentatore; sostituito quest\'ultimo con quello del Pc di scorta (ID:138)','05/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (452,138,'2004-10-05','Tornato in san Benedetto; prelevato alimentatore per sostituzione con ID 146','05/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (453,145,'2004-10-05','arrivato da ahalle per controllo aggiornamento software e verifica funzionamento generale','05/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (454,32,'2004-10-05','tolto dalla linea per problemi su porte seriali','05/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (455,162,'2004-10-06','preparato per sostituire l\'etichettatrice di emergenza presso l\'area rio','06/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (459,32,'2004-10-13','Il pc è stato smontato, è stata tolta e rimessa la scheda madre ed è stata sostituita la ventola del dissipatore della CPU che si era bloccata; il Pc ha ripreso a funzionare correttamente ed è quindi stato reinstallato con l\'ultima versione del programma di etichettatura (3.1.9)','13/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (460,32,'2004-10-13','rimesso in linea 65','13/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (461,211,'2004-10-10','Installato su linea 65; bisogna controllare la stampante','10/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (462,211,'2004-10-13','riportato in officina elettrica','13/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (463,211,'2004-10-15','sembra che la porta LPT1 abbia dei problemi di comunicazione; il PC è stato inviato in riparazione ad asem','15/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (464,193,'2004-10-18','riportato in officina per pulizia, controllo e reinstallazione software (il Pc si è bloccato durante un riavvio)','18/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (465,193,'2004-10-20','reinstallato in linea58','20/10/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (466,211,'2004-11-08','tornato dalla riparazione ed installato su linea 39','08/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (468,28,'2004-11-08','tolto dalla linea per avvii che durano anche 10-15 minuti; anche 2-3 volte a turno da allarme di windows in eticpal.exe','08/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (469,119,'2004-11-09','spedito da GG per aggiornamento. Reinstallato tutto il software di sistema, di etichettatura e di scaricamento dati','09/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (470,211,'2004-11-11','riportato in officina come scorta','11/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (471,28,'2004-11-11','dopo la manutenzione rimesso in linea','11/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (472,161,'2004-11-17','Reinstallato completamente e messo in funzione nella linea 64','17/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (473,118,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (474,119,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (475,120,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (476,121,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (477,122,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (478,189,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito.  è stata tolta la scheda di rete wireless e l\'IP di questa è diventato il primo indirizzo della scheda di rete fissa. l\'indirizzo IP secondario è  rimasto per il teleservice.','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (479,190,'2004-11-22','Aggiornati i software all\'ultima versione, installato il kernel modificato, impostate le policy di protezione per l\'utente predefinito. è stata tolta la scheda di rete wireless e l\'IP di questa è diventato il primo indirizzo della scheda di rete fissa. l\'indirizzo IP secondario è rimasto per il teleservice.','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (480,123,'2004-11-22','Aggiornati i software di  etichettatura e di trasferimento etichette, impostate le policy di protezione per l\'utente di default e sostituito il kernel','22/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (481,213,'2004-11-24','account \'ericsson\' temporanamente come amministratore di macchina','24/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (482,213,'2004-11-24','aggiornato ultraVNC','24/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (483,213,'2004-11-25','reinstallato CSM','25/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (484,208,'2004-11-25','dopo essere stato installato su linea 64, riportato come scorta in officina','25/11/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (486,35,'2004-12-03','Aggiornata la macchina con le ultime versioni dei software; inserita nel gruppo corretto; applicate le policy di protezione SB; è stata rilevato un malfunzionamento del lettore CD','03/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (487,116,'2004-08-14','riportato in magazzino','14/08/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (488,116,'2004-12-03','Spedito ed installato a Nepi con le ultime versioni dei software; inserito nel gruppo corretto; applicate le policy di protezione SB','03/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (489,221,'2004-12-03','Modifcata la configurazione e aggiunti i programmi per la stampa di emergenza e storno etichette','03/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (490,144,'2004-12-20','portato in officina per malfunzionamento scheda di rete','20/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (491,208,'2004-12-20','installato su linea 32','20/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (492,144,'2004-12-20','ripristinato ultimo Ghost del PC; aggiornato il software alla versione 3.2 e impostato su BIOS la gestione manuale2 delle risorse IRQ/DMA; controllate le porte seriali; pronto per l\'installazione','20/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (493,193,'2004-12-11','Portato in officina elettrica; il programma si blocca improvvisamente.','11/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (494,193,'2004-12-21','aggiornato il driver della scheda di rete; testate porte parallele e seriali','21/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (495,208,'2004-12-21','riportato in officina come scorta','21/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (496,144,'2004-12-21','installato su finelinea 32','21/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (498,208,'2005-01-03','Inserito in linea 55','03/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (499,27,'2005-01-03','Il pc è stato rimosso dalla line 55 per problemi di avvio (nel caricare il sistema operativo si riavvia) e portato in officina per verifica. Al pc è stata tolta la scheda di rete per sostituire quella della scorta 2 che era mancante','03/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (500,208,'2005-01-03','Trovato senza scheda di rete; sostituita con un ORINOCO proveniente dal PC della linea 55','03/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (501,208,'2005-01-05','Tolto da imp 55 e messo a magazzino','05/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (503,27,'2005-01-05','messo nell\'impianto 55','05/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (505,183,'2005-01-14','controllato il funzionamento del  sistema operativo e ripristinata licenza simatic NET','14/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (506,156,'2005-01-25','tolta la biseriale, riformattato e preparato per lo sviluppo della supervisione sala asettica dell\'impianto 63','25/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (507,181,'2005-01-31','Alienato in data odierna','31/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (508,144,'2005-02-10','Il PC esce saltuariamente dalla rete e la scheda si disattiva. Sostituito adattatore ISA/PC-CARD','10/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (509,193,'2005-02-10','provato a reinserire in linea 58 senza successo. La scheda continua ad andare offline.','10/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (510,211,'2005-02-14','spostato sul finelinea 56 per problemi al \r\nPC relativo','14/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (511,211,'2004-12-20','Messo sul fine linea 58','20/12/2004');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (512,193,'2005-02-14','Tolta la scheda ASUS WI-FI ed inserito adattatore PCI-PC-CARD, scheda orinoco. Reinstallato sistema operativo e drivers e reinserito in linea. Il pc sembra funzionare senza problemi','14/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (513,25,'2005-02-14','Su segnalazaione disservizio (PC che non si riesce ad accendere una volta spento, a meno di dargli uno scossone) il PC è stato tolto dalla linea e portato in officina elettrica per revisione','14/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (514,27,'2005-02-22','Tolto dalla linea per problemi di avvio (non partiva windows). è stato fatto un ripristino da ghost del sistema ed è stato aggiornato il programma. Sono stati recuperati i database dal vecchio disco e sono stati trasferiti sul PC','22/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (515,27,'2005-02-22','messo nell\'impianto 55','22/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (516,25,'2005-02-23','Ripristinato ghost del Pc, controllati i database e le porte seriali/LPT: pronto x installazione','23/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (517,25,'2005-02-24','messo su finelinea 56','24/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (518,28,'2005-02-24','Tolto dalla linea perchè non si avviava (disk boot failure.....) dovuto ad un spegnimento brusco da parte dell\'operatore','24/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (519,211,'2005-02-24','messo a magazzino come scorta','24/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (520,208,'2005-02-24','messo nel finelinea 39 in sostituzione al PC relativo','24/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (521,28,'2005-02-25','Sostituito Hard disk, ripristinato ghost del Pc e controllate seriali e parallela','25/02/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (522,28,'2005-03-07','Tolto dalla linea (non faceva il boot), sostituito il cavo IDE flat danneggiato con un  altro cavo IDE modificato, aggiornate le versioni dei programmi','07/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (523,26,'2005-03-07','tolto dalla linea in quanto non andava in rete. Tolta e rimessa l\'interfaccia ISA/PCMCIA. Il PC ha ripreso a funzionare ed è stato preso in consegna da Micheletto per l\'installazione sulla linea.','07/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (524,177,'2005-03-09','Aggiornato con modifica serbatoio battente ','09/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (525,198,'2005-03-09','Aggiornato con modifica del serbatoio battente da Alfieri - AUTECO - ','09/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (526,211,'2005-03-12','spostato sul finelinea 53 per problemi al PC relativo','12/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (527,29,'2005-03-12','sostituito x problema di aggiornamento dbase da remoto ed errori (102) su recordset locale','12/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (528,29,'2005-03-15','controllata la memoria con l\'ultimo memtest: OK <br>\r\ncontrollato il disco con il DFT ibm sia in quick che in advanced test: risultato: OK <br>\r\ndopo aver rifatto un checkdisk di windows, sono riapparsi gli errori  su event viewer: è stata controllata la KB del sito microsoft ed è saltato fuori che può dipendere dalla lentezza della CPU nel comunicare con il controller. Il controller è stato quindi impostato a PIO mode 4 ed è stato rifatto il checkdisk. <br>\r\nAd un primo esame, non sono stati riscontrati gli errori precedentemente verificatesi. <br>\r\nil disco è  stato messo in stress test facendogli scrivere e leggere più volte un file da 29 Gb. se la prova ha esito positivo, si potrà rimontaree il PC.','15/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (529,225,'2005-03-15','Il pc è arrivato da Interputer con problemi sul controller. Il sistema operativo segnava continuamente errori sul filesystem. Il PC è stato riportato al fornitore ed è stata cambiata la scheda madre (marca ASROCK) con una MB ASUS. <br>\r\nIL PC è stato poi portato in impianto per la messa in esercizio. <br>\r\nDa interputer aspettiamo ancora due coppie di ventole per il raffreddamento del sistema ','15/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (530,226,'2005-03-15','Il pc è arrivato da Interputer con problemi sul controller. Il sistema operativo segnava continuamente errori sul filesystem. Il PC è stato riportato al fornitore ed è stata cambiata la scheda madre (marca ASROCK) con una MB ASUS. <br>\r\nIL PC è stato poi portato in impianto per la messa in esercizio. <br>\r\nDa interputer aspettiamo ancora due coppie di ventole per il raffreddamento del sistema ','15/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (531,27,'2005-03-22','sostituito dalla linea per problemi di sputtanamento dbase','22/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (532,211,'2005-03-14','recuperato dalla linea.','14/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (533,211,'2005-03-22','messo su imp. 55','22/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (534,27,'2005-03-28','Al PC sono stati controllati: memoria, disco, CPU con vari diagnostici senza riscontrrare errore.<br>\r\nIl PC è stato poi messo in burning test per 4 ore senza errori. <br>\r\nInfine, la macchina è stata completamente smontata e tutte i contatti delle schede sono stati disossidati e puliti. La macchina è stata rimontata ed ora è pronta per la reinstallazione. ','28/03/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (535,211,'2005-04-05','tolto da linea55 e rimesso in officina come scorta','05/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (536,198,'2005-04-18','verificatone il funzionamento','18/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (537,178,'2005-04-18','verificatone il funzionamento regolare','18/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (538,181,'2005-04-19','Il PC è stato discontinuato in quanto obsoleto, anche come pezzi di ricambio.','19/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (540,183,'2005-04-19','controllatone il funzionamento; tolto il cassetto hot-swap. Il pc sembra collegarsi con la rete SIMATIC, ma il supervisione non riconosce il PC (questo su prova a banco). In fase di fermata impianto si provvederà a fare un test sul campo.','19/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (541,183,'2003-05-22','Aggiornato e collaudato da Alfieri (auteco)','22/05/2003');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (542,177,'2005-04-19','controllatone il funzionamento','19/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (543,198,'2005-04-22','Aggiornato da auteco','22/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (544,114,'2005-04-29','fatto il ghost dell\'hard disk','29/04/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (545,227,'2005-05-03','inserito in dominio e posto in cabina 2 in sostituzione del PC esistente','03/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (546,100,'2005-05-04','Il PC è stato tolto dalla sipa per malfunzionamento. è stato sostituito il processore con quello del pc #223 ed è stato rimesso in linea','04/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (547,223,'2005-05-04','tolto il processore ed inserito sul PC #100','04/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (548,37,'2005-05-06','Il pc è andato probabilmente in corto e non si accende più. portato in officina elettrica','06/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (549,215,'2005-05-06','portato in linea al posto del PC originale','06/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (550,37,'2005-05-09','Cambiato alimentatore e reinserito in linea','09/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (551,215,'2005-05-09','rimesso in magazzino','09/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (552,129,'2005-05-24','Programmato da Bettin con il software di etichettatura','24/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (553,34,'2005-05-26','ripristinato con il ghost ASEM702 del 13-10-2004\r\naggiornata la versione software eticpal a 3.2.10','26/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (554,225,'2005-05-26','Rottura disco rigido','26/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (555,225,'2005-05-27','Sostituzione disco rigido in garanzia, reinstallazione completa dei pacchetti software necessari','27/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (556,205,'2005-05-31','Ultimata la configurazione dual-boot con l\'installazione del software di raccolta dati','31/05/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (557,34,'2005-06-10','tolto dalla linea per problemi','10/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (558,211,'2005-06-10','installato su linea 43','10/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (559,208,'2005-06-10','tolto dalla linea e messo a magazzino','10/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (560,28,'2005-06-10','rimesso su linea 39','10/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (561,223,'2005-06-13','Inserito nuovo processore acquistato da ASEM','13/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (562,223,'2005-06-14','Inserito in linea 60 come raccolta dati a causa del probabile guasto alla CPU del PC di raccolta dati corrispondente','14/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (563,16,'2005-06-15','inviato in riparazione (Z8571)','15/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (564,31,'2005-06-15','inserito su impianto 43 (prima era sul finelinea61)','15/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (565,34,'2005-06-15','inserito su impianto 61 (scambio con quello del 43)','15/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (566,211,'2005-06-15','tolto da linea43 e rimesso in officina come scorta','15/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (567,206,'2005-06-16','Ricavato e ricostruito dalla componentistica del PC di raccolta dati dell\'impianto 60. Il pc originale aveva il cabinet talmente rovinato che è stato necessario sostituirlo','16/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (569,103,'2005-06-24','Il PC è stato ritirato in seguito a malfunzionamenti al  disco','24/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (570,34,'2005-06-29','tolto dalla linea per probelim di funzionamento (schermata blu all\'avvio del kernel  del sistema operativo)','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (571,34,'2005-06-29','Sostituito Hard disk e ripristinata l\'immagine del disco con le versioni nuove dei programmi. Inserito poi in linea','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (572,208,'2005-06-22','Inserito in linea 41 al posto del PC originale','22/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (573,211,'2005-06-29','Inserito in linea 41','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (574,211,'2005-06-29','tolto dalla linea 41 e rimesso in officina elettrica','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (575,34,'2005-06-29','inserito su impianto 61','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (576,211,'2005-06-29','tolto dalla linea 61 e messo a magazzino','29/06/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (577,163,'2005-07-06','portato in officina da Pierluigi T. x problemi sulla parallela (non invia nessun dato)\r\nPer un problema alla macchina il PC ha subito molti accensioni e spegnimenti.','06/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (578,163,'2005-07-06','modificata modalità di trasferimento LPT1 e disattivata LPT2. il pc ha ripreso a funzionare','06/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (579,122,'2005-07-08','il PC è ritornato da popoli per una riconfigurazione: reinstallati i pacchetti software, aggiornati i database, verificata la configurazione\r\n','08/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (580,163,'2005-07-12','rimesso in linea 33','12/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (581,211,'2005-07-12','rimesso di scorta a magazzino dopo l\'uso in imp.33','12/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (582,218,'2005-01-01','inviato a popoli (data da verificare)','01/01/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (583,17,'2005-07-18','sostituita scheda con PC Card avente MAC address= 00022DA607E9','18/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (584,211,'2005-07-19','Sostiuito alimentatore causa guasto allo stesso','19/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (585,127,'2005-07-19','Tolto dalla linea: il PC si accende, carica il kernel del sistema operativo ma non esce dalla fase di caricamento.','19/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (586,211,'2005-07-19','Installato su linea 45','19/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (587,127,'2005-07-20','inserito nel finelinea 45','20/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (588,211,'2005-07-20','tolto dalla linea 45 e messo a magazzino','20/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (589,14,'2005-07-26','tolto dalla linea e portato da Tonegato','26/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (590,211,'2005-07-26','installato su linea 34-35','26/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (591,218,'2005-07-22','tornato da popoli. Mancano tutti i programmi di supervisione e raccolta dati\r\n','22/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (592,218,'2005-07-28','completata configurazione; l\'utente predefinito per la supervisione è administrator, mente per le raccolte dati è operatore. sono stati inseriti i software mancanti ed è stato verificato il collegamento.','28/07/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (593,14,'2005-08-02','Cambiata la ventola del processore, era completamente bloccata e scaldava','02/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (594,203,'2005-08-04','cambiata scheda pcmcia con quella del finelinea di scorta 1 id:211','04/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (596,211,'2005-08-03','riportato in officina','03/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (597,211,'2005-08-04','prelevata schedina wireless per inserirla sul pc del 66, dotato della schedina wireless tolta dal scorta 2 qualche tempo fa.','04/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (598,14,'2005-08-03','sostituito HD con uno nuovo','03/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (599,157,'2005-08-25','gli operatori lamentano occasionali blocchi del sistema, in cui il monitor rimane spento, la macchina è accesa ma non risponde ad alcun comando. Abilitato il watchdog a 40 secondi','25/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (600,98,'2005-08-30','arrivato da halle: la riparazione fatta da zambelli costa troppo e aallora ce lo prendiamo in carico noi','30/08/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (601,227,'2005-09-05','TOLTO IL PROCESSORE X VENTOLA FERMA, MONTATO IL PROCESSORE DELL\'ID: 224','05/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (602,224,'2005-09-05','tolto processore x montarlo sull\'id: 227 tecnowatt','05/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (603,97,'2005-09-16','PC giatente in officina da giugno 2005. Sostituito alimentatore con un altro equivalente riparato e spedito in germania. L\'alimentatore originale è in riparazione.','16/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (604,17,'2005-09-22','tolto dalla linea 31 perchè lo schermo rimaneva sempre grigio ','22/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (605,211,'2005-09-22','installato su finelinea 31','22/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (606,17,'2005-09-23','Sostituito driver ed inverter LCD (parti recuperate da PC in disuso) e tenuto in attività per 12 ore','23/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (607,17,'2005-09-23','inserito nella linea 31','23/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (608,211,'2005-09-23','riportato in officina','23/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (609,186,'2005-09-29','arrivato da popoli: problemi alla scheda grafica','29/09/2005');
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (612,31,'2005-10-03','tolto dalla linea per problemi su disco: \"....inserire disco di sistema...\"',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (613,211,'2005-10-03','installato su linea 43',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (614,31,'2005-10-03','sostituita la ventola del processore\r\nfatto scandisk nessun problema rilevato..\r\n(il pc si è avviato regolarmente)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (615,31,'2005-10-04','installato in linea',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (616,31,'2005-10-04','sostituito hd e ripristinata la configurazione con il ghost per 702',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (617,211,'2005-10-04','tolto dalla linea 43 e messo a magazzino',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (618,17,'2005-10-10','tolto dalla linea 31 perchè lo schermo rimaneva sempre grigio ',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (619,211,'2005-10-10','installato su finelinea 31',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (620,17,'2005-10-11','inviato in riparazione (RMA=Z9172)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (621,232,'2005-10-11','installate immagini e controllato',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (622,16,'2005-10-12','ritornato dalla riparazione',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (623,16,'2005-10-12','inserito in linea 41-42',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (624,208,'2005-10-12','rimesso in magazzino',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (625,97,'2005-10-14','Tornato dalla germania; schermo bianco dopo qualche ora di funzionamento',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (626,230,'2005-10-14','riparato meccanismo espulsione floppy (tolta mascherina interna)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (627,98,'2005-10-14','inviato in riparazione (RMA:Z9214)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (628,24,'2005-10-18','tolto dalla linea per verifica',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (629,24,'2005-10-21','reinserito in linea',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (630,142,'2005-11-04','Riconfigurato per l\'utilizzo come controllore allarmi antincendio CA.MON.',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (631,160,'2005-11-03','inviato in riparazione (Z9270 o Z 9172)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (632,17,'2005-11-16','tornato dalla riparazione. Al controllo del PC, si Ã¨ trovato il dissipatore sganciato dalla CPU e si Ã¨ provveduto a riagganciarlo.',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (634,152,'2005-11-18','Controllata e corretta l\'impostazione del formato numerico per MySQL; controllato il collegamento col PLC e verificata la registrazione regolare dei grafici. ',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (635,152,'2005-11-14','Arrivato da halle perche non registrava piÃ¹ correttamente i dati.',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (636,98,'2005-11-25','tornato da riparazione',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (637,98,'2005-12-01','inviato ad halle',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (638,207,'2005-12-06','preparato per sostituire lo stampejolly49 (pc 164) attualmente in riparazione per schermo LCD saltato',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (639,207,'2005-12-06','tolta la simm da 256 mb e sostituita con quella da 64',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (640,164,'2005-12-06','inviato in riparazione per schermo LCD bianco. RMA=Z9581',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (641,160,'2005-12-07','tornato da riparazione',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (642,235,'2005-12-13','Arrivato in ritardo da ASEM; scambiato il suo HD con quello del pc 160 precedentemente preparato per velocizzare le operazioni di installazione',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (643,234,'2005-12-21','tolto l\'hard disk dal PC per metterlo sul supervisore linea in servizio',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (644,195,'2005-12-21','Tolto dalla linea per problemi di instalbilitÃ : pulito internamente e scambiato hard disk con quello montato sul PC 234 (ide 2.5). messo in burnin test per 24h.',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (645,232,'2005-12-22','aggiornato il software',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (646,31,'2005-12-22','Tolto dalla linea per problemi all\'Hard disk',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (647,31,'2005-12-28','Sostituito hard disk ma non risolto il problema: da mandare in riparazione',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (649,31,'2005-12-28','inviato in riparazione (Z9693)',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (650,115,'2005-12-23','Arrivato da Halle per aggiornamento programmi',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (651,109,'2006-01-13','Tornato da Volvic per riparazione. Problemi al Disco',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (652,237,'2006-01-20','spedito a donnery',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (653,208,'2006-02-01','messo nel finelinea 54 in sostituzione al PC relativo',NULL);
INSERT INTO `cronologia` (`ID`,`Apparecchio`,`data`,`evento`,`data1`) VALUES (654,24,'2006-02-01','tolto dalla linea perchÃ¨ in fase di avvio di windows il monitor si spegne',NULL);

#
# Table Objects for table diritti
#

CREATE TABLE `diritti` (
  `ID` int(11) NOT NULL default '0',
  `utente` int(11) default NULL,
  `diritto` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table diritti
#

INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (2,1,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (3,1,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (4,1,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (5,1,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (6,1,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (7,1,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (8,1,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (9,1,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (10,1,14);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (11,2,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (12,2,2);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (13,2,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (14,2,4);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (15,2,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (16,2,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (17,2,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (18,2,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (19,2,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (20,3,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (21,3,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (22,3,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (23,3,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (24,3,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (25,3,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (26,3,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (27,4,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (28,4,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (29,4,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (30,4,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (31,4,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (32,4,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (33,5,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (34,5,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (35,5,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (36,5,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (37,5,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (38,5,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (39,5,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (40,5,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (41,5,14);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (42,6,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (43,6,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (44,6,17);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (45,6,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (46,6,8);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (47,6,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (48,6,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (49,6,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (50,6,14);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (51,7,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (52,7,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (53,7,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (54,7,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (55,7,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (56,7,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (57,7,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (58,7,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (59,7,14);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (61,8,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (62,8,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (63,8,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (64,8,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (65,8,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (66,8,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (67,8,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (68,8,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (70,8,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (71,9,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (72,9,4);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (73,9,5);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (74,9,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (75,9,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (76,9,8);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (77,9,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (78,9,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (79,9,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (80,9,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (81,9,14);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (82,9,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (101,14,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (102,32,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (103,16,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (104,21,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (105,12,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (106,10,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (107,19,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (108,13,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (109,24,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (110,17,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (111,11,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (112,25,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (113,18,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (114,28,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (115,26,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (116,20,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (117,29,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (118,15,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (119,14,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (120,32,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (121,16,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (122,21,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (123,12,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (124,10,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (125,19,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (126,13,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (127,24,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (128,17,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (129,11,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (130,25,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (131,18,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (132,28,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (133,26,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (134,20,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (135,29,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (136,15,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (137,11,5);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (138,10,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (139,19,6);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (140,14,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (141,32,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (142,12,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (143,10,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (144,19,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (145,13,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (146,11,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (147,25,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (148,18,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (149,26,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (150,20,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (151,15,7);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (152,10,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (153,19,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (154,14,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (155,32,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (156,12,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (157,10,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (158,19,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (159,13,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (160,11,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (161,25,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (162,18,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (163,26,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (164,20,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (165,15,10);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (166,14,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (167,16,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (168,21,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (169,12,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (170,10,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (171,13,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (172,17,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (173,25,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (174,18,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (175,28,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (176,26,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (177,20,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (179,15,11);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (180,14,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (181,32,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (182,16,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (183,21,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (184,12,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (185,10,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (186,19,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (187,13,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (188,17,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (189,11,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (190,25,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (191,18,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (192,26,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (193,20,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (194,29,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (195,15,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (196,32,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (197,10,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (198,11,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (199,18,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (200,26,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (201,14,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (202,12,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (203,10,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (204,13,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (205,17,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (206,18,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (207,26,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (208,20,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (209,29,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (210,15,15);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (212,29,18);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (213,1,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (214,2,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (215,3,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (216,5,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (217,10,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (218,19,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (219,1,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (220,2,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (221,3,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (222,4,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (223,5,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (224,6,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (225,7,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (226,8,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (227,9,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (228,10,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (229,11,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (230,12,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (231,13,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (232,14,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (233,15,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (234,16,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (235,17,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (236,18,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (237,19,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (238,20,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (239,21,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (240,24,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (241,25,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (242,26,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (243,28,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (244,29,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (245,32,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (246,2,21);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (247,9,21);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (248,37,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (249,37,19);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (250,37,20);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (251,37,3);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (252,37,17);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (253,37,9);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (254,37,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (255,27,13);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (256,27,12);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (257,27,1);
INSERT INTO `diritti` (`ID`,`utente`,`diritto`) VALUES (258,41,18);

#
# Table Objects for table documenti
#

CREATE TABLE `documenti` (
  `ID` int(11) NOT NULL default '0',
  `PC` int(11) default NULL,
  `Documento` varchar(100) default NULL,
  `Commento` varchar(100) default NULL,
  `Tipo` varchar(50) default NULL,
  `IDUtente` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table documenti
#

INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (14,119,'etichettatrice linea b gran guizza.jpg','etichettatrice linea b gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (15,143,'etichettatrice linea 2 halle.jpg','etichettatrice linea 2 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (19,127,'riparazione 0AITE0YB00033.jpg','riparazione 0AITE0YB00033','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (23,118,'etichettatrice linea A gran guizza.jpg','etichettatrice linea A gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (24,107,'raccolta dati linea 1 volvic.jpg','raccolta dati linea 1 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (25,109,'raccolta dati linea 2 volvic.jpg','raccolta dati linea 2 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (27,110,'scorta linea 1 volvic.jpg','scorta linea 1 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (28,111,'supervisione linea 1 volvic.jpg','supervisione linea 1 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (29,112,'scorta linea 2 volvic.jpg','scorta linea 2 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (30,113,'supervisione linea 2 volvic.jpg','supervisione linea 2 volvic','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (32,114,'raccolta dati linea 61 scorzè.jpg','raccolta dati linea 61 scorzè','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (34,126,'etichettatrice linea 48 scorzè.jpg','etichettatrice linea 48 scorzè','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (35,116,'etichettatrice linea 48 scorzè.jpg','etichettatrice linea 48 scorzè','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (36,128,'etichettatrice linea 1 acqua di nepi.jpg','etichettatrice linea 1 acqua di nepi','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (37,117,'supervisione sipa 23 scorzè.jpg','supervisione sipa 23 scorzè','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (38,115,'scorta linea 1 halle.jpg','scorta linea 1 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (39,134,'raccolta dati linea 2 halle - protool.jpg','raccolta dati linea 2 halle - protool','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (42,135,'etichettatrice volvic linea 2.jpg','etichettatrice volvic linea 2','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (43,136,'etichettatrice volvic linea 1.jpg','etichettatrice volvic linea 1','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (44,137,'supervisione linea2 halle - step 7.jpg','supervisione linea2 halle - step 7','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (45,137,'supervisione linea2 halle - protool.jpg','supervisione linea2 halle - protool','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (46,138,'scorta linea 2 halle.jpg','scorta linea 2 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (50,139,'etichettatrice volvic linea 3.jpg','etichettatrice volvic linea 3','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (51,141,'etichettatrice linea 1 halle.jpg','etichettatrice linea 1 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (52,142,'Rotonda Scorzè - Acquisizione dati.jpg','Rotonda Scorzè - Acquisizione dati','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (53,146,'Supervisione linea 3 halle.jpg.jpg','Supervisione linea 3 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (54,147,'Raccolta dati linea 3 halle.jpg','Raccolta dati linea 3 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (55,148,'Etichettatrice fardello linea 1 halle.jpg','Etichettatrice fardello linea 1 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (56,149,'Etichettatrice fardello linea 2 halle - b.jpg','Etichettatrice fardello linea 2 halle - b','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (58,149,'Etichettatrice fardello linea 2 halle.jpg','Etichettatrice fardello linea 2 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (59,149,'Etichettatrice fardello linea 2 halle - c.jpg','Etichettatrice fardello linea 2 halle - c','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (60,148,'etichettatrice fardello linea 1 halle - b.jpg','etichettatrice fardello linea 1 halle - b','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (61,148,'etichettatrice fardello linea 1 halle - c.jpg','etichettatrice fardello linea 1 halle - c','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (62,150,'Etichettatrice fardello linea 3 halle.jpg','Etichettatrice fardello linea 3 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (63,150,'Etichettatrice fardello linea 3 halle - c.jpg','Etichettatrice fardello linea 3 halle - c','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (64,151,'etichettatrice linea 3 halle.jpg','etichettatrice linea 3 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (65,120,'etichettatrice linea c-d gran guizza.jpg','etichettatrice linea c-d gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (66,121,'etichettatrice linea E gran guizza.jpg','etichettatrice linea E gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (67,122,'etichettatrice linea F Gran guizza .jpg','etichettatrice linea F Gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (68,123,'etichettatrice linea G gran guizza.jpg','etichettatrice linea G gran guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (69,124,'etichettatrice linea 1 alpe guizza.jpg','etichettatrice linea 1 alpe guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (70,125,'etichettatrice linea 2 alpe guizza.jpg','etichettatrice linea 2 alpe guizza','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (71,152,'raccolta dati linea 1 halle.jpg','raccolta dati linea 1 halle','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (72,154,'P4120001.JPG','P4120001','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (73,154,'P4120002.JPG','P4120002','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (77,35,'Scansione.jpg','Scansione','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (78,154,'Scansione2.jpg','Scansione2','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (79,15,'etichettatrice linea 57 dx.jpg','etichettatrice linea 57 dx','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (80,155,'Supervisione halle linea 1.jpg','Supervisione halle linea 1','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (81,38,'alzaabbassa scorze.jpg','alzaabbassa scorze','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (82,39,'picking scorze.jpg','picking scorze','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (84,14,'id14a.jpg','id14a','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (90,159,'siem2.jpg','etichetta COA siemens 2','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (104,33,'104.jpg','riparazione dello schermo bianco','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (105,159,'105.jpg','Licenza siemens per la documentazione','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (106,157,'106.jpg','Licenza siemens per la documentazione','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (108,161,'108.jpg','iMMAGINE LICENZA WINDOWS 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (109,162,'109.jpg','Riparazione del mese di ottobre','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (110,166,'110.jpg','Retro del PC','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (111,166,'111.jpg','Verbale collaudo di Asem','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (112,167,'112.jpg','registrazione Windows 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (113,167,'113.jpg','verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (114,163,'114.jpg','Riparazione Pc del novembre 2003','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (115,17,'115.jpg','Riparazione schermo bianco','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (116,169,'116.JPG','Etichetta COA windows 2000 applicata su PC','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (117,168,'117.JPG','Etichetta windows 2000 applicata su PC','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (118,116,'118.jpg','Riparazione touch screen rotto','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (119,187,'119.JPG','Licenza windows 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (120,186,'120.JPG','licenza windows 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (121,185,'121.JPG','licenza windows 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (124,109,'124.png','verbale di collaudo','image/x-png',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (126,110,'126.png','verbale di collaudo','image/x-png',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (127,199,'127.jpg','Etichetta COA','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (128,199,'128.jpg','Numero di serie','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (129,199,'129.jpg','licenza office','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (130,199,'130.jpg','verbale di collaudo','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (132,144,'132.jpg','riparazione 6196 del giugno 2004','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (133,191,'133.jpg','riparazione motherboard giugno 2004','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (134,202,'134.jpg','Licenza windows 2000 e numero di serie','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (135,203,'135.jpg','Numero di serie e licenza windows 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (136,202,'136.jpg','verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (137,203,'137.jpg','verbale  di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (138,198,'138.jpg','verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (139,204,'139.jpg','verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (140,204,'140.jpg','licenza  office 2000','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (148,196,'148.jpg','Verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (149,194,'149.jpg','Verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (150,208,'150.jpg','numero di serie ed etichetta COA','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (151,208,'151.jpg','verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (152,211,'152.jpg','Licenza Windows e numero di serie','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (153,211,'153.jpg','Verbale di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (154,211,'154.jpg','Licenza di office','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (155,25,'155.jpg','Verbale  di collaudo','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (156,162,'156.jpg','Riparazione Agosto 2004','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (162,21,'162.doc','ytty','application/msword',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (165,215,'165.jpg','Numero di serie ed etichetta COA di windows','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (166,115,'166.tif','Verbale di collaudo','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (167,142,'167.tif','Verbale di collaudo','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (168,218,'168.jpg','Licenza Windows e numero di serie','image/pjpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (169,218,'169.tif','verbale di collaudo','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (170,211,'170.tif','riparazione scheda madre per problemi LPT','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (171,119,'171.tif','elenco lavori eseguiti il 09-11-04','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (172,135,'172.pdf','Elenco materiale inviato a volvic da sanvido','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (173,225,'173.jpg','COA del PC','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (176,226,'176.jpg','COA del PC','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (177,219,'177.tif','Verbale di collaudo','image/tiff',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (178,215,'178.pdf','licenza office 2003 basic','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (179,228,'179.pdf','Elenco interventi per setup popoli','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (184,210,'184.jpg','Etichetta COA applicata sul PC','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (186,205,'186.jpg','COA del PC (notare etichetta rovinata)','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (187,212,'187.jpg','Foto COA e numero di serie del PC','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (188,212,'188.jpg','Foto software SIMATIC e licenza','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (189,229,'189.doc','Installazioni software','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (190,229,'190.doc','Distinta materiali invio ad halle','application/octet-stream',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (191,229,'191.pdf','distinta firmata','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (192,127,'192.pdf','verbale di collaudo','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (193,16,'193.pdf','verbale di riparazione: z9172','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (194,17,'194.tif','seconda riparazione dello schermo (11/2005)','image/tiff',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (195,17,'195.jpg','ventola staccata all\'arrivo alla riparazione 9172','image/jpeg',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (196,98,'196.pdf','riparazione 11/2005','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (197,160,'197.pdf','riparazione dicembre 2005','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (198,235,'198.pdf','VERBALE DI COLLAUDO','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (199,115,'199.htm','diagnostica CPU-Z','text/html',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (200,238,'200.pdf','Verbale di collaudo','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (201,109,'201.pdf','Richiesta di riparazione - gennaio 2006','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (202,237,'202.pdf','Distinta base spedizione donnery','application/pdf',12);
INSERT INTO `documenti` (`ID`,`PC`,`Documento`,`Commento`,`Tipo`,`IDUtente`) VALUES (203,31,'203.pdf','preventivo riparazione asem','application/pdf',12);

#
# Table Objects for table elencocolonne
#

CREATE TABLE `elencocolonne` (
  `TABLE_NAME` varchar(50) NOT NULL default '',
  `COLUMN_NAME` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table elencocolonne
#

INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('AdminScript','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('AdminScript','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('AdminScript','Testo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','AdminPWD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','audio');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','COA');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','CPU');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Datainst');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Gateway');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Gateway2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','HD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','IDrete');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','id_aziende');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','id_pc_tipifunzione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','IPAddress');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','IPAddress2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','lettore1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','lettore2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','madre');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','marca');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','marcamon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','modello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','modlet1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','modlet2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','modmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Netmask');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Netmask2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','NomeGruppo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Note');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','pollici');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','posizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','progressivoimpianto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','RAM');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','skrete1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','skrete2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','skrete3');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','skvideo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','SN');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','SNmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Tipo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','TipoGruppo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','tipomon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','UserName');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','UserPWD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','Utabit');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Apparecchi','VNCPWD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','gateway');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','gatewayazienda');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','id_azienda');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','id_paesi');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','netmask');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('aziende','sito');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Caratteristiche','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Caratteristiche','Gruppo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Caratteristiche','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','audio');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','computer');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','CPU');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','HD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','lettore1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','lettore2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','marca');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','marcamon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','modello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','modlet1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','modlet2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','modmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','pollici');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','RAM');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','skrete1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','skrete2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','skrete3');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','skvideo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','SNmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Configurazione','tipo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('cronologia','Apparecchio');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('cronologia','data');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('cronologia','evento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('cronologia','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('datiOggetti','Caratteristica');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('datiOggetti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('datiOggetti','IDOggetto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('datiOggetti','Valore');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Diritti','diritto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Diritti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Diritti','utente');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','Commento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','Documento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','IDUtente');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','PC');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('documenti','Tipo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','id');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','lvalue');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','objectid');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','property');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','uvalue');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','value');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('dtproperties','version');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ec','COLUMN_NAME');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ec','TABLE_NAME');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Elementi','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Elementi','Nome');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Elementi','Template');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ElencoOpzioniStampanti','CodStampante');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ElencoOpzioniStampanti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ElencoOpzioniStampanti','IDOpzione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ElencoPosizioni','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ElencoPosizioni','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('elencoSW','computer');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('elencoSW','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('elencoSW','SN');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('elencoSW','software');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('elencoSW','Versione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','audio');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','CPU');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','DESCTIPO');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','HD');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','IDrete');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','IPAddress');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','lettore1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','lettore2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','marca');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','marcamon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','modello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','modlet1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','modlet2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','modmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','pollici');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','RAM');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','skrete1');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','skrete2');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','skrete3');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','skvideo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','SN');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','SNmon');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('hardware','tipo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('impianti','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('impianti','id_aziende');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('impianti','progressivoimpianto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','Data');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','Note');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','NStampe');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','Stampante');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Interventi','TipoIntervento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','Apparecchio');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','CodIntervento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','data');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','Nome');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('InterventiPC','Valore');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_ip','id_ipaddr_aziende');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_ip','ip');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_ip','livello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_ip','macchina');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_ip','reparto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_macchine','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_macchine','id_ipaddr_tipireparto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_macchine','livello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_macchine','tipomacchina');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_reparti','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_reparti','id_ipaddr_tipireparto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_reparti','id_reparto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_tipireparto','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ipaddr_tipireparto','id_tiporeparto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ModelliStampante','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('ModelliStampante','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('monitorxml','data');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('monitorxml','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('monitorxml','PC');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('monitorxml','XML');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('oggetti','IDelemento');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('oggetti','IDOggetto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('OpzioniStampanti','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('OpzioniStampanti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('paesi','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('paesi','icona');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('paesi','id_paese');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_funzioni','id_apparecchi');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_funzioni','id_pc_tipifunzione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_funzioni','ordine');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_posizionamenti','data');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_posizionamenti','id_apparecchi');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_posizionamenti','id_impianti');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_tipifunzione','funzione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('pc_tipifunzione','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('posizioni_impianti','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('posizioni_impianti','id_aziende');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('posizioni_impianti','id_elencoposizioni');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('posizioni_impianti','progressivoimpianto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('QueryUtente','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('QueryUtente','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('QueryUtente','IDUtente');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('QueryUtente','Pubblica');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('QueryUtente','Testo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('riavvii','dataora');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('riavvii','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('riavvii','IP');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('riavvii','linea');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('software','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('software','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('software','parent');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','Codice');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','Firmware');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','Modello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','Posizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('stampanti','SN');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('t','a');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('t','b');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiApparecchi','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiApparecchi','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiDiritto','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiDiritto','Diritto');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiDiritto','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiIntervento','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiIntervento','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPC','AuthLevel');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPC','Descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPC','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','Azione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','CampiFiltro');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','Campo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','DescControllo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','NomeControllo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','Tabella');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','TipoControllo');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('TipiInterventoPCRighe','ValoriFiltro');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('trakker','descrizione');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('trakker','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('trakker','IP address');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('trakker','note');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('trakker','numero carrello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Utenti','ID');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Utenti','Livello');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Utenti','Password');
INSERT INTO `elencocolonne` (`TABLE_NAME`,`COLUMN_NAME`) VALUES ('Utenti','UserName');

#
# Table Objects for table elencoopzionistampanti
#

CREATE TABLE `elencoopzionistampanti` (
  `idopzione` int(11) NOT NULL default '0',
  `idstampante` char(5) NOT NULL default '',
  PRIMARY KEY  (`idopzione`,`idstampante`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table elencoopzionistampanti
#

INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'018');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'029');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (1,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'028');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'029');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M17');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M21');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M22');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M23');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M24');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M25');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M27');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M28');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M29');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M42');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (2,'M44');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (3,'025');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (3,'028');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (3,'032');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (3,'033');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'029');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (4,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (5,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (6,'026');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'029');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (7,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (8,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'001');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'003');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'004');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'005');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'007');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'009');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'010');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'012');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'017');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'021');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'022');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'023');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'025');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'027');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'029');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'035');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (9,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M17');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M18');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M19');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M21');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M22');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M23');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M25');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M26');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M27');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M28');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M29');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M33');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (10,'M44');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M17');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M23');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M28');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M29');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M33');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (11,'M42');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (12,'019');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (12,'030');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (13,'002');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (13,'036');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (14,'M24');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (14,'M25');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'006');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'008');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'011');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'013');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'014');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'015');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'016');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'020');
INSERT INTO `elencoopzionistampanti` (`idopzione`,`idstampante`) VALUES (15,'036');

#
# Table Objects for table elencoposizioni
#

CREATE TABLE `elencoposizioni` (
  `id` int(11) NOT NULL auto_increment,
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table elencoposizioni
#

INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (1,'LINEA 31');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (2,'LINEA 32');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (3,'LINEA 33');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (4,'LINEA 34-35');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (5,'LINEA 39');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (6,'LINEA 41-42');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (7,'LINEA 43');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (8,'LINEA 45');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (9,'LINEA 46');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (10,'LINEA 48');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (11,'LINEA 49-50');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (12,'LINEA 51-52');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (13,'LINEA 53');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (14,'LINEA 54');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (15,'LINEA 55');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (16,'LINEA 56');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (17,'LINEA 57 SX');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (18,'LINEA 57 DX');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (19,'LINEA 60');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (20,'LINEA 61');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (21,'LINEA 63 SX');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (22,'LINEA 63 DX');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (23,'LINEA 64');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (24,'LINEA 65');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (25,'LINEA 66');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (26,'JOLLY zona 49/50');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (27,'JOLLY zona mag. automatico');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (28,'JOLLY zona 54/55');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (29,'PICKING');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (30,'ALZA/ABBASSA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (31,'SCORTA linee n°1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (32,'SCORTA linee n°2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (33,'SCORTA da banco');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (34,'LINEA 66 Giove 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (35,'LINEA 66 Giove 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (36,'LINEA 64 Giove SX-1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (37,'LINEA 64 Giove SX-2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (38,'LINEA 64 Giove DX-1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (39,'LINEA 64 Giove DX-2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (40,'A.N.V.A.');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (41,'Officina x riparazione');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (42,'Donnery - LINEA 5');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (43,'Donnery - LINEA 4 Giove 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (44,'Donnery - LINEA 4 Giove 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (45,'SCORTA da banco con cutter');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (46,'Alpe G. - LINEA 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (47,'Alpe G. - LINEA 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (48,'Alpe G. - SCORTA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (49,'Alpe G. - JOLLY');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (50,'SCORTA DPM LH n°1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (51,'Gran G. - LINEA 7');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (52,'Gran G. - LINEA 8');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (53,'Nepi - JOLLY');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (54,'magazzino');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (55,'SCORTA DPM 5 RH');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (56,'SCORTA DPM 5 LH');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (57,'SCORTA DPM 6 LH');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (58,'SCORTA DPM 6 RH');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (59,'Halle - LINEA 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (60,'Halle - LINEA 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (61,'Halle - LINEA 2 Giove');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (62,'Halle - SCORTA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (63,'Halle -  LINEA 1 Giove');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (64,'LINEA 58');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (65,'Gadagne - Linea 6');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (66,'Nepi - SCORTA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (67,'Gran G. - LINEA 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (68,'Gran G. - LINEA 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (69,'Gran G. - LINEA 3-4');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (70,'Gran G. - LINEA 5');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (71,'Gran G. - LINEA 6');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (72,'Gran G. - LINEA 8 Giove 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (73,'Gran G. - LINEA 8 Giove 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (74,'Agua SB - LINEA 8 Giove 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (75,'Agua SB - LINEA 8 Giove 2');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (76,'Agua SB - LINEA 8');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (77,'Agua SB - JOLLY');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (78,'Donnery - SCORTA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (79,'Donnery - Giove LINEA 5');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (80,'Gran G. - SCORTA');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (81,'???');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (82,'Gran G. - SCORTA da banco');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (83,'Nepi - LINEA 1');
INSERT INTO `elencoposizioni` (`id`,`descrizione`) VALUES (84,'Nepi - LINEA 2');

#
# Table Objects for table elencosw
#

CREATE TABLE `elencosw` (
  `ID` int(11) NOT NULL auto_increment,
  `computer` int(11) default NULL,
  `software` int(11) default NULL,
  `SN` varchar(50) default NULL,
  `Versione` varchar(30) default NULL,
  `Licenza` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table elencosw
#

INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (139,35,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (204,109,70,'51873-OEM-0008231-50228','2000 PRO ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (206,109,42,'','5.5.8.3 OEM',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (207,107,70,'51873-OEM-0008231-50131','2000 PRO ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (209,110,70,'51873-OEM-0008231-50140','2000 PRO ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (210,111,70,'51873-OEM-0008231-50135','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (213,112,70,'51873-OEM-0008231-50227','2000 PRO ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (215,113,70,'51873-OEM-0008231-50139','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (218,114,70,'52329-OEM-0009964-44342','2000 ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (220,114,42,NULL,'5.5',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (221,115,70,'51873-OEM-0008231-50229','2000 PRO USA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (223,117,70,NULL,'2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (225,118,70,'52329-OEM-0010175-42844','2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (228,119,70,'52329-OEM-0010175-42850','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (230,120,70,'52329-OEM-0010175-42915','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (232,121,70,'52329-OEM-0010175-42917','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (234,122,70,'52329-OEM-0010175-42919','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (236,123,70,'52329-OEM-0010175-42834','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (243,124,70,'52329-OEM-0010175-42914','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (246,125,70,'52329-OEM-0010175-42842','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (249,116,70,'52329-OEM-0010175-42916','2000 PRO ITA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (253,126,86,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (268,135,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (269,135,86,NULL,'XP PRO',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (270,135,58,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (271,136,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (272,136,86,NULL,'XP PRO',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (273,136,58,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (274,137,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (275,138,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (278,138,49,NULL,'6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (279,139,70,NULL,'2000 PRO FRA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (280,139,86,NULL,'XP PRO FRA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (281,139,58,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (282,141,70,NULL,'2000 PRO TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (283,141,86,NULL,'XP PRO TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (284,141,58,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (287,137,49,NULL,'6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (288,143,70,NULL,'2000 TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (289,143,86,NULL,'XP PRO TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (304,145,70,'','2000 PRO ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (305,152,70,'','2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (306,152,42,'','5.5',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (309,154,70,'','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (316,155,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (318,155,49,'','6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (319,155,7,'','',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (320,153,70,'','98 SE ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (321,153,86,'','97 PRO',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (322,153,55,'','',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (332,156,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (343,160,70,'','NT4 ITA SP6',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (350,154,57,'','premiere 6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (365,116,30,'','2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (367,116,58,'3.0.8','3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (368,162,30,'','2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (369,162,58,'3.0.8','3.1.09',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (371,162,70,'','2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (378,164,70,'','2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (381,164,30,'','2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (382,165,70,'','2000 ITA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (384,165,49,'','6.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (385,165,59,'','6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (386,166,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (388,166,58,'','',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (389,167,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (390,167,58,'','',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (395,126,70,'','2000',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (453,164,58,'','3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (466,168,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (467,168,49,'','6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (468,168,59,'','6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (469,169,70,'','2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (471,169,59,'','6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (473,169,63,'','4.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (482,178,59,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (485,179,67,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (488,183,59,'','5.3 Profibus',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (490,185,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (491,186,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (492,187,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (493,188,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (494,189,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (495,190,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (497,190,58,'','3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (499,190,30,'','2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (504,191,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (505,185,59,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (507,185,7,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (508,185,63,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (509,186,7,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (510,186,49,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (511,186,59,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (512,187,59,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (513,187,49,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (514,187,7,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (515,192,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (516,192,58,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (517,192,7,'','?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (518,193,70,'','2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (523,14,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (524,14,58,NULL,'3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (525,14,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (526,14,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (527,14,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (528,15,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (529,15,58,NULL,'3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (530,15,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (531,15,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (532,15,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (561,16,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (562,16,58,NULL,'3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (563,16,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (564,16,70,NULL,'2000 ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (565,16,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (566,17,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (567,17,58,NULL,'3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (568,17,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (569,17,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (570,17,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (571,18,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (572,18,58,NULL,'3.1.05',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (573,18,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (575,18,71,NULL,'RC11',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (576,19,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (577,19,58,NULL,'3.1.05',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (578,19,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (579,19,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (580,19,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (581,20,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (582,20,58,NULL,'3.1.05',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (583,20,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (584,20,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (585,20,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (586,21,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (587,21,58,NULL,'3.2.01',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (588,21,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (589,21,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (590,21,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (591,23,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (592,23,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (593,23,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (594,23,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (595,23,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (596,24,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (597,24,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (598,24,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (599,24,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (600,24,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (601,25,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (602,25,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (603,25,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (604,25,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (605,25,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (606,26,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (607,26,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (608,26,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (609,26,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (610,26,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (611,27,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (612,27,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (613,27,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (614,27,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (615,27,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (616,28,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (617,28,58,NULL,'3.2.05',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (618,28,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (619,28,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (620,28,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (621,29,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (622,29,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (623,29,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (624,29,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (625,29,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (626,31,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (627,31,58,NULL,'3.2.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (628,31,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (629,31,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (630,31,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (631,32,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (632,32,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (633,32,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (634,32,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (635,32,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (641,34,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (642,34,58,NULL,'3.2.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (643,34,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (644,34,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (645,34,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (646,144,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (647,144,58,NULL,'3.2.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (648,144,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (649,144,70,NULL,'2000 ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (650,144,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (651,163,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (652,163,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (653,163,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (654,163,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (655,163,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (656,127,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (657,127,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (658,127,69,NULL,'2000 PRO ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (659,127,70,NULL,'2000 PRO ITA SP3',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (660,127,71,NULL,'RC11',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (661,159,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (662,159,58,NULL,'3.1.05',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (663,159,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (664,159,70,NULL,'2000 PRO ITA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (665,159,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (666,157,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (667,157,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (668,157,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (669,157,70,NULL,'2000 PRO ITA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (670,157,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (671,161,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (672,161,58,NULL,'3.2.00',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (673,161,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (674,161,70,NULL,'2000 ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (675,161,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (676,36,70,NULL,'98',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (677,36,69,NULL,'2000 ENG',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (678,36,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (679,37,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (680,37,69,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (681,37,71,NULL,'RC11',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (682,37,73,NULL,'6.0+SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (684,38,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (685,38,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (686,38,74,NULL,'3.4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (687,39,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (688,39,69,NULL,'2000',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (689,39,74,NULL,'3.4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (690,39,7,NULL,'3.3.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (691,99,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (692,99,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (696,102,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (697,102,69,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (699,102,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (700,102,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (703,105,70,NULL,'2000 Server',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (704,107,59,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (705,109,59,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (707,110,59,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (708,110,7,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (709,35,58,NULL,'3.2.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (710,35,70,NULL,'2000 PRO SP3 ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (711,35,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (713,189,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (714,189,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (715,189,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (717,118,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (719,118,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (720,118,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (721,119,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (723,119,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (724,119,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (725,120,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (727,120,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (728,120,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (729,121,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (730,121,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (731,121,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (733,122,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (734,122,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (735,122,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (737,123,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (739,123,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (740,123,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (742,102,7,NULL,'3.3.4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (743,107,42,NULL,'5.5',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (745,142,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (747,116,69,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (748,116,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (749,193,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (750,193,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (751,193,58,NULL,'3.2.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (752,193,71,NULL,'RC11',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (755,18,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (756,111,59,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (758,128,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (759,128,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (760,177,75,NULL,'6.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (761,177,70,NULL,'NT Workstation 4.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (762,177,59,NULL,'5.2 IE',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (768,114,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (769,114,83,NULL,'1.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (770,194,70,NULL,'NT Workstation 4.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (771,194,59,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (772,194,84,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (773,196,70,NULL,'NT Workstation 4.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (779,198,70,NULL,'NT 4 ITA + SP6a',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (780,198,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (787,198,59,NULL,'5.2 PROFIBUS',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (788,198,75,NULL,'6.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (794,162,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (805,199,70,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (807,199,69,NULL,'XP',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (808,99,72,NULL,'1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (810,164,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (811,164,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (817,204,70,NULL,'2000 professional US',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (818,204,69,NULL,'2003 US',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (819,204,71,NULL,'RC11b',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (820,202,70,NULL,'2000 PRO USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (821,202,69,NULL,'2003 USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (822,202,72,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (823,203,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (824,203,58,NULL,'3.1.3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (825,203,69,NULL,'2003',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (827,208,70,NULL,'2000 Pro USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (828,208,69,NULL,'2003 Basic USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (829,208,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (830,208,58,NULL,'3.1.03',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (831,208,71,NULL,'RC11',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (832,209,70,NULL,'NT 4 SP6 ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (833,209,84,NULL,'23.10.2002',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (834,209,7,NULL,'3.3.3 R2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (835,170,70,NULL,'NT ITA SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (836,213,70,NULL,'200 pro ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (837,215,70,NULL,'2000 PRO USA + SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (838,215,86,NULL,'2003 Basic USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (839,211,70,NULL,'2000 PRO USA + SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (840,211,86,NULL,'2003 BASIC USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (841,211,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (842,211,71,NULL,'RC 18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (843,211,58,NULL,'3.1.5',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (844,213,87,NULL,'R1.0A',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (845,213,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (846,217,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (847,217,58,NULL,'3.1.9',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (848,190,86,NULL,'XP SBE',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (850,215,72,NULL,'1.0.12',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (851,215,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (852,118,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (853,119,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (854,120,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (855,121,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (856,122,71,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (857,189,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (858,123,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (859,190,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (860,219,62,NULL,'6.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (861,219,88,NULL,'1.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (862,220,70,NULL,'2000 Pro USA + SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (863,220,49,NULL,'6.0 SP2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (864,220,59,NULL,'07/2001',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (865,35,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (866,221,70,NULL,'XP pro ITA + SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (867,221,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (868,221,86,NULL,'XP SBE',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (869,222,70,NULL,'2000 Pro ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (870,222,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (871,222,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (872,222,86,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (873,183,75,NULL,'6.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (874,183,70,NULL,'NT WKS 4.0 ITA SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (875,225,70,NULL,'2000 PRO ITA + SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (876,225,59,NULL,'2005',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (877,225,49,NULL,'6.0+SP2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (878,225,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (879,226,70,NULL,'2000 PRO ITA + SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (880,226,59,NULL,'6.2+SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (881,226,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (882,219,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (883,227,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (884,227,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (885,180,70,NULL,'95b ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (886,180,91,NULL,'4.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (887,180,71,NULL,'RC11b',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (888,114,7,NULL,'3.3.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (889,227,92,NULL,'?',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (890,228,58,NULL,'3.1.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (891,228,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (892,228,69,NULL,'2000 PRO ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (893,228,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (894,228,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (895,100,59,NULL,'SOFTNET S7/PB',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (896,100,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (897,100,93,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (898,210,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (899,210,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (900,210,63,NULL,'4.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (902,210,94,NULL,'3.2.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (903,210,95,NULL,'1.0.3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (904,205,70,NULL,'2000 pro ita+sp4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (905,205,59,NULL,'6.3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (906,205,49,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (907,205,71,NULL,'rc18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (908,129,70,NULL,'2000 PRO ITA SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (909,129,58,NULL,'3.2.10',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (910,129,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (911,129,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (912,129,69,NULL,'2000',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (915,229,70,NULL,'XP PRO ITA + SP2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (916,229,49,NULL,'6.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (918,229,86,NULL,'2000 ITA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (919,229,58,NULL,'3.0.32',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (920,229,97,NULL,'5.3+sp1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (921,229,96,NULL,'3.2+SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (922,229,71,NULL,'1.0 RC20',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (923,229,57,NULL,'premiere 6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (924,212,70,NULL,'XP Pro SP2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (926,98,111,NULL,'6.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (927,231,70,NULL,'2000 ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (928,231,71,NULL,'1.0.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (929,231,59,NULL,'2005+sp1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (930,230,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (931,230,59,NULL,'2005+sp1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (932,230,49,NULL,'6.0',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (933,230,71,NULL,'1.0.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (934,142,86,NULL,'PRO ITA FULL',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (935,103,117,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (936,148,70,NULL,'200O PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (940,162,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (941,166,69,NULL,'XP SBE',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (942,167,69,NULL,'XP SBE',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (943,178,65,NULL,'6.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (944,178,70,NULL,'NT workstation 4 SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (945,179,70,NULL,'NT workstation 4 SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (946,181,111,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (947,184,70,NULL,'NT workstation 4 SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (948,203,70,NULL,'2000 USA+SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (949,234,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (950,233,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (952,232,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (953,97,111,NULL,'6.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (956,124,86,NULL,'XP SBE',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (957,124,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (958,124,30,NULL,'2.23',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (959,125,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (960,125,86,NULL,'XP SBE',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (961,134,70,NULL,'2000 PRO USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (962,38,71,NULL,'RC18',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (963,113,75,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (964,113,59,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (965,111,75,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (966,110,75,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (967,112,75,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (968,112,59,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (969,115,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (970,115,49,NULL,'6 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (971,137,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (972,138,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (973,143,69,NULL,'XP SBE TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (974,145,49,NULL,'6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (975,145,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (976,146,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (977,146,70,NULL,'2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (978,146,49,NULL,'6.0 SP1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (979,147,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (980,147,70,NULL,'2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (981,147,83,NULL,'1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (982,148,86,NULL,'XP SBE USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (983,149,86,NULL,'XP SBE USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (984,149,70,NULL,'200O PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (985,149,72,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (986,148,72,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (987,150,72,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (988,150,86,NULL,'XP SBE USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (989,150,70,NULL,'200O PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (990,151,70,NULL,'200O PRO TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (991,151,86,NULL,'XP SBE TED',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (992,151,58,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (993,152,83,NULL,'1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (994,152,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (995,155,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (997,158,70,NULL,'2000 PRO',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (998,218,70,NULL,'2000 PRO ITA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (999,218,49,NULL,'6.0 SP3',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1000,218,59,NULL,'2005',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1001,218,83,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1002,218,118,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1003,223,84,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1004,223,70,NULL,'NT4 ITA SP6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1005,134,59,NULL,'6.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1006,134,63,NULL,'4.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1007,134,83,NULL,'1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1008,152,63,NULL,'4.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1009,207,70,NULL,'2000 PRO ITA SP4',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1010,207,69,NULL,'2000 ITA',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1011,207,71,NULL,'1.01',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1012,207,30,NULL,'2.23',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1013,207,58,NULL,'3.2',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1014,235,70,NULL,'2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1015,235,49,NULL,'RT 6.0 SP3 2048 tags',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1016,235,59,NULL,'2005 HOTFIX 1',0);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1017,235,71,NULL,'1.0.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1019,235,93,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1020,235,83,NULL,'',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1021,195,70,NULL,'NT 4 SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1022,195,75,NULL,'6.6',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1023,195,59,NULL,'5.3 PROFIBUS S7',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1024,115,83,NULL,'1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1025,237,70,NULL,'2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1026,237,86,NULL,'2003 STD USA RET',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1027,237,71,NULL,'1.0.1',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1028,238,70,NULL,'2000 PRO USA SP4',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1029,238,86,NULL,'2000 STD USA',1);
INSERT INTO `elencosw` (`ID`,`computer`,`software`,`SN`,`Versione`,`Licenza`) VALUES (1030,238,58,NULL,'3.2',1);

#
# Table Objects for table impianti
#

CREATE TABLE `impianti` (
  `id_aziende` int(11) NOT NULL default '0',
  `progressivoimpianto` int(11) NOT NULL default '0',
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id_aziende`,`progressivoimpianto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table impianti
#

INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,-1,'posizione generica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,1,'linea 31');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,2,'Linea 32');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,3,'Linea 33');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,4,'Linea 34');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,5,'Linea 35');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,6,'Linea 39');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,7,'Linea 41');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,8,'Linea 42');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,9,'Linea 43');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,10,'Linea 45');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,11,'Linea 46');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,12,'Linea 48');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,13,'Linea 49');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,14,'Linea 50');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,15,'Linea 51');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,16,'Linea 52');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,17,'Linea 53');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,18,'Linea 54');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,19,'Linea 55');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,20,'Linea 56');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,21,'Linea 57');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,22,'Linea 58');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,23,'Linea 60');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,24,'Linea 61');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,25,'Linea 63');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,26,'Linea 64');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,27,'Linea 65');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,28,'Linea 66');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,44,'Cabina 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (1,71,'Sala Sciroppi');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (4,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (4,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,-1,'posizione generica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,1,'Linea A');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,2,'Linea B');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,3,'linea C');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,4,'Linea D');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,5,'Linea E');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,6,'Linea F');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,7,'Linea G');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,8,'Linea H');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (5,43,'Officina elettrica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (6,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (6,3,'Linea 3');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (7,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (7,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (7,3,'Linea 3');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (8,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (8,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (8,3,'Linea 3');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (8,4,'Linea 4');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (8,5,'Linea 5');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (9,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (9,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (10,41,'Carico silos');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (11,-1,'posizione generica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (11,1,'Linea 1 - Vetro');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (11,2,'Linea 2 - PET');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (13,-1,'Generico');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (13,0,'Magazzino officina elettrica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (13,1,'Riparazione:ASEM');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (13,50,'ANVA - V.moglianese');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (13,99,'Discontinuato');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (14,-1,'posizione generica');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (14,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (14,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (15,1,'Linea 1');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (15,2,'Linea 2');
INSERT INTO `impianti` (`id_aziende`,`progressivoimpianto`,`descrizione`) VALUES (15,3,'Linea 3');

#
# Table Objects for table interventi
#

CREATE TABLE `interventi` (
  `ID` int(11) NOT NULL default '0',
  `Stampante` int(11) default NULL,
  `Data` date default NULL,
  `Data1` varchar(20) default NULL,
  `TipoIntervento` int(11) default NULL,
  `NStampe` int(11) default NULL,
  `Note` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table interventi
#

INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (6,68,'2003-11-10','10/11/2003 11:18:49',7,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (7,68,'2003-11-10','10/11/2003 11:19:10',32,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (12,13,'2003-11-10','10/11/2003 11:37:52',34,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (13,13,'2003-11-10','10/11/2003 11:37:54',1,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (15,29,'2003-11-10','10/11/2003 12:17:34',17,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (16,29,'2003-11-10','10/11/2003 12:17:41',3,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (17,29,'2003-11-10','10/11/2003 12:17:59',13,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (18,29,'2003-11-10','10/11/2003 12:18:10',18,0,NULL);
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (28,40,'2003-11-19','19/11/2003',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (29,40,'2003-11-19','19/11/2003',34,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (30,25,'2003-11-24','24/11/2003',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (33,68,'2003-11-24','24/11/2003',17,122651,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (34,68,'2003-11-24','24/11/2003',33,122651,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (35,8,'2003-07-25','25/07/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (36,10,'2003-09-08','08/09/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (37,15,'2002-07-22','22/07/2002',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (38,3,'2003-09-04','04/09/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (39,3,'2003-09-04','04/09/2003',8,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (40,3,'2003-09-04','04/09/2003',35,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (41,3,'2003-10-02','02/10/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (42,1,'2002-05-10','10/05/2002',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (43,6,'2003-08-26','26/08/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (44,12,'2002-06-10','10/06/2002',31,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (45,12,'2002-11-18','18/11/2002',8,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (46,30,'2003-09-22','22/09/2003',31,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (47,30,'2003-10-07','07/10/2003',9,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (48,19,'2003-09-01','01/09/2003',8,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (49,19,'2003-09-01','01/09/2003',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (50,19,'2003-09-01','01/09/2003',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (51,19,'2003-09-01','01/09/2003',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (52,28,'2002-07-19','19/07/2002',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (53,40,'2003-11-19','19/11/2003',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (54,40,'2003-11-29','29/11/2003',14,2,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (55,21,'2003-12-01','01/12/2003',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (56,24,'2003-12-02','02/12/2003',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (57,21,'2004-01-05','05/01/2004',30,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (59,28,'2004-01-09','09/01/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (60,28,'2004-01-09','09/01/2004',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (61,11,'2004-01-29','29/01/2004',17,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (62,11,'2004-01-29','29/01/2004',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (63,11,'2004-01-29','29/01/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (65,48,'2004-02-05','05/02/2004',24,0,'EX VOLVIC');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (66,1,'2004-02-03','03/02/2004',8,0,'Stampava senza dare I2.6');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (67,54,'2004-03-01','01/03/2004',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (68,54,'2004-03-01','01/03/2004',24,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (69,55,'2004-03-01','01/03/2004',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (70,55,'2004-03-01','01/03/2004',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (71,55,'2004-03-01','01/03/2004',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (72,2,'2004-03-09','09/03/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (73,2,'2004-03-09','09/03/2004',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (74,5,'2004-03-09','09/03/2004',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (75,5,'2004-03-09','09/03/2004',19,0,'rullo testina usato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (76,5,'2004-03-09','09/03/2004',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (77,40,'2004-03-12','12/03/2004',37,0,'Regolato contro-lama e messo frena filetti sulle viti fissaggio');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (78,56,'2004-04-07','07/04/2004',24,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (79,56,'2004-04-07','07/04/2004',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (80,56,'2004-04-07','07/04/2004',7,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (81,56,'2004-04-07','07/04/2004',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (82,56,'2004-04-07','07/04/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (83,21,'2004-04-28','28/04/2004',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (84,3,'2004-04-30','30/04/2004',38,0,'riparata in linea');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (85,22,'2004-04-30','30/04/2004',38,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (86,28,'2004-05-12','12/05/2004',1,0,'31 dot rotti, testa segnata da oggetto ext');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (87,58,'2004-05-28','28/05/2004',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (88,19,'2004-06-03','03/06/2004',1,0,'18 dots rotti (problemi di lettura scanner)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (89,14,'2004-06-09','09/06/2004',38,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (90,66,'2004-06-28','28/06/2004',39,0,'printer NUOVA!\r\ns/n head = 43-00056\r\nsettata e provata\r\n');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (91,19,'2004-07-01','01/07/2004',1,0,'31 dots rotti (problemi di lettura scanner)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (92,29,'2004-07-01','01/07/2004',7,0,'No alimentazione salvato dopo 5-10 etichette');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (93,29,'2004-07-01','01/07/2004',8,0,'Nella linea 31 dava problemi di stampante bloccata o senza lavoro');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (94,28,'2004-07-13','13/07/2004',1,0,'78 dot rotti');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (95,68,'2004-07-16','16/07/2004',14,0,'reinserita la stampante xché era stata cancellata');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (96,25,'2004-07-20','20/07/2004',31,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (97,25,'2004-07-20','20/07/2004',37,0,'viti di fissaggio lama mollate');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (98,34,'2004-07-23','23/07/2004',20,0,'completamente senza materiale gommoso');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (99,28,'2004-08-03','03/08/2004',19,0,'ci sono 18 dot rotti, sopra il 1500');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (100,28,'2004-08-03','03/08/2004',37,0,'pulizia e controllo generale');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (101,28,'2004-08-03','03/08/2004',36,0,'sostituita ventola perché bloccata');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (102,14,'2004-08-04','04/08/2004',1,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (103,68,'2004-08-04','04/08/2004',1,0,'9 dot rotti e dava spesso etichetta non letta');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (104,14,'2004-08-06','06/08/2004',10,0,'scheda lift-motor');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (105,76,'2004-08-16','16/08/2004',10,0,'scheda feed motor');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (106,6,'2004-08-19','19/08/2004',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (107,6,'2004-08-19','19/08/2004',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (108,6,'2004-08-19','19/08/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (109,6,'2004-08-19','19/08/2004',39,0,'aggiornato firmware da 2.46 a 3.01 - manutenzione generale');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (110,29,'2004-08-24','24/08/2004',8,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (111,14,'2004-08-25','25/08/2004',1,0,'80 dots rotti');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (112,4,'2004-08-30','30/08/2004',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (113,4,'2004-08-30','30/08/2004',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (114,4,'2004-08-30','30/08/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (115,36,'2004-09-07','07/09/2004',24,0,'raffreddamento stampante');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (116,37,'2004-09-07','07/09/2004',7,0,'mancanza dei 5V, non si accendeva con pulsante su display');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (117,34,'2004-09-07','07/09/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (118,34,'2004-09-07','07/09/2004',21,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (119,34,'2004-09-07','07/09/2004',39,0,'riparazione ruota libera rullo freno');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (120,58,'2004-09-15','15/09/2004',38,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (121,58,'2004-09-15','15/09/2004',39,0,'tirato cinghia dentata trascinamento etichetta');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (122,58,'2004-09-15','15/09/2004',1,0,'sostituita con una già usata con n°1 Dot rotto');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (123,2,'2004-09-21','21/09/2004',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (124,2,'2004-09-21','21/09/2004',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (125,2,'2004-09-21','21/09/2004',39,0,'pulizia generale elettrica e meccanica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (126,2,'2004-09-22','22/09/2004',31,0,' ');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (127,14,'2004-09-24','24/09/2004',1,0,'127 dot rotti da 495 a 1353');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (128,21,'2004-10-07','07/10/2004',1,0,'sotituita xché mancava + regolazione della nuova');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (129,21,'2004-10-07','07/10/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (130,21,'2004-10-07','07/10/2004',17,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (131,21,'2004-10-07','07/10/2004',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (132,21,'2004-10-07','07/10/2004',39,0,'aggiornamento firmware da 2.47 a 3.01');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (133,29,'2004-10-11','11/10/2004',1,0,'29 dots rotti + regolazione della nuova');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (134,15,'2004-10-12','12/10/2004',14,0,'pulizia frizione ribbon');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (135,57,'2004-10-18','18/10/2004',7,0,'alimentatore standard riparato!');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (136,36,'2004-10-29','29/10/2004',1,0,'riparato alimentatore x mancanza 5Vdc (condensatori)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (137,10,'2004-11-09','09/11/2004',14,36000,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (138,10,'2004-11-09','09/11/2004',19,36000,'usura e piccoli tagli visibili');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (139,10,'2004-11-09','09/11/2004',39,36000,'rettifica frizioni ribbon / pulizia contatti elettrici / controllo cinghia dispenser OK /');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (140,29,'2004-11-18','18/11/2004',39,0,'-pulizia contatti + disossidante per errori \\\"errPC..0ad34xxx\\\"\r\n-controllo di stampa');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (141,21,'2004-11-19','19/11/2004',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (142,21,'2004-11-19','19/11/2004',39,0,'pulizia / disossidante / fissaggio grani su pignone rullo dispenser per slittamenti /');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (143,2,'2004-11-30','30/11/2004',39,0,'pulizia con disossidante ai connettori (ERRORE TESTINA su display) + aggiunto due rullini zigrinati');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (144,15,'2004-11-30','30/11/2004',13,0,'sostituita perchè rotta');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (145,15,'2004-11-30','30/11/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (146,15,'2004-11-30','30/11/2004',39,0,'aggiunto rullino zigrinato + pulizia con disossidante su tutti i connettori');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (147,3,'2004-12-13','13/12/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (148,3,'2004-12-13','13/12/2004',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (149,3,'2004-12-13','13/12/2004',39,0,'messo disossidante su contatti');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (150,3,'2004-12-13','13/12/2004',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (151,57,'2004-12-13','13/12/2004',30,0,'sia pressione su rullo che qualità di stampa');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (152,57,'2004-12-13','13/12/2004',39,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (153,25,'2004-12-16','16/12/2004',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (154,25,'2004-12-16','16/12/2004',37,0,'smontaggio, pulizia, regolazione');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (155,25,'2004-12-16','16/12/2004',39,0,'regolazione testina per etichette plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (156,15,'2004-12-21','21/12/2004',30,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (157,15,'2004-12-21','21/12/2004',39,0,'regolato asse testina perchè il foil si strappava spesso  e faceva le pieghe.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (158,10,'2005-01-12','12/01/2005',39,68000,' Problema di etichetta che si ferma circa 15mm in anticipo / pulizia contatti elettrici /');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (159,15,'2005-01-13','13/01/2005',1,0,'installata la testina della stampante n°10 con 8 dot rotti (la ex testa  di questa stampante con dot OK è stata installata nella stampante n°10 di scorta)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (160,10,'2005-01-13','13/01/2005',1,0,'installata la testina della stampante n°15 con dot OK (la ex testa di questa stampante con 8 dot rotti è stata installata nella stampante n°15 in imp55)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (161,20,'2005-01-18','18/01/2005',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (162,20,'2005-01-18','18/01/2005',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (163,20,'2005-01-18','18/01/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (164,20,'2005-01-18','18/01/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (165,20,'2005-01-18','18/01/2005',17,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (166,20,'2005-01-18','18/01/2005',39,0,'Aggiunto un rullino zigrinato + pulizia dei contatti con disossidante');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (167,19,'2005-01-18','18/01/2005',19,0,'cambiato perchè la qualità di stampa non era buona (rullo usurato)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (168,15,'2005-01-24','24/01/2005',7,0,'Messo alimentatore riparato!\r\nProblemi di blocco casuale motori durante la stampa, feed, ribbon, dispenser.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (169,10,'2005-01-24','24/01/2005',39,0,'difetto: rullo dispenser che \\\"sgrana\\\". Disossidante su contatti, pulizia e controllo fissaggio pignoni e cinghia dispenser.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (171,10,'2005-01-28','28/01/2005',25,0,'sostituito per prova perchè qualche volta sgranava.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (172,12,'2005-01-31','31/01/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (173,12,'2005-01-31','31/01/2005',39,0,'DIFETTO: dispenser sgrana.\r\nPulizia con disossidante ai contatti + stretto fili su connettori di alimentazione su schede motori + manutenzione rullo pressore (messo KU nuovi) e rullino removibile + fatte circa 200 stampe senza problemi');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (174,15,'2005-01-31','31/01/2005',10,0,'sostituita prima scheda motore cioè quella del feed (a volte non faceva il backfeed)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (175,15,'2005-01-31','31/01/2005',39,0,'testata con circa 100 etichette (di plastica)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (176,1,'2005-02-02','02/02/2005',7,0,'difetto: \\\"no alimentatore salvato\\\" a metà stampa etichetta. Usato alimentatore riparato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (177,13,'2005-02-15','15/02/2005',8,0,'A volte usciva l\'etichetta senza consenso');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (178,53,'2005-02-18','18/02/2005',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (179,11,'2005-02-24','24/02/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (180,11,'2005-02-24','24/02/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (181,11,'2005-02-24','24/02/2005',17,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (182,11,'2005-02-24','24/02/2005',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (183,11,'2005-02-24','24/02/2005',19,0,'aveva una piccola fossache causava un \"buco\" bianco nell\'etichetta');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (184,11,'2005-02-24','24/02/2005',30,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (185,11,'2005-02-24','24/02/2005',39,0,'pulito con disossidante tutti i contatti + fatto prove di stampa con etichette in plastica con esiti positivi (non fa le righe) + installato due rulli antistatici in prova + sostituito KU nel rullo pressione.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (186,68,'2005-03-11','11/03/2005',17,0,'era molto segnato con il taglierino e strappava spesso la silconata');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (187,68,'2005-03-11','11/03/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (188,68,'2005-03-11','11/03/2005',19,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (189,68,'2005-03-11','11/03/2005',39,0,'pulizia generale + disossidante sui connettori');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (190,68,'2005-03-11','11/03/2005',30,0,'regolato testina per le etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (191,10,'2005-03-16','16/03/2005',14,0,'cinghia rotta!');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (192,20,'2005-03-16','16/03/2005',39,0,'Rullo dispenser senza fermo e uscito dalla sede (OK); sostituiti KU; rimesso segger lift motor; fissato motore dispenser perché senza 2 viti! modifica flat display');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (193,78,'2005-03-19','19/03/2005',19,0,'Visibilmente usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (194,78,'2005-03-19','19/03/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (195,78,'2005-03-19','19/03/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (196,78,'2005-03-19','19/03/2005',39,0,'pulizia generale con disossidante sui connettori + cablato flat corto + prova con etichette in plastica + aggiunto un rullino zigrinato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (197,40,'2005-04-01','01/04/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (198,40,'2005-04-01','01/04/2005',30,0,'regolata distanza testa-rullo stampa perchè troppo piccola');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (199,30,'2005-04-07','07/04/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (200,30,'2005-04-07','07/04/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (201,30,'2005-04-07','07/04/2005',17,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (202,30,'2005-04-07','07/04/2005',18,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (203,30,'2005-04-07','07/04/2005',19,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (204,30,'2005-04-07','07/04/2005',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (205,30,'2005-04-07','07/04/2005',39,0,'DIFETTO: schiaccia la stampa,da manutenzionare. Sostituiti KU su rullo pressore + disossidante su contatti + testina con 6 dot + prova con etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (206,79,'2005-04-13','13/04/2005',39,0,'nuova! inviata a G.Guizza!\r\nsn testa: 52-00115\r\nsn CPU: 0940011400015\r\nsn alim: 408300689');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (207,55,'2005-05-16','16/05/2005',1,0,'s/n 46-00144');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (208,55,'2005-05-16','16/05/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (209,55,'2005-05-16','16/05/2005',20,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (210,55,'2005-05-16','16/05/2005',24,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (211,55,'2005-05-16','16/05/2005',30,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (212,55,'2005-05-16','16/05/2005',39,0,'testata USI; test RS485; pulizia contatti con disossidante;');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (213,52,'2005-05-17','17/05/2005',7,0,'il vecchio alimentatore non aveva i 5V quindi il display non si accendeva');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (214,17,'2005-05-18','18/05/2005',39,0,'riparato micro \\\"rullo pressione\\\" + provata in officina');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (215,58,'2005-06-01','01/06/2005',39,0,'Difetto: Test 5025\r\nLavori: Pulito con disossidante tutti i contatti, test macchina completa (con PC)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (216,3,'2005-06-07','07/06/2005',17,0,'\\\"non sfoglia\\\"');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (217,3,'2005-06-07','07/06/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (218,3,'2005-06-07','07/06/2005',20,0,'tagliato!');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (219,3,'2005-06-07','07/06/2005',39,0,'pulizia contatti elettrici; messi spessori battuta ribbon;');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (220,78,'2005-06-10','10/06/2005',39,0,'riparato sensore gap etichetta  con attack perchè rotto + pulizia generale con disossidante sui connettori + prova con etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (221,2,'2005-06-16','16/06/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (222,2,'2005-06-16','16/06/2005',17,0,'tagliato e usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (223,2,'2005-06-16','16/06/2005',9,0,'non funzionava la porta LPT1 (non è stato collegato il conn. CN18 perchè non so dove collegarlo)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (224,2,'2005-06-16','16/06/2005',39,0,'pulizia con disossidante ai connettori e interfaccia USI (a volte stampava senza la presenza del Q1.6) + test di tampa con tester USI');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (225,34,'2005-06-27','27/06/2005',38,0,'riparata molla perchè rotta');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (226,10,'2005-06-29','29/06/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (227,10,'2005-06-29','29/06/2005',39,0,'pulizia generale + inserimento molla ballerino');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (228,25,'2005-06-30','30/06/2005',1,0,'23 dot rotti; a volte venivano stampate righe verticali nere es. il codice a barre prolungato per tutta l\'etichetta;');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (229,80,'2005-07-04','04/07/2005',1,0,'sostituita perchè aveva 7 dot consecutivi  lungo il codice a barre. Testina nuova ha come S/N 35-01193 CAC R:1085 (tutti i dots OK)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (230,80,'2005-07-04','04/07/2005',24,0,'bloccata');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (231,80,'2005-07-04','04/07/2005',19,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (232,80,'2005-07-04','04/07/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (233,80,'2005-07-04','04/07/2005',34,0,'quando si premeva il feed scendeva anche il ribbon');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (234,80,'2005-07-04','04/07/2005',39,0,'messo spessori ribbon (6mm) + pulizia con disossidante su tutti i contatti + messo frena filetti e fissato viti su frizione foil + provata con RS485 e tester USI');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (235,17,'2005-07-06','06/07/2005',17,0,'difetto: durante lo sfoglio il rullo girava strappi perchè era usurato (tagli e buchi grandi)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (236,17,'2005-07-06','06/07/2005',13,0,'usura');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (237,17,'2005-07-06','06/07/2005',39,0,'pulizia generale con disossidante su tutti i contatti + test');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (238,28,'2005-07-06','06/07/2005',1,0,'65 dot rotti (sparsi)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (239,40,'2005-07-08','08/07/2005',1,0,'159 dot rotti');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (240,40,'2005-07-12','12/07/2005',1,0,'106 dot rotti (sparsi fino al n° 449)  ');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (241,9,'2005-07-20','20/07/2005',1,0,'sostituita perchè mancava + regolata per etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (242,9,'2005-07-20','20/07/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (243,9,'2005-07-20','20/07/2005',17,0,'tagliato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (244,9,'2005-07-20','20/07/2005',39,0,'pulizia generale stampante + test con etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (245,28,'2005-07-29','29/07/2005',39,0,'riscontrata testina con 9 dot rotti (8dot tra il 404 ed il 442, 1dot il 977)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (246,40,'2005-08-03','03/08/2005',1,0,'65 dot rotti');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (247,40,'2005-08-03','03/08/2005',39,0,'regolato albero testina, leggermente disassato!');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (248,13,'2005-08-11','11/08/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (249,13,'2005-08-11','11/08/2005',17,0,'tagliato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (250,13,'2005-08-11','11/08/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (251,13,'2005-08-11','11/08/2005',19,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (252,13,'2005-08-11','11/08/2005',39,0,'difetto: non sfogliava bene.\r\nlavori: pulizia generale meccanica ed elettrica (disossidante) + installazione cavo remotazione display nuovo + test con etichette in plastica');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (253,10,'2005-08-22','22/08/2005',39,0,'Regolazione posizionamento testina xché premeva sempre sul rullo di stampa.');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (254,78,'2005-09-01','01/09/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (255,78,'2005-09-01','01/09/2005',39,0,'pulizia generale con disossidante + il rullo dispenser è abbastanza rovinato (da cambiare quando arriva) + prova con etichette in plastica ');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (256,35,'2005-09-07','07/09/2005',34,0,'riparato con attack la camma della testina');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (257,35,'2005-09-07','07/09/2005',7,0,'sostituito perchè la ventola di raffreddamento non funzionava');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (258,35,'2005-09-07','07/09/2005',39,0,'pulizia generale meccanica ed elettrica + inseriti spessori ribbon + test OK');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (259,15,'2005-09-21','21/09/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (260,15,'2005-09-21','21/09/2005',18,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (261,15,'2005-09-21','21/09/2005',19,0,'usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (262,15,'2005-09-21','21/09/2005',39,0,'manutenzione preventiva: pulizia generale elettrica e meccanica, sostituito KU del rullo pressione, messo spessori ribbon, test con etichette in plastica, messo flat corto');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (263,6,'2005-09-23','23/09/2005',13,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (264,6,'2005-09-23','23/09/2005',14,0,'');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (265,6,'2005-09-23','23/09/2005',18,0,'visibilmente usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (266,6,'2005-09-23','23/09/2005',19,0,'visibilmente usurato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (267,6,'2005-09-23','23/09/2005',39,0,'manutenzione preventiva: pulizia generale elettrica e meccanica (disossidante) + pulizia KU rullo pressione e rullino removibile + test con etichette in plastica + messo spessori ribbon + cablato flat corto per display');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (268,82,'2005-09-27','27/09/2005',19,0,'tagliato');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (269,82,'2005-09-27','27/09/2005',24,0,'bloccata');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (270,82,'2005-09-27','27/09/2005',1,0,'messo una testina nuova perchè mancava (S\\N: 55-00218\\R1323\\CAX\\JAPAN)');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (271,82,'2005-09-27','27/09/2005',30,0,'regolato asse testina e pressione');
INSERT INTO `interventi` (`ID`,`Stampante`,`Data`,`Data1`,`TipoIntervento`,`NStampe`,`Note`) VALUES (272,82,'2005-09-27','27/09/2005',39,0,'Difetto: da sistemare distanza tra testina di stampa e rullo di contrasto (provato varie regolazioni con esito negativo); montare testina di stampa (quella di scorta era senza). CARPENEDO G. Lavori: messo JP100 su interfaccia USI per far funzionare il tester USI + pulizia elettrica e meccanica (disossidante) + test di stampa con parallela');

#
# Table Objects for table interventipc
#

CREATE TABLE `interventipc` (
  `ID` int(11) NOT NULL default '0',
  `CodIntervento` varchar(5) default NULL,
  `Nome` varchar(20) default NULL,
  `Valore` varchar(50) default NULL,
  `Apparecchio` int(11) default NULL,
  `data` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table interventipc
#


#
# Table Objects for table ipaddr_ip
#

CREATE TABLE `ipaddr_ip` (
  `id_ipaddr_aziende` int(11) default NULL,
  `livello` int(11) default NULL,
  `reparto` int(11) default NULL,
  `macchina` int(11) default NULL,
  `ip` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table ipaddr_ip
#

INSERT INTO `ipaddr_ip` (`id_ipaddr_aziende`,`livello`,`reparto`,`macchina`,`ip`) VALUES (1,0,0,1,'23445');

#
# Table Objects for table ipaddr_macchine
#

CREATE TABLE `ipaddr_macchine` (
  `livello` int(11) NOT NULL auto_increment,
  `tipomacchina` int(11) NOT NULL default '0',
  `id_ipaddr_tipireparto` char(1) NOT NULL default '',
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`livello`,`tipomacchina`,`id_ipaddr_tipireparto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table ipaddr_macchine
#


#
# Table Objects for table ipaddr_reparti
#

CREATE TABLE `ipaddr_reparti` (
  `id_reparto` int(11) NOT NULL default '0',
  `descrizione` varchar(100) default NULL,
  `id_ipaddr_tipireparto` char(1) default NULL,
  PRIMARY KEY  (`id_reparto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table ipaddr_reparti
#

INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (0,'reparto prova','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (1,'Impianto n° 1','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (2,'Impianto n° 2','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (3,'Impianto n° 3','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (4,'Impianto n° 4','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (5,'Impianto n° 5','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (6,'Impianto n° 6','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (7,'Impianto n° 7','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (8,'Impianto n° 8','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (9,'Impianto n° 9','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (10,'Impianto n° 10','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (11,'Impianto n° 11','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (12,'Impianto n° 12','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (13,'Impianto n° 13','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (14,'Impianto n° 14','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (15,'Impianto n° 15','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (16,'Impianto n° 16','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (17,'Impianto n° 17','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (18,'Impianto n° 18','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (19,'Impianto n° 19','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (20,'Impianto n° 20','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (21,'Impianto n° 21','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (22,'Impianto n° 22','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (23,'Impianto n° 23','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (24,'Impianto n° 24','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (25,'Impianto n° 25','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (26,'Impianto n° 26','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (27,'Impianto n° 27','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (28,'Impianto n° 28','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (29,'Impianto n° 29','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (30,'Impianto n° 30','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (31,'Impianto n° 31','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (32,'Impianto n° 32','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (33,'Impianto n° 33','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (34,'Impianto n° 34','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (35,'Impianto n° 35','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (36,'Impianto n° 36','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (37,'Impianto n° 37','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (38,'Impianto n° 38','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (39,'Impianto n° 39','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (40,'Impianto n° 40','I');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (41,'Generico','P');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (42,'Generico','T');
INSERT INTO `ipaddr_reparti` (`id_reparto`,`descrizione`,`id_ipaddr_tipireparto`) VALUES (43,'Generico','S');

#
# Table Objects for table ipaddr_tipireparto
#

CREATE TABLE `ipaddr_tipireparto` (
  `id_tiporeparto` char(1) NOT NULL default '',
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id_tiporeparto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table ipaddr_tipireparto
#

INSERT INTO `ipaddr_tipireparto` (`id_tiporeparto`,`descrizione`) VALUES ('I','Impianti');
INSERT INTO `ipaddr_tipireparto` (`id_tiporeparto`,`descrizione`) VALUES ('P','Plastica');
INSERT INTO `ipaddr_tipireparto` (`id_tiporeparto`,`descrizione`) VALUES ('S','Servizi');

#
# Table Objects for table modellistampante
#

CREATE TABLE `modellistampante` (
  `id` int(11) NOT NULL auto_increment,
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table modellistampante
#

INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (1,'CHESS 6406');
INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (2,'DPM 06 LH');
INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (3,'DPM 06 RH');
INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (4,'DPM 05 LH mod.');
INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (5,'DPM 05 RH mod.');
INSERT INTO `modellistampante` (`id`,`descrizione`) VALUES (6,'ALX926 LH');

#
# Table Objects for table monitorxml
#

CREATE TABLE `monitorxml` (
  `ID` varchar(255) NOT NULL default '',
  `PC` int(11) NOT NULL default '0',
  `XML` text,
  `data` date default NULL,
  `data1` varchar(20) default NULL,
  PRIMARY KEY  (`ID`,`PC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table monitorxml
#

INSERT INTO `monitorxml` (`ID`,`PC`,`XML`,`data`,`data1`) VALUES ('3e7163d2652321419fd9c66970a63332',142,'eJztW21v2zgS/iu84j60dxtJ1IstG1otFNtpjcYvZ7ntYjeLBS2xCRFJFCQ5bfJhf/sNKdmWX+KqTVsUqA0kJocznOHD4Qxlj53fPsYRuqNZznjy6zOsaM8QTQIesuT612cs52e2bXXO8LPfXIcl7/k0cJ2CFTzi7jTjAQ2XGUEhQwFPioxHEUcUxTwBjoxcXzOOgojRpHDUSsipVFE/yFhauFhXbEfdITohKcgExGFYxZqqa5rlqGuiA3OXo1pX17tG21FXFOeWfVxN5pqKrjtqneIkPKZvCjAI2v/6s9f35t6fXhizhOVFRsDov/5yHbXOtcxpNgyPca84Qi5GuDubzCfjvgcGVwSptcfjNKIF38y0VrUZEj1AeD1D1XeCdOkOwZzo+ewFmoJhbBmLpol60zdIVzTt5asHRxVsTnzz4OJOp+WoouUU9yn1ufuOJSH/kCOAUkOwc+9pLiAhEexMybHeGddStM2WuM5iyaLQ1XEH9qBsO7DiOxbQKQluXb9sI9FBpqPWx5wI3GhJXM3E2rAgESOJo1Y0J814uAyov2SAMwKVWwQxnGaMFiRjNdD8ZSrml6ahnqeMJmMFeVFEspghAsAkAU1CxiW421OIFQ0+phHPaLaZsKVoim5rmoKx1pJS23wxyQJS235/MMpTIhmroZiHNIpqNr57NfxjOpuUPKvBgqXi8EwDdMHynIsDIQlOHtzQkNyxkPKtTkhzOA0P5R6spp4RGElQ24JdVOXb5UDqeUywTs/YXX3lsM2wdNhWBe9NUbGqW8YBlncsotfskgckOnqC9lgXJAluWExjnjFSdvnB3t8FuXanN/c5A0E0EsR7hMHzdnm2pSLQUy65PxyN9gQ2w6VYQFISsIK4ltGy21oH65XAeqDku6MgKbvqTl92xR66/Zk3qoZlf1t11a2tvWq8XtSVb4iORHu061TTV8PL4dRHWOsMrNJPt/hkz082Ar3fEWqZLdy2N9xiXDZmsDl3JIZIwl2yLHhMChbwiqs+WDoQndFi7Uxl+6B7+pIBkRyOYQbRBc08X2rf4lbr83xyznfeGI3AvVKeFej5pT6fvvi6U06nX2HKPstoUEAQzEgU0ejrWjh8un2b7DGbQErV0NsRGtPiA89uUY8nCRgPAp/QotadAYJrwQNI+Wynz8t+EaTD1EUQ6GTDyZeLhBaCULUgtAaupnU1vds670LDNrsDT4RViIrXpKAfyL1gXzeRSLGEJf0kd2V2XbXDJJ9mLJZhHgTqXTHmU7idhLXRGsEJb4LUW7AIDjW4O2ShbYIcFylOhsN65wOrqcF6G6Kptvpz1K1RyVtTepC7bpS6C6a6i3bO3xcfSEaHSQ55NYLje4DGH3GGUXlBQ2do1Pd6+5u+yf1rCeB7SzPlbTmi6Eobr5NlybrSKufok6KWNJF4SfYDTFskny+zgG5J7sutmLaIItEIF67J7ktumNRDYH0BgOW5/x1p5cuu3vFL9NxUNFvR4EZt2/jA+d0HGf3EiHrzIWCZpxG5R315+2iCWHPAvgirLwbqG3oeg8QquJGI6BnEUbS6q6IW8qf4BNtx2MpHTNSni+X19cnLHjmN4tE9S8o7IMpIykIunvK3niLP0OtzWzewrTcBEUQMrYVtBevY1DonTI9gamKz1RhT2AIFm6ZptU6YHsHUwrjzGZi2FQwSunHC9AimLd1ofPbhmQMwbWmWdcL0GKa2ZljNMZVnX8eGfcL0GKZts9G9CERMQBUr2NCMyrVPmD6KaeN4WvqpbmqnHHUMU8NqN46n4KcC0za2zdNd6himbXgYP13ynwhip2U2TUpwyHFHJHrTap8wfRxTkWiaY9rSdbiQGu3TYT+KKbbbzQOopWtKR7Mt7QTpcUiN5m6KAVLLMM0TpEcg1S296eO98FKs6Jre+Rk/Mpksi4jzW/EJZ0bzHP3P1g3DauSOPx9Y9W/40KC4KT8c9kKSFjRDJAmRX011wu8Qfq/uw4y8lZUlJ4AOfidNFxdRmOVN0OmI2hLD0j7jS0IZ7Tp6+4vg6nWv3g3H4/mVf58XNDb0qx8QQHlC0ZuoyAiCPvJlkRw9fd/V+PuuKGLz+5SKAjakK82uepA9FdNsK59xzXuqK0IEfjnz/sFXo2FvNvH/0a9u6f2Ckyy88mmxTH9E59wArYwHc3SRwU1GVodgpdHzM7AppqF/xodmX+fAzwej6dXQbylF/EPi6g9H3nzYQ30qqyTLs94ohmotpawP+V6eOwBMWdLrvY/oR7aI6NUkFQjkV6Xtf5e2X/VZfou/I9T7RFHrUpA4FfWeayIVnIeosiD1gaXBuslFu47+lOQ5QROIyxG9JhFFLE45zFCQnV3Ky6Kg9QX1tVxNRVXr0z+mSpQPKT6N04gFDI15gjZr/TbKLuMbWAvSNAzPH02VjSdPUnb2fVemf9uVvSlYxB4eOJqRGDQNsoxn9Iu1qPsOKUrIN+rLXn32da3HmUh9H+8/pXuMhmN/7l1eevMJOmjIpzT6QUZpgnwCJ/64to2mX9Dz8cD334wnL5A/GP/hIVG1RqUYSuGIQT4Jf0EUwQ0tlQ/HpCgoHLwOPBrnsvyNHTFW3QJrfM547jp++Xa+GEO+2hjVp+/JMipQeR1E58NJWYe64jtfzGhESS7C4vYTt46xZv9HvpTy7b/wVwlvCZ0vqmq4WsjG1Y23Nna+yPdKqEqa+C+Kb2tmEyTWs+YpR9VqkWq1ZlJWJ+Y3EBN3uuVPCGoT/lvOVRJTmgU8y+v6umUc34yo27OpO7pClgc3rMcjESdFHBYEvurv5ECvO6MxvyOQSkRt1+2OH8li6QtvXpbCg1+lIh1EbEEzfrsQpZg7FFAW00QmQam2ZNonCtqOVUes7HUv+bUsNn/MxvH8wn/ESKy3dNMw29hoNTEXm21ba3d029Cfbnj/KYZbuCVrRjqN7LZ0o2PJ6sanmz3oXg7nAwhRvf7ZbDJCl/OxpbcOmf8dHEPdc2jx2xhweRhat2Z8CWHKL0SN/I04FHuE6pdR/we6vOLc','2000-11-29',NULL);
INSERT INTO `monitorxml` (`ID`,`PC`,`XML`,`data`,`data1`) VALUES ('44b2b2f753f8567f93ce47df027e0a3d',171,'eJztWm1v2zYQ/iu3fGqBWqIsO7ELVZ3heJjRxHGrtClWFwMtMTYRSRQoyknzYb99R/lFUuw4nrsUG+oYCMjjQ97x4csdSTlv76IQZkymXMRvjiyDHAGLfRHwePLmiKei1mo12zXr6K3r8PhaDH3XUVyJULhDKXwWZJJCwMEXsZIiDAUwiESMCEknEy7ADzmLlWMuKjkLVczzJU+Ua9WNlmM+EDoBVfQCq7vHpkXMOiFNx1zJHGw6T5D2a7vxutl2zKXEueF3y7bchlGvO2ZZ4sQiYh8V2oPpX750TzuXnS+dIOIxT5WkaPPXr65jllFZymQ/2IZeIgKhS4Tb+/xnp/v+T0T30eiFMNfcFVESMiWK1lbqiiKdQ5IrrSxkjp9kbh/NCmGI1vEsgn4fi7XYiab37oltOaZOOOpbwjzhXvE4ELcpDC7hSsibVFGFROBgzIudElekGAXXGWc8DFzLbmF787SDvZxxnw2pf+N68zToDBw7ZrnMCXHmZNQlDYv0FQ05RX0LmZNIEWQ+8zKO3AKqrAh0cSI5U1TyhyRVi7SlvbskFJLJAtg0CDHqttUwLELsvFoVqHiiJ/DQh994mgo9KXOBk/pTFtAZD5ioZAKW4oy8n5NSsecxUFku+axs3lq9RblZ0Y69nPGQTfiZ8Gm4dZ6uQSMWCcnpu7GL1BYZJ2/6HA0Nw4e8VovynBdvwmhpnviAKmc0wgkoXJopEeGc8sUCVS50UnGtbqlk/RgnXhgiboMMcRtZPp9vIlCD89NON7ejgisma9XWlXipIcef4uZRIEH/5fANoIrIE5n0WaXmer0lqCLUY6IXW6nues0CZG4iZg+yTrlkvvoMxCb536/w4uUu5MFPzF4nEGMGHV+KMVWAu8guhC1hO1G2F1vd16PL3vlwlFwr+y8VJaO9ucOW0FlPJI0iPsp7O3rY22cidkbRXflT6HsdQB8XwaUQYfrvrua9yN2by2dcxBzHRKOhO8WRqRvNA0/bedKxkIyZgqWLhybohewz9O5AV+UHHjfxeIbhx8cEw2oGlnEML7xvUb5acaHKBCNqrWMn3/Ffpa6y7S17Nyq6/YzUMoXuGE9CWah4xAKO4RkcG9b/mc0fsaB7d/6UxhN24Gk7T1eIO2xrm1kaMHXOmMITJ9gGOSy5J6bSRaZCIW60C5XoNncNf38+ykp3KQ2DwO9CXfM7+OIxBu9bdbvdInCNR7BI7/v6pkxGudqvBzY3sVm9QoIEY7cqwQfannABQgbwibNbZK59cmBrE1vDbDwOuT9vFCYZ13fIkGYhXLGxDnoPtD2y030adNF74u/A0CaGlvTstO4K4E/FUSWqZ+Fhr3o6bBUpoF8cCqngNH8cSPOQ4uAYd6APSRMxdGLFP3GZpatLDAa9gM8Dsad5OzGODWLoe/PdGawT0sCf/V13vN1Q1TRw/zvef0ztulA/zygaJRRJXAmZRm6S5o9+9zzxV0mh02WGhzRNKVxICiGb6CsQHiUCW1D0wUhoWell6uLd/K1MLQwtNf+YKh1PGh6LEvT3HAY4FYq+Po+ys2iKfQFCLKjtrGxw8V3Kaj+2Z/Xn7dlHxUN+fy/gA41QU09KPDvtrcVcn5D6ab5QP8+VW1/dH9dgKMXdt6d0D6A/8C47Z2edywvYaMhTGj1fMhaDR3Fr2a6t0PQKXgzwZJ7F4iV4vcEfHUikUGwe1Ca4xG7xKPAKGCic/kJ/jEGVYrjw2oRAynwRB3yLsWaFLOThGkclf4vHxKPHt5pVa9bq+I+0G+26TTBTbzRI0z6xa1bdPmnhltgmWLzBX5mrtrcrKX0DMVp//X6kSXPVgw8iQxo8/c2DP9WYNcHig5a/AVQ0noY=','2000-11-28',NULL);
INSERT INTO `monitorxml` (`ID`,`PC`,`XML`,`data`,`data1`) VALUES ('96236d048c8fcb2638f46144308173b7',162,'eJztWm1z4jgS/iu6+ZS5W/wG5q283nWAXHFDgMKZyd1t9oOwFVDFtlyySCb59deyDNhACJfM7G3dhCrKUqvV3XrUar06v3yNI3RPeEZZ8vMHUzM+IJIELKTJ4ucPNGO1dtvu1MwPv7gOTW7ZNHAdQQWLmDvlLCDhimMUUhSwRHAWRQwRFLMEODheLChDQURJIhy9qOQUqogfcJoK17S0tqPvEJ0QCzyB6q5l6B3dMgzb0Tc0B0TnCbPRtZpd23T0NcW5o1/XstyGZlmOXqY4CYvJZwH2QPovv/X63pX3mxfGNKGZ4Bhs/v1319HLXKuM8GF4jHvNETJZwlz/yrucDv4xGY3+1eiA2QU5191jcRoRwbbyNgq3RTIHMO/IKahOkK5c77Jf+9Q8E/HH2nA4RHlHZBnjji5LnXj55NoGwCITjnhMic/ca5qE7CFDAKYha9xCDQAFR9A1imPTNa6tGds+cZ35ikaha5kd6AWVdqDN9zQgUxzcub5KI5lBdUcvlzkR+NEKu0bDNIYCRxQnjl7QnJSzcBUQf0UBaQQqKwRZnHJKBOZ0F7BqkbR08DWNGCd8ywiNMLS6bViaCU3Oq1UZY8wDvCO4oMUsJFG0q3VDFTSVA2EaoAsKuEvnzglOFixJiO9pSFglE5IMPPtJwbmW2VvSNENeEqIrEiwTGB0LSjLU7Bh1Ze5zAsp0Tu93G71Xt+DRK9YBfvc0Igs6YgGOjo6HPdY5ToIljUnMOAW09J18kfg0d6FPtxkn13x5ENpqUZ7zk0M8kponZmDRPY5hlDIXrwSLsaABK7jKhQouMiNiA51KH+wUP2dAOKNJwGF4oJnn59or3HpZzosyr70xugRMU8YFOhtZV9OP31bkdPoNRPYpJ4GAUcxxFJHo21o4fLt93j1+xOgarIwgdKFpD/UwD98qdTKj40lvshaHzmz0hUXizdYWfjQCFPq1EU3uUH9gWQYa+h6aJtMXxOtln4VgJ1gAcyvdyTOVF0E6TF2zZWmG2YTxD18bBp4iO9lqnhDhWratyT+EQvkHDYoOUTBwDaNrG91zr+sZ3UG9e9GWgRDC2QIL8oAfXeTomySSEx2mST/J3Hx2W6fDJJtyGuchGSqUs7LMJ7BECEulJYITLoPUm9OICgg6bg2mriolZ5DzDMSxdUuKv2ItypwHWrWiks9Lq3bsUPKZpQLuO9jvYH87sI1jWB8BdwuBbKP5AtSm1VqjoRB5EXh9N8Zk7FY8YE6GSQartgjm1gM09kzsu1Trf1RDl32vtx/qtivLTQ3g+0K49kWVaJZmb1dsinWtNZfRh73AtjaSv5z9AFOF5LMVD0il5n69NVOFKJc+AhKluvs1t0z6IbBeAaCalP+JDPVrFV/jV3TW0AzZzZokHpiu9kFGPzCintyL8kQtCRHHKQ2Z3LZWdkU19Om8bdU7beMUOKFKHbC3YXthNu3G6eC+CtdXg/qnwLRhNponYwpdoJmNRsNuvmN6BNN2q2GeiGnDqJumZtaNet16x/Q4pp1T/dQ0pJ9aDePdT49hWrdbhdOd5KcS05bZLrrhHdPDmMKUf9LY//FAHAgKW2cBi2uuziQjyBBU107ywR8Pr4vR31fy3AOc6x2hw4txGnAmudHk9lb6VD4O/VnNRL7Ackt14BBqH7iOXKt36lbrdATVLGPWX4XkoHuj7JXm3vwJcf0cCf7rl3EPzUhEcEaQqcFmBs16yDTnEOcg7J02cZia8V9sFv9f3FIiNyZ0sZwzvmQsBPhMrX0aXmvGHwqwazK/iEKenTxY63YxyX7/wdrr3lwPx+OrG/8xEySuW3/ggN0nyrMegeMUJ4JuiGRL3HLiZ8/qCX9EzUbNOLDtC8ktXkXC7auvLFUEMOWQBv2wMfKW8YmmwSbJZLqsaYqzDKMJxygiC1gIIBqnDCQIvGNRps7iNncCn9QVmijwKYl/TpU8tdN8EqcRDSgaswRtIf4+ykbxEtqCYCEIsfJUZePJm5TV/tiWWd+3ZZ8FjejTE0MzHIOmAeeMk1dr0fcdUr4M2KpXubL0ITg6T4jEdcrZ18eXdI/RcOxfeaORdzVBBw15SaMfcEIS5GMYn8e1bTX9hM7GA9//PJ58RP5g/G8PycNikldDKQyxB8bDnxBBELjSfMOCYcUNA68Dy6QsP3WmR4zVK2CNzynLXMdXn/P5GHZDpStKFSiQipLofDhRd7NrvvN5sZbo4/ILDwjNptGw2n/Nf5r6/A3+ReVKpfN5cQi9E1JL9PN5tl+aFQXyLrpkMUayKRseVaoX7dOL5mJ1H5AtIQrvZNVzkL31+ubZiOukhAeMZ6wym4A/LTiOY3pTrrBl1as6jmkksKNKcXS6xsNbsOMG6DsQhDQLlrTHIhm55YQkCWyd35nive6MxOwezyHE92l2t+PZ8nGGq95ogJunclKM6Jxwdpc/UNihgCbYgOfzfa5TMe0TJW3HpCMm9rojtqABjp41cHx14T9jpG20LNuwrJZ1irXNlmm2OnbLtN5u9kX3auD1UK9fs6zG4H+Eq77nDPL5ErhLfmEIiedWfJUXVDf771qq9+8bWfpG/IytIJLBLi/3aCjZIxRP4v4DmxLXqA==','2000-11-29',NULL);
INSERT INTO `monitorxml` (`ID`,`PC`,`XML`,`data`,`data1`) VALUES ('96236d048c8fcb2638f46144308173b7',164,'eJztWm1z4jgS/iu6+ZS5W/wG5q283nWAXHFDgMKZyd1t9oOwFVDFtlyySCb59deyDNhACJfM7G3dhCrKUqvV3XrUar06v3yNI3RPeEZZ8vMHUzM+IJIELKTJ4ucPNGO1dtvu1MwPv7gOTW7ZNHAdQQWLmDvlLCDhimMUUhSwRHAWRQwRFLMEODheLChDQURJIhy9qOQUqogfcJoK17S0tqPvEJ0QCzyB6q5l6B3dMgzb0Tc0B0TnCbPRtZpd23T0NcW5o1/XstyGZlmOXqY4CYvJZwH2QPovv/X63pX3mxfGNKGZ4Bhs/v1319HLXKuM8GF4jHvNETJZwlz/yrucDv4xGY3+1eiA2QU5191jcRoRwbbyNgq3RTIHMO/IKahOkK5c77Jf+9Q8E/HH2nA4RHlHZBnjji5LnXj55NoGwCITjnhMic/ca5qE7CFDAKYha9xCDQAFR9A1imPTNa6tGds+cZ35ikaha5kd6AWVdqDN9zQgUxzcub5KI5lBdUcvlzkR+NEKu0bDNIYCRxQnjl7QnJSzcBUQf0UBaQQqKwRZnHJKBOZ0F7BqkbR08DWNGCd8ywiNMLS6bViaCU3Oq1UZY8wDvCO4oMUsJFG0q3VDFTSVA2EaoAsKuEvnzglOFixJiO9pSFglE5IMPPtJwbmW2VvSNENeEqIrEiwTGB0LSjLU7Bh1Ze5zAsp0Tu93G71Xt+DRK9YBfvc0Igs6YgGOjo6HPdY5ToIljUnMOAW09J18kfg0d6FPtxkn13x5ENpqUZ7zk0M8kponZmDRPY5hlDIXrwSLsaABK7jKhQouMiNiA51KH+wUP2dAOKNJwGF4oJnn59or3HpZzosyr70xugRMU8YFOhtZV9OP31bkdPoNRPYpJ4GAUcxxFJHo21o4fLt93j1+xOgarIwgdKFpD/UwD98qdTKj40lvshaHzmz0hUXizdYWfjQCFPq1EU3uUH9gWQYa+h6aJtMXxOtln4VgJ1gAcyvdyTOVF0E6TF2zZWmG2YTxD18bBp4iO9lqnhDhWratyT+EQvkHDYoOUTBwDaNrG91zr+sZ3UG9e9GWgRDC2QIL8oAfXeTomySSEx2mST/J3Hx2W6fDJJtyGuchGSqUs7LMJ7BECEulJYITLoPUm9OICgg6bg2mriolZ5DzDMSxdUuKv2ItypwHWrWiks9Lq3bsUPKZpQLuO9jvYH87sI1jWB8BdwuBbKP5AtSm1VqjoRB5EXh9N8Zk7FY8YE6GSQartgjm1gM09kzsu1Trf1RDl32vtx/qtivLTQ3g+0K49kWVaJZmb1dsinWtNZfRh73AtjaSv5z9AFOF5LMVD0il5n69NVOFKJc+AhKluvs1t0z6IbBeAaCalP+JDPVrFV/jV3TW0AzZzZokHpiu9kFGPzCintyL8kQtCRHHKQ2Z3LZWdkU19Om8bdU7beMUOKFKHbC3YXthNu3G6eC+CtdXg/qnwLRhNponYwpdoJmNRsNuvmN6BNN2q2GeiGnDqJumZtaNet16x/Q4pp1T/dQ0pJ9aDePdT49hWrdbhdOd5KcS05bZLrrhHdPDmMKUf9LY//FAHAgKW2cBi2uuziQjyBBU107ywR8Pr4vR31fy3AOc6x2hw4txGnAmudHk9lb6VD4O/VnNRL7Ackt14BBqH7iOXKt36lbrdATVLGPWX4XkoHuj7JXm3vwJcf0cCf7rl3EPzUhEcEaQqcFmBs16yDTnEOcg7J02cZia8V9sFv9f3FIiNyZ0sZwzvmQsBPhMrX0aXmvGHwqwazK/iEKenTxY63YxyX7/wdrr3lwPx+OrG/8xEySuW3/ggN0nyrMegeMUJ4JuiGRL3HLiZ8/qCX9EzUbNOLDtC8ktXkXC7auvLFUEMOWQBv2wMfKW8YmmwSbJZLqsaYqzDKMJxygiC1gIIBqnDCQIvGNRps7iNncCn9QVmijwKYl/TpU8tdN8EqcRDSgaswRtIf4+ykbxEtqCYCEIsfJUZePJm5TV/tiWWd+3ZZ8FjejTE0MzHIOmAeeMk1dr0fcdUr4M2KpXubL0ITg6T4jEdcrZ18eXdI/RcOxfeaORdzVBBw15SaMfcEIS5GMYn8e1bTX9hM7GA9//PJ58RP5g/G8PycNikldDKQyxB8bDnxBBELjSfMOCYcUNA68Dy6QsP3WmR4zVK2CNzynLXMdXn/P5GHZDpStKFSiQipLofDhRd7NrvvN5sZbo4/ILDwjNptGw2n/Nf5r6/A3+ReVKpfN5cQi9E1JL9PN5tl+aFQXyLrpkMUayKRseVaoX7dOL5mJ1H5AtIQrvZNVzkL31+ubZiOukhAeMZ6wym4A/LTiOY3pTrrBl1as6jmkksKNKcXS6xsNbsOMG6DsQhDQLlrTHIhm55YQkCWyd35nive6MxOwezyHE92l2t+PZ8nGGq95ogJunclKM6Jxwdpc/UNihgCbYgOfzfa5TMe0TJW3HpCMm9rojtqABjp41cHx14T9jpG20LNuwrJZ1irXNlmm2OnbLtN5u9kX3auD1UK9fs6zG4H+Eq77nDPL5ErhLfmEIiedWfJUXVDf771qq9+8bWfpG/IytIJLBLi/3aCjZIxRP4v4DmxLXqA==','2005-09-20','20/09/2005 15:58:00');

#
# Table Objects for table opzionistampanti
#

CREATE TABLE `opzionistampanti` (
  `id` int(11) NOT NULL default '0',
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table opzionistampanti
#

INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (1,'Dispenser');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (2,'USI interface');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (3,'Cutter');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (4,'Lama sfoglio lunga');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (5,'Lama sfoglio corta');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (6,'Lama sfoglio per strappo');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (7,'Piedini di fissaggio');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (8,'Assist');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (9,'Display remoto');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (10,'Switch ON_OFF su display');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (11,'Modifica rulli avanzamento');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (12,'OK con display new');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (13,'Scheda madre vecchia (<5)');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (14,'EX-VOLVIC');
INSERT INTO `opzionistampanti` (`id`,`descrizione`) VALUES (15,'Flat display corto');

#
# Table Objects for table paesi
#

CREATE TABLE `paesi` (
  `id_paese` char(2) NOT NULL default '',
  `descrizione` varchar(50) default NULL,
  `icona` varchar(50) default NULL,
  PRIMARY KEY  (`id_paese`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table paesi
#

INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('BE','Belgio','icons/flags/ben-BE.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('DE','Germania','icons/flags/ger-DE.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('DR','Rep. Dominicana','icons/flags/unknown.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('ES','Spagna','icons/flags/cat-ES.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('FR','Francia','icons/flags/fre-FR.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('HU','Ungheria','icons/flags/hun-HU.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('IT','Italia','icons/flags/ita-IT.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('ME','Messico','icons/flags/esl-MX.gif');
INSERT INTO `paesi` (`id_paese`,`descrizione`,`icona`) VALUES ('PL','Polonia','icons/flags/pol-PL.gif');

#
# Table Objects for table pc_campi
#

CREATE TABLE `pc_campi` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `descrizione` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table pc_campi
#

INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (1,'Password MySQL');
INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (2,'Tinyterm Installato');
INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (3,'Commessa di acquisto');
INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (4,'Commessa di manutenzione');
INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (5,'Numero telefonico per il teleservice');
INSERT INTO `pc_campi` (`id`,`descrizione`) VALUES (7,'Scheda di comunicazione Siemens');

#
# Table Objects for table pc_funzioni
#

CREATE TABLE `pc_funzioni` (
  `id_apparecchi` int(11) NOT NULL default '0',
  `id_pc_tipifunzione` int(11) NOT NULL default '0',
  `ordine` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table pc_funzioni
#

INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (14,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (15,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (16,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (17,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (18,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (19,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (20,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (21,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (23,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (24,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (25,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (26,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (27,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (28,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (29,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (31,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (32,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (33,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (34,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (35,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (36,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (37,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (38,6,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (39,7,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (97,27,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (98,27,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (99,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (100,22,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (103,9,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (103,20,3);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (107,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (109,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (110,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (111,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (112,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (113,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (114,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (115,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (116,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (117,22,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (118,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (119,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (120,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (121,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (122,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (123,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (124,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (125,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (126,11,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (127,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (128,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (129,13,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (134,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (135,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (136,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (137,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (138,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (139,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (141,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (142,28,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (143,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (144,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (145,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (146,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (147,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (148,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (149,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (150,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (151,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (152,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (153,12,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (154,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (155,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (156,9,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (157,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (158,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (159,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (160,9,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (161,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (162,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (163,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (164,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (165,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (166,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (167,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (168,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (169,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (170,18,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (171,18,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (177,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (178,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (179,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (180,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (181,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (183,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (184,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (185,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (186,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (187,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (188,17,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (189,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (190,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (191,14,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (192,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (192,6,2);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (193,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (194,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (195,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (196,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (198,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (199,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (202,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (203,1,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (204,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (205,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (206,18,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (207,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (208,13,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (209,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (210,23,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (211,13,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (212,26,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (213,16,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (215,21,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (216,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (217,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (218,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (219,25,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (220,15,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (221,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (222,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (223,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (224,18,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (225,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (226,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (227,10,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (228,6,2);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (228,8,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (229,13,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (229,24,2);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (230,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (231,4,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (232,5,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (233,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (234,18,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (235,3,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (235,4,2);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (236,29,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (237,2,1);
INSERT INTO `pc_funzioni` (`id_apparecchi`,`id_pc_tipifunzione`,`ordine`) VALUES (238,1,1);

#
# Table Objects for table pc_posizionamenti
#

CREATE TABLE `pc_posizionamenti` (
  `id_apparecchi` int(11) NOT NULL default '0',
  `id_impianti` int(11) NOT NULL default '0',
  `data` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id_apparecchi`,`id_impianti`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table pc_posizionamenti
#

INSERT INTO `pc_posizionamenti` (`id_apparecchi`,`id_impianti`,`data`) VALUES (1,1,'14/03/2005 15:19:50');

#
# Table Objects for table pc_tipifunzione
#

CREATE TABLE `pc_tipifunzione` (
  `ID` int(11) NOT NULL auto_increment,
  `funzione` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table pc_tipifunzione
#

INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (1,'Controllo etichettatrice palette');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (2,'Controllo etichettatrice fardello');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (3,'Supervisione trattamento prodotto');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (4,'Raccolta dati impianto');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (5,'Scorta per impianto asettico');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (6,'Controllo alza-abbassa');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (7,'Controllo Picking');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (8,'Stampe etichette palette di emergenza');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (9,'Test nuovi applicativi e prove software');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (10,'Acquisizione dati Tecnowatt');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (11,'Scorta Picking/alza-abbassa');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (12,'Controllo etichettatrice tappi');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (13,'Scorta etichettatrice palette');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (14,'Supervisione conteggio bottiglie');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (15,'Supervisione carico silos');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (16,'Supervisione centralino');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (17,'Supervisione prove stampi (SBLAB)');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (18,'Riserva');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (19,'Supervisione rotonda');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (20,'Web server');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (21,'Scorta etichettatrice fardello');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (22,'Supervisione SIPA');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (23,'Raccolta dati pozzi');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (24,'PC programmazione');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (25,'Supervisione distribuzione elettrica');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (26,'Efficienza impianto asettico');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (27,'Controllo forno Zambelli');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (28,'Allarmi antincendio');
INSERT INTO `pc_tipifunzione` (`ID`,`funzione`) VALUES (29,'Controllo Sala Sciroppi automatica');

#
# Table Objects for table pc_varie
#

CREATE TABLE `pc_varie` (
  `pc` int(6) unsigned NOT NULL default '0',
  `voce` tinyint(4) NOT NULL default '0',
  `valore` varchar(100) default NULL,
  PRIMARY KEY  (`pc`,`voce`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table pc_varie
#

INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,1,'boh');
INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,2,'no');
INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,3,'5105490101');
INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,4,'');
INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,5,'');
INSERT INTO `pc_varie` (`pc`,`voce`,`valore`) VALUES (238,7,'');

#
# Table Objects for table posizioni_impianti
#

CREATE TABLE `posizioni_impianti` (
  `id_aziende` int(11) NOT NULL default '0',
  `progressivoimpianto` int(11) NOT NULL default '0',
  `id_elencoposizioni` int(11) NOT NULL default '0',
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`id_aziende`,`progressivoimpianto`,`id_elencoposizioni`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table posizioni_impianti
#


#
# Table Objects for table queryutente
#

CREATE TABLE `queryutente` (
  `ID` int(11) NOT NULL auto_increment,
  `IDUtente` int(11) default NULL,
  `Descrizione` varchar(250) default NULL,
  `Testo` longtext,
  `Pubblica` tinyint(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table queryutente
#

INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (1,12,'elenco PC e numeri di serie','select id, descrizione,posizione, sn,coa, marca,modello,IDRete  from apparecchi',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (2,12,'lista interventi','SELECT apparecchi.ID, TipiApparecchi.descrizione AS tipo, \r\n    Apparecchi.Descrizione, ultimomov.data, \r\n    ultimomov.evento\r\nFROM (SELECT cronologia.Apparecchio, cronologia.data, \r\n          cronologia.evento\r\n      FROM (SELECT MAX(cronologia.data) AS data, \r\n                cronologia.Apparecchio\r\n            FROM cronologia\r\n            GROUP BY apparecchio) data INNER JOIN\r\n          dbo.cronologia ON \r\n          data.data = dbo.cronologia.data AND \r\n          data.Apparecchio = dbo.cronologia.Apparecchio) \r\n    ultimomov INNER JOIN\r\n    dbo.Apparecchi ON \r\n    ultimomov.Apparecchio = dbo.Apparecchi.ID INNER JOIN\r\n    dbo.TipiApparecchi ON \r\n    dbo.Apparecchi.Tipo = dbo.TipiApparecchi.ID\r\norder by ultimomov.data',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (3,12,'pc rackmount','select * from apparecchi where Apparecchi.Tipo= 17',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (4,12,'lista apparecchi','select id_aziende,id, descrizione,posizione, sn,coa, marca,modello,IDRete  from apparecchi order by id_aziende',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (5,12,'Numeri serie PC','select apparecchi.ID ,apparecchi.SN,  apparecchi.marca ,apparecchi.modello ,apparecchi.posizione ,apparecchi.Descrizione from apparecchi order by sn',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (6,12,'lista  IP address','select Apparecchi.ID, Apparecchi.Descrizione, Apparecchi.IPAddress, Apparecchi.IDrete from apparecchi order by ipaddress ',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (7,12,'lista versioni sw','select elencoSW.computer, software.Descrizione, elencoSW.Versione,  elencoSW.SN from elencosw,software where software.id=elencosw.software',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (8,12,'PC senza indirizzo IP','select Apparecchi.ID, Apparecchi.Descrizione, Apparecchi.IPAddress, Apparecchi.IDrete,apparecchi.posizione  from apparecchi where  ipaddress = \'\' order by descrizione',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (9,12,'Materiale andato a volvic','select id, descrizione, posizione from apparecchi where posizione like \'%volvic%\'',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (10,12,'Lista materiale ancora in riparazione','select id, sn , descrizione, posizione from apparecchi where posizione like \'%riparazione%\'',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (11,17,'Pc con word 2003','select distinct apparecchi.id ,posizione,descrizione from apparecchi,elencosw where\r\n(software like \'%2003%\' or\r\n versione like \'%2003%\') and  Apparecchi.ID= elencoSW.computer ;',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (12,12,'Numero interventi per macchina','SELECT Apparecchi.Descrizione, Apparecchi.posizione, \r\n    Apparecchi.marca, Apparecchi.modello, COUNT(*) \r\n    AS Expr1\r\nFROM cronologia INNER JOIN\r\n    Apparecchi ON \r\n    cronologia.Apparecchio = Apparecchi.ID\r\nGROUP BY Apparecchi.Descrizione, Apparecchi.posizione, \r\n    Apparecchi.marca, Apparecchi.modello\r\n\r\norder by expr1',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (13,12,'note apparecchi','select id,note from apparecchi where note is not null',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (14,12,'elenco PC e software','select apparecchi.id, apparecchi.marca, apparecchi.modello, apparecchi.sn,apparecchi.coa,apparecchi.Datainst, funzpc.funzione, apparecchi.IPAddress,apparecchi.IDrete, software.ID, software.Descrizione, elencosw.Versione,if(elencosw.Licenza=1,\'ok\',\'\') as licenza\r\nfrom apparecchi left join elencosw on apparecchi.ID = elencosw.computer left join software on elencosw.software=software.ID \r\nleft outer join (select pc_funzioni.id_apparecchi, pc_tipifunzione.funzione\r\nfrom pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione = pc_tipifunzione.ID\r\nwhere pc_funzioni.ordine=1) funzpc on apparecchi.ID=funzpc.id_apparecchi \r\norder by apparecchi.ID, software.ID',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (15,12,'riepilogo software','select  software.ID,  software.Descrizione,  elencosw.Licenza, count(elencosw.Computer) as numero\r\nfrom apparecchi left join elencosw on apparecchi.ID = elencosw.computer left join software on elencosw.software=software.ID\r\ngroup by  software.ID, software.Descrizione, elencosw.Licenza',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (16,12,'pacchetti software per PC','select computer,  count(software) as conteggio  from elencosw group by computer',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (17,12,'situazione software scorzÃ¨','select apparecchi.id, apparecchi.marca as \'marca PC\', apparecchi.modello as \'modello PC\', apparecchi.sn as seriale, funzpc.funzione as \'funzione computer\', apparecchi.IPAddress as \'indirizzo IP\', software.Descrizione as software, elencosw.Versione, software.tipologia, if(elencosw.Licenza=1,\'ok\',\'\') as licenza\r\nfrom apparecchi left join elencosw on apparecchi.ID = elencosw.computer left join software on elencosw.software=software.ID \r\nleft outer join (select pc_funzioni.id_apparecchi, pc_tipifunzione.funzione\r\nfrom pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione = pc_tipifunzione.ID\r\nwhere pc_funzioni.ordine=1) funzpc on apparecchi.ID=funzpc.id_apparecchi \r\nwhere apparecchi.id_aziende=1\r\norder by apparecchi.ID, software.ID',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (18,12,'Conteggio PC per funzione','select  pc_tipifunzione.funzione, count(pc_funzioni.id_apparecchi) as totale from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione =  pc_tipifunzione.ID\r\ngroup by  pc_tipifunzione.funzione',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (19,12,'Elenco PC per funzione','select  pc_tipifunzione.funzione, pc_funzioni.id_apparecchi, apparecchi.IDrete, apparecchi.IPAddress  from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione =  pc_tipifunzione.ID\r\ninner join apparecchi on  apparecchi.ID = pc_funzioni.id_apparecchi \r\norder by pc_tipifunzione.funzione, apparecchi.IPAddress\r\n\r\n',1);
INSERT INTO `queryutente` (`ID`,`IDUtente`,`Descrizione`,`Testo`,`Pubblica`) VALUES (20,12,'software fuori licenza - scorze','select apparecchi.id, apparecchi.marca as \'marca PC\', apparecchi.modello as \'modello PC\', apparecchi.sn as seriale, funzpc.funzione as \'funzione computer\', apparecchi.IPAddress as \'indirizzo IP\', software.Descrizione as software, elencosw.Versione, software.tipologia from apparecchi left join elencosw on apparecchi.ID = elencosw.computer left join software on elencosw.software=software.ID left outer join (select pc_funzioni.id_apparecchi, pc_tipifunzione.funzione from pc_funzioni inner join pc_tipifunzione on pc_funzioni.id_pc_tipifunzione = pc_tipifunzione.ID where pc_funzioni.ordine=1) funzpc on apparecchi.ID=funzpc.id_apparecchi where apparecchi.id_aziende=1 and elencosw.Licenza <> 1 order by apparecchi.ID, software.ID',1);

#
# Table Objects for table riavvii
#

CREATE TABLE `riavvii` (
  `ID` int(11) default NULL,
  `dataora` longtext,
  `linea` longtext,
  `IP` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table riavvii
#


#
# Table Objects for table software
#

CREATE TABLE `software` (
  `ID` int(11) NOT NULL auto_increment,
  `Descrizione` varchar(50) default NULL,
  `tipologia` varchar(100) default NULL,
  `parent` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table software
#

INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (7,'VNC','Controllo remoto del PC',100);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (30,'ClientGE','Software rintracciabilita\' - trasferimento etichette al server',103);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (42,'Ahead NERO Burning Rom','software per masterizzare CD',109);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (49,'Siemens Protool PRO','SCADA per impianti industriali',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (55,'Programma etichettatura tappi','Software per generazione etichette',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (57,'Codesoft','Software per generazione etichette',109);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (58,'Etichettatrice Palette','Software per generazione etichette',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (59,'Siemens SIMATIC NET','Comunicazione di campo',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (62,'Siemens OPC Server','Comunicazione di campo',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (63,'MySQL','Database server',109);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (65,'Monitor Pro','SCADA per impianti industriali',104);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (67,'Software APV OGS','Applicativo per supervisione d\'impianto',105);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (69,'Microsoft Word','Software per ufficio',101);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (70,'Microsoft Windows','Sistema operativo',101);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (71,'UltraVNC','Controllo remoto del PC',100);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (72,'Etichettatrice fardello','Software per generazione etichette',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (73,'Microsoft Visual Basic','Software di programmazione',100);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (74,'PalmMonitor Client','Software rintracciabilita\' - gestione palmari',103);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (75,'USDATA Factory Link','SCADA per impianti industriali',104);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (76,'TightVNC','Controllo remoto del PC',100);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (83,'Raccolta dati asettico SB','Software di raccolta dati impianto',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (84,'Raccolta dati asettico AUTECO','Software di raccolta dati impianto',105);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (86,'Microsoft Office','Software per ufficio',101);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (87,'Ericcson Cordless System Manager','Software per gestione centrali telefoniche',108);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (88,'Cabine','Controllo PLC delle cabine elettriche',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (91,'Siemens WINCC','SCADA per impianti industriali',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (92,'Acquisizione dati tecnowatt','Raccolta dati energia elettrica',107);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (93,'Supervisione SHAPE','Applicativo per supervisione d\'impianto',102);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (94,'Endress Hauser OPC Server','Comunicazione di campo',106);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (95,'Raccolta Dati OPC  E+H','Software di raccolta dati impianto',106);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (96,'Siemens MicroWIN','Software programmazione industriale',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (97,'Siemens STEP7','Software programmazione industriale',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (98,'Siemens STEP5','Software programmazione industriale',99);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (99,'Siemens',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (100,'Controllo remoto',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (101,'Microsoft',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (102,'Programmi SB',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (103,'Programmi Marsoft',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (104,'US Data',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (105,'Auteco',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (106,'Endress Hauser',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (107,'Tecnowatt',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (108,'Ericcson',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (109,'Vari',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (111,'DOS','Sistema operativo',101);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (115,'aggiornamenti',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (116,'Software Linux',NULL,0);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (117,'Kubuntu','Sistema operativo',116);
INSERT INTO `software` (`ID`,`Descrizione`,`tipologia`,`parent`) VALUES (118,'Supervisione asettico SB','Applicativo per supervisione d\'impianto',102);

#
# Table Objects for table stampanti
#

CREATE TABLE `stampanti` (
  `oldID` int(11) NOT NULL default '0',
  `id` varchar(5) NOT NULL default '',
  `sn` varchar(30) default NULL,
  `modello` int(11) default NULL,
  `posizione` int(11) default NULL,
  `firmware` varchar(50) default NULL,
  `attivo` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table stampanti
#

INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (1,'001','0348570203-64061',1,25,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (2,'002','0276910104-6406',1,12,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (3,'003','0323900110-64061',1,6,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (4,'004','0348560203-64061',1,1,'2.46',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (5,'005','0348580203-64061',1,22,'2.46',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (6,'006','0348590203-64061',1,16,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (7,'007','0271670103-6406',1,19,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (8,'008','0336350201-64061',1,20,'2.47',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (9,'009','0336340201-64061',1,4,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (10,'010','0320360110-64061',1,13,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (11,'011','0276890104-6406',1,31,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (12,'012','0271680103-6406',1,2,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (13,'013','0276930104-6406',1,23,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (14,'014','0323870110-64061',1,5,'3.00',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (15,'015','0327370111-64061',1,15,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (68,'016','0282970104-64061',1,7,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (17,'017','0323880110-64061',1,8,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (18,'018','0268650102-6406',1,26,'2.45',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (19,'019','0340080201-64061',1,17,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (20,'020','0327360111-64061',1,18,'2.45',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (21,'021','0327380111-64061',1,24,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (22,'022','0327150111-64061',1,9,'2.45',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (23,'023','0438390305-64061',1,21,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (24,'024','0340740201-6406',1,27,'2.46',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (25,'025','0363780204-6406',1,29,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (26,'026','0340730201-6406',1,28,'2.46',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (27,'027','0323890110-64061',1,14,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (28,'028','0320350110-64061',1,45,'3.00',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (29,'029','0276920104-6406',1,32,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (30,'030','0320340110-64061',1,10,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (31,'031','0446130306-6406',1,87,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (40,'032','0340720201-6406',1,33,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (44,'033','0481440312-6406',1,40,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (60,'034','0514430405-6406',1,53,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (61,'035','0336330201-64061',1,76,'2.47',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (78,'036','0276940104-6406',1,11,'3.00',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (79,'037','0575530503-6406',1,82,'3.40',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (32,'M01','0445730306-DPM',2,81,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (33,'M02','0377800207-DPM',2,3,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (34,'M03','0433770304-DPM',4,56,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (35,'M04','0421480302-DPM',4,35,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (36,'M05','0451240307-DPM',4,36,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (37,'M06','0421510302-DPM',4,37,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (38,'M07','0438560305-DPM',5,38,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (39,'M08','0438570305-DPM',5,62,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (41,'M09','0392400209-DPM',2,42,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (42,'M10','0433820304-DPM',5,43,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (43,'M11','0433810304-DPM',5,44,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (45,'M12','0399140211-DPM',2,46,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (46,'M13','0392390209-DPM',2,47,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (47,'M14','0392370209-DPM',2,57,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (48,'M15','0414870302-DPM',2,51,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (49,'M16','0448020307-DPM',2,52,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (50,'M17','0451250307-DPM',5,39,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (51,'M18','0445720306-DPM',3,65,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (52,'M19','0451230307-DPM',4,34,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (53,'M20','0377770207-DPM',2,57,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (54,'M21','0414850302-DPM',2,60,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (55,'M22','0417160301-DPM',4,61,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (56,'M23','0417180301-DPM',4,63,'3.01',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (57,'M24','0399170211-DPM',3,64,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (58,'M25','0411070212-DPM',3,58,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (59,'M26','0514040405-DPM',2,66,'xxx',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (62,'M27','0501850403-DPM',5,55,'3.31',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (64,'M28','0514910406-DPM',5,74,'R3.32G H3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (65,'M29','0514900406-DPM',5,75,'R3.32G H3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (66,'M30','0518380406-ALX926',6,78,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (67,'M31','0514890406-DPM',4,72,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (16,'M32','0514880406-DPM',4,73,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (69,'M33','0501840403-DPM',5,79,'???',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (70,'M34','0399120211-DPM',2,67,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (71,'M35','0392340209-DPM',2,68,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (72,'M36','0392350209-DPM',2,69,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (73,'M37','0392410209-DPM',2,70,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (74,'M38','0392360209-DPM',2,71,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (75,'M39','???',2,80,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (76,'M40','0417150301-DPM',4,61,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (77,'M41','0399189211-DPM',3,81,'2.47',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (80,'M42','0388460208-DPM',5,62,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (81,'M43','0392420209-DPM',2,83,'3.32',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (82,'M44','0414860302-DPM',2,62,'3.10',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (83,'M45','0433780304-DPM',4,63,'???',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (84,'M46','0417170301-DPM',4,61,'???',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (85,'M47','0388450208-DPM',5,85,'???',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (86,'M48','0414840302-DPM',2,60,'???',1);
INSERT INTO `stampanti` (`oldID`,`id`,`sn`,`modello`,`posizione`,`firmware`,`attivo`) VALUES (87,'M49','0445740306-DPM',2,86,'3.10',1);

#
# Table Objects for table tipiapparecchi
#

CREATE TABLE `tipiapparecchi` (
  `ID` int(11) NOT NULL auto_increment,
  `descrizione` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table tipiapparecchi
#

INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (2,'Palmare');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (3,'PC a pannello');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (5,'PC Officina elettrica');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (6,'Portatile');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (7,'Server');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (8,'PC desktop');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (9,'PC a pannello con touchscreen');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (15,'Workstation');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (16,'PC Siemens');
INSERT INTO `tipiapparecchi` (`ID`,`descrizione`) VALUES (17,'PC industriale Rackmount');

#
# Table Objects for table tipiintervento
#

CREATE TABLE `tipiintervento` (
  `ID` int(11) NOT NULL auto_increment,
  `Descrizione` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table tipiintervento
#

INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (1,'sost. testina di stampa');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (2,'sost. motore testa');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (3,'sost. lift motor');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (4,'sost. motore ribbon');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (5,'sost. motore feed');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (6,'sost. motore dispenser');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (7,'sost. alimentatore');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (8,'sost. USI interface');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (9,'sost. scheda madre');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (10,'sost. scheda motore');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (11,'sost. display');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (12,'sost. sensore gap');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (13,'sost. cinghia dispenser');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (14,'sost. cinghia ribbon');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (15,'sost. cinghia dentata dispense');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (16,'sost. rullino removibile');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (17,'sost. rullo sil. dispenser');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (18,'sost. rullo sil. feed');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (19,'sost. rullo sil. testina');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (20,'sost. rullo ribbon');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (21,'sost. rullo freno (solo DPM)');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (22,'sost. cutter');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (23,'sost. levetta rilascio rullini');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (24,'sost. Ventola raffreddamento');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (25,'sost. dispenser');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (26,'libero');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (27,'libero');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (28,'libero');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (29,'libero');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (30,'reg. testina');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (31,'reg. sensore gap su MB');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (32,'rip. albero rullini pressori');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (33,'rip. camma lift motor');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (34,'reg./rip. camma testina');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (35,'rip. flat remotazione display');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (36,'rip. alimentatore');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (37,'rip. cutter');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (38,'rip. molla ribbon');
INSERT INTO `tipiintervento` (`ID`,`Descrizione`) VALUES (39,'Collaudo / Test / Varie');

#
# Table Objects for table tipiinterventopc
#

CREATE TABLE `tipiinterventopc` (
  `ID` varchar(5) NOT NULL default '',
  `Descrizione` varchar(50) default NULL,
  `AuthLevel` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table tipiinterventopc
#

INSERT INTO `tipiinterventopc` (`ID`,`Descrizione`,`AuthLevel`) VALUES ('CHPOS','Cambio posizione del PC',3);
INSERT INTO `tipiinterventopc` (`ID`,`Descrizione`,`AuthLevel`) VALUES ('RMA','Invio in riparazione',3);
INSERT INTO `tipiinterventopc` (`ID`,`Descrizione`,`AuthLevel`) VALUES ('VARIE','Manutenzioni Varie',3);

#
# Table Objects for table tipiinterventopcrighe
#

CREATE TABLE `tipiinterventopcrighe` (
  `ID` varchar(5) NOT NULL default '',
  `NomeControllo` varchar(50) NOT NULL default '',
  `TipoControllo` char(1) default NULL,
  `DescControllo` longtext,
  `Campo` varchar(20) default NULL,
  `Tabella` varchar(50) default NULL,
  `Azione` char(1) default NULL,
  `CampiFiltro` longtext,
  `ValoriFiltro` longtext,
  PRIMARY KEY  (`ID`,`NomeControllo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table tipiinterventopcrighe
#

INSERT INTO `tipiinterventopcrighe` (`ID`,`NomeControllo`,`TipoControllo`,`DescControllo`,`Campo`,`Tabella`,`Azione`,`CampiFiltro`,`ValoriFiltro`) VALUES ('CHPOS','NuovaDest','I','Nuova posizione','Posizione','Apparecchi','U','ID','id');
INSERT INTO `tipiinterventopcrighe` (`ID`,`NomeControllo`,`TipoControllo`,`DescControllo`,`Campo`,`Tabella`,`Azione`,`CampiFiltro`,`ValoriFiltro`) VALUES ('RMA','RMA','I','Numero RMA','Posizione','Apparecchi','U','ID','id');
INSERT INTO `tipiinterventopcrighe` (`ID`,`NomeControllo`,`TipoControllo`,`DescControllo`,`Campo`,`Tabella`,`Azione`,`CampiFiltro`,`ValoriFiltro`) VALUES ('VARIE','Descrizione','A',NULL,NULL,NULL,NULL,NULL,NULL);

#
# Table Objects for table utenti
#

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL auto_increment,
  `UserName` varchar(20) default NULL,
  `Password` varchar(32) default NULL,
  `Livello` smallint(6) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# Dumping data for table utenti
#

INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (12,'pier','71c532e3992652da9131f1934d3d1635',0);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (16,'Simone','b762871f080952d2c7045516b89a9379',2);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (17,'bettin','546d135156580a78651cc254caed9bf4',2);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (23,'michele','8a94bdfc825df46f880854f41fee346b',3);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (25,'Matteo','4ee8b3991aa777ebdbfc2b54a9163637',2);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (26,'andrea','1c42f9c1ca2f65441465b43cd9339d6c',3);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (27,'guest','084e0343a0486ff05530df6c705c8bb4',3);
INSERT INTO `utenti` (`ID`,`UserName`,`Password`,`Livello`) VALUES (29,'davide','4df5ee2d5005c327b74f6c3f508b5bc4',3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

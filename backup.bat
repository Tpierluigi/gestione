net use k: \\192.168.3.27\backup bck /user:repele27\bckuser /persistent:no
del k:\gestione /s /q
md k:\gestione
xcopy /s d:\htdocs\gestione\*.* k:\gestione
mysqldump -ugestione -pcomputer -B --hex-blob -rk:\gestione\dump.sql --compatible=mysql323 --compact pc
rem mysqldump -ugestione -pcomputer -B --hex-blob -rk:\gestione\dump.sql  pc
date /t > k:\gestione\backupdate.txt
net use k: /d
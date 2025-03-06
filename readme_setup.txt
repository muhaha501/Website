flask --app app_name run --debug
(mit --debug werden Änderungen "live" übernommen)


Browser --> http://127.0.0.1:5000/

Hello World wird angezeigt

---------------------------------- AUU

AUU lokal starten:

Source files downloaden

flask --app __init__ run --debug

Seite startet, jedoch noch keine SQL Daten vorhanden/initiiert/erstellt

mittels 

"flask --app __init__ shell" 

in die Flask - App - Shell wechseln

mittels 

>>> from flask_auu.db import init_db
>>> init_db()
get_db(): before db is accessed...
init_db(): get_db()...
init_db(): schema successfully created...
init_db(): data successfully inserted...

Datenbank initiieren (erstellt tables mit usern etc.)
Vorsicht: "from db import init_db" funktioniert NICHT, da als Modul implementiert (__init__)


Flask Server neu starten Browser --> http://127.0.0.1:5000/ und einloggen :)

---------------------------------- AUU Alternative

AUU lokal starten:

Source files downloaden

in den folder Website navigieren 

flask --app .\flask_auu\__init__.py run --debug

Seite startet, jedoch noch keine SQL Daten vorhanden/initiiert/erstellt


im selben folder den Command 

flask --app flask_auu init-db

ermöglicht das initialisieren der Datenbank ohne in die Flask shell zu navigieren
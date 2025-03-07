/* SQLite Syntax */
/* Last Rev: 05.03.2025 */
/* todo: implementierung folgepassage missing */
/* todo: ueberpruefung von: ON DELETE CASCADE */


/* falls wir das genauso uebernehmen */
DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS "user" (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);


/* da noch keinen nn fuer vor, nachname und Gebdatum */
CREATE TABLE IF NOT EXISTS "Person" (
    /* hab das auf PANr geaendert da es sonst mit den spaeteren FKs zach wird mit dem zusammengesetzten SVNR + GebDatum*/
    "PANr" NUMBER(4),
    /* es gibt keinen eigenen date type kann als int, text, oder real angegeben werden */ 
    "GebDatum" INTEGER,
    "Vorname" TEXT(50),
    "Nachname" TEXT(50),
    "PLZ" NUMBER(4),
    "Ort" TEXT(50),
    "Strasse" TEXT(50),
    "Hausnummer" NUMBER(4),
    CONSTRAINT pk_Person PRIMARY KEY (PANr)
);

CREATE TABLE IF NOT EXISTS "Telefonnummer" (
    "TelNummer" TEXT(20),
    "PANr" NUMBER(4),
    CONSTRAINT pk_Telefonnummer PRIMARY KEY (PANr, TelNummer),
    CONSTRAINT fk_Telefonnummer_Person FOREIGN KEY (PANr) REFERENCES Person (PANr)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Angestellter_besitzt_Gehaltskonto" (
    "AngestelltenNr" TEXT(10)
        CONSTRAINT nn_AngestelltenNr_Angestellter_besitzt_Gehaltskonto NOT NULL,
    "PANr" NUMBER (4),
    "Kontonummer" TEXT (20)
        CONSTRAINT nn_Kontonummer_Angestellter_besitzt_Gehaltskonto NOT NULL,
    "Kontostand" NUMBER (20),
    "BLZ" NUMBER (5)
        CONSTRAINT nn_BLZ NOT NULL,
    CONSTRAINT pk_Angestellter_besitzt_Gehaltskonto PRIMARY KEY (PANr),
    CONSTRAINT fk_Angestellter_besitzt_Gehaltskonto_Person FOREIGN KEY (PANr) REFERENCES Person (PANr)
        ON DELETE CASCADE,
    CONSTRAINT fk_Angestellter_besitzt_Gehaltskonto_Bank FOREIGN KEY (BLZ) REFERENCES Bank (BLZ)
);

/* wahrscheinlich sinvoll nn fuer bankname*/
CREATE TABLE IF NOT EXISTS "Bank" (
    "Name" TEXT(50),
    "BLZ" NUMBER(5),
    CONSTRAINT pk_Bank PRIMARY KEY (BLZ)
);

/*Zeiten als text gespeichert vll bei der implementierung aenderung auf INT */
CREATE TABLE IF NOT EXISTS "Passage" (
    "Passagennummer" TEXT(10),
    "Abfahrtszeit" TEXT(10),
    "Ankunftszeit" TEXT(10),
    "Abfahrtshafen" TEXT(20),
    "Zielhafen" TEXT(20),
    CONSTRAINT pk_Passage PRIMARY KEY (Passagennummer)
);

/* implementierung folgepassage missing */

CREATE TABLE IF NOT EXISTS "Passagier" (
    "PassagierNr" TEXT(10),
    "PANr" NUMBER(4)
        CONSTRAINT nn_PANr_Passagier NOT NULL,
    CONSTRAINT pk_Passagier PRIMARY KEY (PassagierNr),
    CONSTRAINT fk_Passagier_Person FOREIGN KEY (PANr) REFERENCES Person (PANr)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Kapitaen" (
    "KapitaenpatentNr" TEXT(10),
    "Seemeilen" NUMBER(10),
    "PANr" NUMBER(4)
        CONSTRAINT nn_PANr_Kapitaen,
    CONSTRAINT pk_Kapitaen PRIMARY KEY (KapitaenpatentNr),
    CONSTRAINT fk_Kapitaen_Angestellter_besitzt_Gehaltskonto FOREIGN KEY (PANr) REFERENCES Angestellter_besitzt_Gehaltskonto (PANr)
        ON DELETE CASCADE

);

CREATE TABLE IF NOT EXISTS "Techniker" (
    "Lizenznummer" TEXT(10),
    "Ausbildung" TEXT(20),
    "Typennummer" TEXT(10)
        CONSTRAINT nn_Typennummer_Techniker NOT NULL,
    "PANr" NUMBER(4)
        CONSTRAINT nn_PANr_Techniker NOT NULL,
    CONSTRAINT pk_Techniker PRIMARY KEY (Lizenznummer),
    CONSTRAINT fk_Techniker_Person FOREIGN KEY (PANr) REFERENCES Person (PANr)
        ON DELETE CASCADE,
    CONSTRAINT fk_Techniker_Schiffstyp FOREIGN KEY (Typennummer) REFERENCES Schiffstyp (Typennummer)
);

CREATE TABLE IF NOT EXISTS "Schiffstyp" (
    "Typennummer" TEXT(10),
    "Bruttoregistertonnen" NUMBER(10),
    "Besatzungsstaerke" NUMBER(5),
    "Typenbezeichnung" TEXT(20),
    "Herstellername" TEXT(20)
        CONSTRAINT nn_Herstellername_Schiffstyp NOT NULL,
    CONSTRAINT pk_Schiffstyp PRIMARY KEY (Typennummer),
    CONSTRAINT fk_Schiffstyp_Hersteller FOREIGN KEY (Herstellername) REFERENCES Hersteller (Herstellername)
);

CREATE TABLE IF NOT EXISTS "Hersteller" (
    "Herstellername" TEXT(20),
    CONSTRAINT pk_Herstellername PRIMARY KEY (Herstellername)
);


/* wenn logbuch geloescht auch Schiff geloescht */
CREATE TABLE IF NOT EXISTS "Schiffexemplar_hat_Logbuch" (
    "InventarNr" TEXT(10)
        CONSTRAINT nn_InventarNr_Schiffexemplar_hat_Logbuch NOT NULL,
    "Baujahr" NUMBER(4),
    "Seemeilen" NUMBER(10),
    "Typennummer" TEXT(10)
        CONSTRAINT nn_Typennummer_Schiffexemplar_hat_Logbuch NOT NULL,
    "LogbuchNr" TEXT(10),
    CONSTRAINT pk_Schiffexemplar_hat_Logbuch PRIMARY KEY (LogbuchNr),
    CONSTRAINT fk_Schiffexemplar_hat_Logbuch_Schiffstyp FOREIGN KEY (Typennummer) REFERENCES Schiffstyp (Typennummer)
        ON DELETE CASCADE
);

/* Datum als INTEGER wie gebdatum */
CREATE TABLE IF NOT EXISTS "Buchen" (
    "Buchungsnummer" TEXT(10),
    "Datum" INTEGER,
    "Klasse" NUMBER(1),
    "PassagierNr" TEXT(10)
        CONSTRAINT nn_PassagierNR_Buchen NOT NULL,
    "Passagennummer" TEXT(10)
        CONSTRAINT nn_Passagennummer_Buchen NOT NULL,
    CONSTRAINT pk_Buchen PRIMARY KEY (Buchungsnummer),
    CONSTRAINT fk_Buchen_Passagier FOREIGN KEY (PassagierNr) REFERENCES Passagier (PassagierNr),
    CONSTRAINT fk_Buchen_Passage FOREIGN KEY (Passagennummer) REFERENCES Passage (Passagennummer)
);

/* Kapitaen fahren schiffe evtl name aendern */
CREATE TABLE IF NOT EXISTS "Fahren" (
    "KapitaenpatentNr" TEXT(10),
    "Typennummer" TEXT(10),
    "Passagennummer" TEXT(10),
    CONSTRAINT pk_Fahren PRIMARY KEY (KapitaenpatentNr, Typennummer, Passagennummer),
    CONSTRAINT fk_Fahren_Kapitaen FOREIGN KEY (KapitaenpatentNr) REFERENCES Kapitaen (KapitaenpatentNr),
    CONSTRAINT fk_Fahren_Schiffstyp FOREIGN KEY (Typennummer) REFERENCES Schiffstyp (Typennummer),
    CONSTRAINT fk_Fahren_Passage FOREIGN KEY (Passagennummer) REFERENCES Passage (Passagennummer)
);

/* Das spannende thema mal schaun ob diese implementierung funktioniert */
CREATE TABLE IF NOT EXISTS "Status_der_Entlehnung" (
    "LogbuchNr" TEXT(10),
    "KapitaenpatentNr" TEXT(10),
    "TechnikerNr" TEXT(10),
    CONSTRAINT pk_Status_der_Entlehnung PRIMARY KEY (LogbuchNr),
    CONSTRAINT fk_Status_der_Entlehnung_Logbuch FOREIGN KEY (LogbuchNr) REFERENCES Schiffexemplar_hat_Logbuch (LogbuchNr),
    CONSTRAINT fk_Status_der_Entlehnung_Kapitaen FOREIGN KEY (KapitaenpatentNr) REFERENCES Kapitaen (KapitaenpatentNr),
    CONSTRAINT fk_Status_der_Entlehnung_Techniker FOREIGN KEY (TechnikerNr) REFERENCES Techniker (Lizenznummer),
    CONSTRAINT special_Status_der_Entlehnung CHECK ((KapitaenpatentNr IS NULL AND TechnikerNr IS NOT NULL) OR (KapitaenpatentNr IS NOT NULL AND TechnikerNr IS NULL))
);


/* ab hier die alte Datenbank */


CREATE TABLE IF NOT EXISTS "Personen" (
	"PANr" NUMBER(5),
	"Vorname" TEXT(50)
		CONSTRAINT nn_Personen_Vorname NOT NULL,
	"Nachname" TEXT(50)
		CONSTRAINT nn_Personen_Nachname NOT NULL,
	"PLZ" NUMBER(5),
	"Ort" TEXT(10),
	"Strasse" TEXT(10),
	"HNr" NUMBER(3),
	"GebDatum" INTEGER
		CONSTRAINT nn_Personen_GebDatum NOT NULL,
	CONSTRAINT pk_Personen PRIMARY KEY (PANr)
);


CREATE Table IF NOT EXISTS "Pers_Telefon" (
	"PANr" NUMBER(5),
	"Telefon" TEXT(20),
	CONSTRAINT pk_Pers_Telefon PRIMARY KEY (PANr, Telefon),
	CONSTRAINT fk_Pers_Telefon_Personen FOREIGN KEY (PANr) REFERENCES Personen (PANr)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Mitarbeiter"(
	"PANr" NUMBER(5),
	"AngNr" TEXT(20)
		CONSTRAINT unq_Mitarbeiter_AngNr UNIQUE
		CONSTRAINT nn_Mitarbeiter_AngNr NOT NULL,
	"Fachbereich" TEXT(20),
	"Gehalt" NUMBER(7),
	"Raum" NUMBER(3),
	"Einstellung" INTEGER,
	CONSTRAINT pk_Mitarbeiter PRIMARY KEY (PANr),
	CONSTRAINT fk_Mitarbeiter_Personen FOREIGN KEY (PANr) REFERENCES Personen (PANr)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS  "Lehrstuehle"(
	"Lehrstuhlbezeichnung" TEXT(50),
	"Anzahl_Planstellen" NUMBER(2)
		CONSTRAINT chk_Lehrstuehle_Anz_Planst CHECK (Anzahl_Planstellen >= 0),
	CONSTRAINT pk_Lehrstuehle PRIMARY KEY (Lehrstuhlbezeichnung)

);

CREATE TABLE IF NOT EXISTS "Professoren"(
	"PANr" NUMBER(5),
	"Lehrstuhlbezeichnung" TEXT(50)
		CONSTRAINT unq_Professoren_Lehrstuhlbez UNIQUE
		CONSTRAINT nn_Professoren_Lehrstuhlbez NOT NULL,
	"Stufe" TEXT(50)
		CONSTRAINT nn_Professoren_Stufe NOT NULL
		CONSTRAINT chk_Professoren_Stufe CHECK (Stufe IN ('C4', 'C3', 'C2', 'C1')),
	CONSTRAINT pk_Professoren PRIMARY KEY (PANr),
	CONSTRAINT fk_Professoren_Mitarbeiter FOREIGN KEY (PANr) REFERENCES Mitarbeiter (PANr)
		ON DELETE CASCADE,
	CONSTRAINT fk_Professoren_Lehrstuehle FOREIGN KEY (Lehrstuhlbezeichnung) 
		REFERENCES Lehrstuehle (Lehrstuhlbezeichnung)
);

CREATE TABLE IF NOT EXISTS "Studenten" (
	"PANr" NUMBER(5),
	"Matrikelnummer" TEXT(20)
		CONSTRAINT unq_Studenten_Matrikelnummer UNIQUE
		CONSTRAINT nn_Studenten_Matrikelnummer NOT NULL,
	"Studienfach" TEXT(20),
	"Immatrikulationsdatum" INTEGER
		CONSTRAINT nn_Studenten_Immatr_datum NOT NULL,
	CONSTRAINT pk_Studenten PRIMARY KEY (PANr),
	CONSTRAINT fk_Studenten_Personen FOREIGN KEY (PANr) REFERENCES Personen (PANr)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "Vorlesungen"(
	"V_Bezeichnung" TEXT(50),
	"SWS" NUMBER(2)
		CONSTRAINT chk_Vorlesungen_SWS CHECK (SWS > 0),
	"Semester" NUMBER(2)
		CONSTRAINT chk_Vorlesungen_Semester CHECK (Semester > 0),
	"Studiengang" TEXT(20),
	CONSTRAINT pk_Vorlesungen PRIMARY KEY (V_Bezeichnung)
);

CREATE TABLE IF NOT EXISTS "Verlage"(
	"Verlagsname" TEXT(30),
	"Verlagsort" TEXT(30),
	CONSTRAINT pk_Verlage PRIMARY KEY (Verlagsname)
);

CREATE TABLE IF NOT EXISTS "Buecher"(
	"ISBN" TEXT(20),
	"Titel" TEXT(100)
		CONSTRAINT nn_Buecher_Titel NOT NULL,
	"Verlagsname" TEXT(30)
		CONSTRAINT nn_Buecher_Verlagsname NOT NULL,
	CONSTRAINT pk_Buecher PRIMARY KEY (ISBN),
	CONSTRAINT fk_Buecher_Verlage FOREIGN KEY (Verlagsname) REFERENCES Verlage (Verlagsname)
);

CREATE TABLE IF NOT EXISTS "Buch_Autor" (
	"ISBN" TEXT(20),
	"Autor" TEXT(20),
	CONSTRAINT pk_Buch_Autor PRIMARY KEY (ISBN, Autor),
	CONSTRAINT fk_Buch_Autor_Buecher FOREIGN KEY (ISBN) REFERENCES Buecher (ISBN) 
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS  "Buch_Stichwort"
	(
	ISBN TEXT(20),
	Stichwort TEXT(20),
	CONSTRAINT pk_Buch_Stichwort PRIMARY KEY (ISBN, Stichwort),
	CONSTRAINT fk_Buch_Stichwort_Buecher FOREIGN KEY (ISBN) REFERENCES Buecher (ISBN) ON DELETE CASCADE
	);

CREATE TABLE IF NOT EXISTS  "Buch_Versionen"
	(
	ISBN TEXT(20),
	Auflage NUMBER(2),
	Jahr NUMBER(4)
			CONSTRAINT nn_Buch_Versionen_Jahr NOT NULL
			CONSTRAINT chk_Buch_Versionen_Jahr CHECK (Jahr >= 1800),
	Seiten NUMBER(4),
	Preis NUMBER
			CONSTRAINT chk_Buch_Versionen_Preis CHECK (Preis >= 0),
	CONSTRAINT pk_Buch_Versionen PRIMARY KEY (ISBN, Auflage),
	CONSTRAINT fk_Buch_Versionen_Buecher FOREIGN KEY (ISBN) REFERENCES Buecher (ISBN) ON DELETE CASCADE
	);

CREATE TABLE IF NOT EXISTS Buch_Exemplare
	(
	Inventarnr NUMBER(5),
	ISBN TEXT(20)
			CONSTRAINT nn_Buch_Exemplare_ISBN NOT NULL,
	Auflage NUMBER(2)
			CONSTRAINT nn_Buch_Exemplare_Auflage NOT NULL,
	CONSTRAINT pk_Buch_Exemplare PRIMARY KEY (Inventarnr),
	CONSTRAINT fk_Buch_Exemplare_Buch_Vers FOREIGN KEY (ISBN, Auflage) REFERENCES Buch_Versionen (ISBN, Auflage) ON DELETE CASCADE
	);

CREATE TABLE IF NOT EXISTS "Ausleihe" (
	"Inventarnr" NUMBER(5),
	"PANr" NUMBER(5)
		CONSTRAINT nn_Ausleihe_PANr NOT NULL,
	CONSTRAINT pk_Ausleihe PRIMARY KEY (Inventarnr),
	CONSTRAINT fk_Ausleihe_Buch_Exemplare FOREIGN KEY (Inventarnr) REFERENCES Buch_Exemplare (Inventarnr),
	CONSTRAINT fk_Ausleihe_Personen FOREIGN KEY (PANr) REFERENCES Personen (PANr)
);

CREATE TABLE IF NOT EXISTS "prueft" (
	"PANr" NUMBER(5),
	"Matrikelnummer" TEXT(20),
	"V_Bezeichnung" TEXT(20),
	"Note" NUMBER
		CONSTRAINT nn_prueft_Note NOT NULL
		CONSTRAINT chk_prueft_Note CHECK (Note BETWEEN 1 and 5),
	CONSTRAINT pk_prueft PRIMARY KEY (PANr, Matrikelnummer, V_Bezeichnung),
	CONSTRAINT fk_prueft_Professoren FOREIGN KEY (PANr) REFERENCES Professoren (PANr) 
		ON DELETE CASCADE,
	CONSTRAINT fk_prueft_Studenten FOREIGN KEY (Matrikelnummer) REFERENCES Studenten (Matrikelnummer),
	CONSTRAINT fk_prueft_Vorlesungen FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung)
);

CREATE TABLE IF NOT EXISTS "empfiehlt"(
	"PANr" NUMBER(5),
	"ISBN" TEXT(20),
	"V_Bezeichnung" TEXT(50),
	CONSTRAINT pk_empfiehlt PRIMARY KEY (PANr, ISBN, V_Bezeichnung),
	CONSTRAINT fk_empfiehlt_Professoren FOREIGN KEY (PANr) REFERENCES Professoren (PANr),
	CONSTRAINT fk_empfiehlt_Buecher FOREIGN KEY (ISBN) REFERENCES Buecher (ISBN),
	CONSTRAINT fk_empfiehlt_Vorlesungen FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung)
);

CREATE TABLE IF NOT EXISTS "Vorl_Voraus"(
	"V_Bezeichnung" TEXT(50),
	"Voraussetzung" TEXT(50),
	CONSTRAINT pk_Vorl_Voraus PRIMARY KEY (V_Bezeichnung, Voraussetzung),
	CONSTRAINT fk_Vorl_Voraus_Vorlesungen1 FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung)
		ON DELETE CASCADE,
	CONSTRAINT fk_Vorl_Voraus_Vorlesungen2 FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung) 
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "liest"(
	"PANr" NUMBER(5),
	"V_Bezeichnung" TEXT(50),
	"Semester" TEXT(10),
	CONSTRAINT pk_liest PRIMARY KEY (PANr, V_Bezeichnung),
	CONSTRAINT fk_liest_Professoren FOREIGN KEY (PANr) REFERENCES Professoren (PANr) 
		ON DELETE CASCADE,
	CONSTRAINT fk_liest_Vorlesungen FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "hoert"(
	"Matrikelnummer" TEXT(20),
	"V_Bezeichnung" TEXT(50),
	"Semester" NUMBER(2)
		CONSTRAINT chk_hoert_Semester CHECK (Semester > 0),
	CONSTRAINT pk_hoert PRIMARY KEY (Matrikelnummer, V_Bezeichnung),
	CONSTRAINT fk_hoert_Studenten FOREIGN KEY (Matrikelnummer) REFERENCES Studenten (Matrikelnummer)
		ON DELETE CASCADE,
	CONSTRAINT fk_hoert_Vorlesungen FOREIGN KEY (V_Bezeichnung) REFERENCES Vorlesungen (V_Bezeichnung)
		ON DELETE CASCADE
);

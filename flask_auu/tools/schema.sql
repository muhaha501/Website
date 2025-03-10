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
create table Status_der_Entlehnung
(
    LogbuchNr        TEXT(10)
        constraint pk_Status_der_Entlehnung
            primary key
        constraint fk_Status_der_Entlehnung_Logbuch
            references Schiffexemplar_hat_Logbuch,
    KapitaenpatentNr TEXT(10)
        constraint fk_Status_der_Entlehnung_Kapitaen
            references Kapitaen,
    TechnikerNr      TEXT(10)
        constraint fk_Status_der_Entlehnung_Techniker
            references Techniker,
    PANr             NUMBER(4),
    DATUM            TEXT,
    constraint special_Status_der_Entlehnung
        check ((KapitaenpatentNr IS NULL AND TechnikerNr IS NOT NULL) OR
               (KapitaenpatentNr IS NOT NULL AND TechnikerNr IS NULL))
);
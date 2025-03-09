/* SQLite syntax*/
/* last update 07 Maerz 23 */
/* syntax differs from univ lib in https://edu.dedisys.org/WBTServer/faces/main.jsp */

/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('1234', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('2345', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('3456', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Mitarbeiter und Techniker */
Insert into user (username, password) values ('7754', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Mitarbeiter und Techniker */
Insert into user (username, password) values ('7457', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4two! */ /* dieser wird ein Mitarbeiter und Kapitaen */
Insert into user (username, password) values ('6834', 'pbkdf2:sha256:260000$mpqrArAgux5YGorA$aeda075bfc2657fc7ff500ed15901e591ad81080920aa22121cb90ce758c855b');
/*pw: Go4two! */ /* dieser wird ein Mitarbeiter und Kapitaen */
Insert into user (username, password) values ('6541', 'pbkdf2:sha256:260000$mpqrArAgux5YGorA$aeda075bfc2657fc7ff500ed15901e591ad81080920aa22121cb90ce758c855b');
/*pw: guest! Habe ich Rausgenummen um die Register Logik einfacher zu machen*/
--Insert into user (username, password) values ('guest', 'pbkdf2:sha256:260000$MzkPXrPPnl7F5dN7$11fed544bf7be1e520e908eaaea1222d62e3b567b36853a68116b617ae75882f');


/*UNSERE DATEN FUER SCHIFFSFAHRT*/

/*Passagiere*/
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('1234','01.10.95','Max','Dre','9613','Wien','Hauptstrasse','38');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('2345','15.05.90', 'Anna', 'Müller', '1020', 'Wien', 'Ringstrasse', '12');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('3456','22.11.85', 'Lukas', 'Schmidt', '8010', 'Graz', 'Bahnhofstrasse', '5');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('4711','03.07.88', 'Sophie', 'Maier', '5020', 'Salzburg', 'Mozartplatz', '7');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('5588','09.09.92', 'Felix', 'Huber', '4020', 'Linz', 'Landstrasse', '20');
/*Mitarbeiter Kapitaen*/
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('6541','18.12.97', 'Laura', 'Wagner', '6900', 'Bregenz', 'Seestrasse', '3');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('6834','25.03.89', 'Thomas', 'Bauer', '6020', 'Innsbruck', 'Bergstrasse', '14');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('6123','13.09.80', 'Peter', 'Huber', '3071', 'Böheimkirchen', 'Hauptsrtasse', '9');
/*Mitarbeiter Techniker*/
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('7457','30.06.94', 'Julia', 'Lehner', '3500', 'Krems', 'Donauweg', '9');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('7754','05.08.91', 'Michael', 'Fischer', '2340', 'Mödling', 'Schulweg', '22');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('8832','12.04.96', 'Clara', 'Beck', '3100', 'St. Pölten', 'Marktplatz', '11');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('9912','17.02.93', 'Daniel', 'Gruber', '4400', 'Steyr', 'Lindenweg', '6');
Insert into PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values ('9999','29.09.98', 'Sarah', 'Hofer', '7000', 'Eisenstadt', 'Hauptplatz', '15');

INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0676/7894561','1234');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('02742/12744','1234');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0664/6487554','9999');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0677/8947564','7754');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0676/1247896','7457');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0664/4548851','2345');

INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1001', 6541, 'AT12345678901234567890', 3500.00, 10000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1002', 6834, 'AT23456789012345678901', 4200.50, 20000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1003', 7457, 'AT34567890123456789012', 5000.00, 30000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1004', 7754, 'AT45678901234567890123', 3300.75, 40000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1005', 8832, 'AT56789012345678901234', 4800.20, 50000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1006', 9912, 'AT67890123456789012345', 5500.00, 10000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1007', 9999, 'AT78901234567890123456', 6000.00, 20000);

INSERT into Bank (Name, BLZ) values ('Deutsche Bank', 10000);
INSERT into Bank (Name, BLZ) values ('Hypo Landesbank', 20000);
INSERT into Bank (Name, BLZ) values ('Sparkasse', 30000);
INSERT into Bank (Name, BLZ) values ('Volksbank', 40000);
INSERT into Bank (Name, BLZ) values ('ING', 50000);


INSERT into Passage (Passagennummer, Abfahrtszeit, Ankunftszeit, Abfahrtshafen, Zielhafen) VALUES ('PS10001', '08:30', '12:00', 'Wien', 'Krems');
INSERT into Passage (Passagennummer, Abfahrtszeit, Ankunftszeit, Abfahrtshafen, Zielhafen) VALUES ('PS10002', '14:00', '18:30', 'Krems', 'Linz');
INSERT into Passage (Passagennummer, Abfahrtszeit, Ankunftszeit, Abfahrtshafen, Zielhafen) VALUES ('PS10003', '09:45', '13:15', 'Tulln', 'Melk');
INSERT into Passage (Passagennummer, Abfahrtszeit, Ankunftszeit, Abfahrtshafen, Zielhafen) VALUES ('PS10004', '12:20', '21:00', 'Wien', 'Belgrad');
INSERT into Passage (Passagennummer, Abfahrtszeit, Ankunftszeit, Abfahrtshafen, Zielhafen) VALUES ('PS10005', '07:00', '11:45', 'Budapest', 'Wien');


INSERT into Passagier (PassagierNr, PANr) values ('P-12564',1234);
INSERT into Passagier (PassagierNr, PANr) values ('P-45687',2345);
INSERT into Passagier (PassagierNr, PANr) values ('P-25864',3456);
INSERT into Passagier (PassagierNr, PANr) values ('P-87954',4711);
INSERT into Passagier (PassagierNr, PANr) values ('P-31456',5588);

INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-12345',1512,6541);
INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-90001',984,6834);
INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-54645',345,6123);

INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-12345','HTL','DS006',7457);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-45648','Hochschule','DS001',7754);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-00011','HTL','DS003',8832);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-13001','Hochschule','DS002',9912);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-87400','Hochschule','DS004',9999);


INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS001', 46328, 86, 'Raddampfer', 'Meyer Werft');
INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS002', 52310, 92, 'Passagierdampfer', 'Fincantieri');
INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS003', 34800, 50, 'Frachtschiff', 'Meyer Werft');
INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS004', 29800, 40, 'Flussschiff', 'Damen Shipyards');
INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS005', 58900, 110, 'Ozeandampfer', 'Hyundai Heavy Industries');
INSERT into Schiffstyp (Typennummer,Bruttoregistertonnen,Besatzungsstaerke,Typenbezeichnung, Herstellername) values ('DS006', 154000, 180, 'Passagierdampfer', 'Hyundai Heavy Industries');

INSERT into Hersteller (Herstellername) values ('Meyer Werft');
INSERT into Hersteller (Herstellername) values ('Hyundai Heavy Industries');
INSERT into Hersteller (Herstellername) values ('STX Europe');
INSERT into Hersteller (Herstellername) values ('Fincantieri');
INSERT into Hersteller (Herstellername) values ('Damen Shipyards');

INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1001', 1999, 500000, 'DS001', 'LB001');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1002', 2005, 750000, 'DS002', 'LB002');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1003', 2010, 350000, 'DS003', 'LB003');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1004', 2015, 400000, 'DS004', 'LB004');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1005', 2018, 150000, 'DS005', 'LB005');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1006', 2012, 200000, 'DS001', 'LB006');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1007', 2016, 220000, 'DS003', 'LB007');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1008', 2020, 180000, 'DS002', 'LB008');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1009', 2017, 300000, 'DS004', 'LB009');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1010', 2021, 250000, 'DS005', 'LB010');

INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B001', '2025-03-01', 1, 'P-12564', 'PS10001');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B002', '2025-03-04', 2, 'P-12564', 'PS10002');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B003', '2025-04-30', 1, 'P-45687', 'PS10003');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B004', '2025-02-19', 3, 'P-25864', 'PS10001');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B005', '2025-06-15', 2, 'P-25864', 'PS10004');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B006', '2025-06-30', 1, 'P-87954', 'PS10005');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B007', '2025-08-09', 2, 'P-87954', 'PS10002');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B008', '2025-02-06', 1, 'P-31456', 'PS10003');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B009', '2025-03-30', 3, 'P-31456', 'PS10004');
INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)
VALUES ('B010', '2025-05-25', 1, 'P-12564', 'PS10005');



INSERT INTO Fahren (KapitaenpatentNr, Typennummer, Passagennummer) VALUES ('K-12345', 'DS003', 'PS10001');
INSERT INTO Fahren (KapitaenpatentNr, Typennummer, Passagennummer) VALUES ('K-12345', 'DS001', 'PS10002');
INSERT INTO Fahren (KapitaenpatentNr, Typennummer, Passagennummer) VALUES ('K-90001', 'DS005', 'PS10003');
INSERT INTO Fahren (KapitaenpatentNr, Typennummer, Passagennummer) VALUES ('K-54645', 'DS002', 'PS10004');
INSERT INTO Fahren (KapitaenpatentNr, Typennummer, Passagennummer) VALUES ('K-54645', 'DS004', 'PS10005');



INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB001', 'K-12345', NULL);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB002', NULL, 'T-87400'); 
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB003', 'K-90001', NULL);  
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB004', NULL, 'T-87400');  
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB005', 'K-90001', NULL);  
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr) VALUES ('LB006', NULL, 'T-00011');










/*ALTE DATEN DER UNIVERSITAET*/

Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('1234','Max','Dre','96123','AL','BL','38','01.10.95');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('2345','Lunda','Lindt','96124','VT','RT','38','01.10.99');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('3456','Li','Li','96125','HD','ID','38','01.10.03');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('4711','Andreas','Heuer','18209','DBG','BHS','15','31.10.58');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('5588','Gunter','Saake','39106','MD','STS','55','05.10.60');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('6834','Michael','Korn','39104','MD','BS','41','24.09.74');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('7754','Andreas','Mueller','18209','DBR','RS','31','25.02.76');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('8832','Tamara','Jagellovsk','38106','BS','GS','12','11.11.73');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('9912','Antje','Hellhof','18059','HRO','AES','21','04.04.70');
Insert into PERSONEN (PANR,VORNAME,NACHNAME,PLZ,ORT,STRASSE,HNR,GEBDATUM) values ('9999','Christa','Loeser','96121','HD','TS','38','10.05.69');


Insert into PERS_TELEFON (PANR,TELEFON) values ('4711','0381-498-3401');
Insert into PERS_TELEFON (PANR,TELEFON) values ('4711','0381-498-3427');
Insert into PERS_TELEFON (PANR,TELEFON) values ('4711','038203-12230');
Insert into PERS_TELEFON (PANR,TELEFON) values ('5588','0391-345677');
Insert into PERS_TELEFON (PANR,TELEFON) values ('5588','0391-5592-3800');
Insert into PERS_TELEFON (PANR,TELEFON) values ('9999','06221-400177');


Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('4711','HRO-3447','Informatik','6000','209','01.03.94');
Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('5588','MD-5267','Informatik','6000','304','01.04.94');
Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('6834','MD-77185','Mathematik','750','309','01.09.94');
Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('7754','HRO-18532','Informatik','550','218','01.10.94');
Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('8832','MD-4567','Informatik','2800','302','01.08.94');
Insert into MITARBEITER (PANR,ANGNR,FACHBEREICH,GEHALT,RAUM,EINSTELLUNG) values ('9912','HRO-8134','Linguistik','2600','8','01.01.93');


Insert into LEHRSTUEHLE (LEHRSTUHLBEZEICHNUNG,ANZAHL_PLANSTELLEN) values ('Datenbank- und Informationssysteme','4');
Insert into LEHRSTUEHLE (LEHRSTUHLBEZEICHNUNG,ANZAHL_PLANSTELLEN) values ('Datenbanken und Informationssysteme','5');
Insert into LEHRSTUEHLE (LEHRSTUHLBEZEICHNUNG,ANZAHL_PLANSTELLEN) values ('Rechnernetze','2');


Insert into PROFESSOREN (PANR,LEHRSTUHLBEZEICHNUNG,STUFE) values ('4711','Datenbank- und Informationssysteme','C4');
Insert into PROFESSOREN (PANR,LEHRSTUHLBEZEICHNUNG,STUFE) values ('5588','Datenbanken und Informationssysteme','C4');


Insert into STUDENTEN (PANR,MATRIKELNUMMER,STUDIENFACH,IMMATRIKULATIONSDATUM) values ('1234','XY-951372','Informatik','01.10.95');
Insert into STUDENTEN (PANR,MATRIKELNUMMER,STUDIENFACH,IMMATRIKULATIONSDATUM) values ('2345','RS-992292','Informatik','01.10.99');
Insert into STUDENTEN (PANR,MATRIKELNUMMER,STUDIENFACH,IMMATRIKULATIONSDATUM) values ('3456','AY-031370','Informatik','01.10.03');
Insert into STUDENTEN (PANR,MATRIKELNUMMER,STUDIENFACH,IMMATRIKULATIONSDATUM) values ('6834','MD-891372','Informatik','01.10.89');
Insert into STUDENTEN (PANR,MATRIKELNUMMER,STUDIENFACH,IMMATRIKULATIONSDATUM) values ('7754','HRO-912291','Informatik','01.10.91');


Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Datenbanken I','4','5','Informatik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Datenbanken II','4','6','Informatik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Datenbanken','3','7','Mathematik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Objektorientierte Datenbanken','4','6','Informatik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Datenbanken fuer Ingenieure','2','7','Elektrotechnik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Verteilte Datenbanken','2','8','Informatik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Theorie relationaler Datenbanken','3','9','Informatik');
Insert into VORLESUNGEN (V_BEZEICHNUNG,SWS,SEMESTER,STUDIENGANG) values ('Spezifikationsmethoden','3','10','Informatik');


Insert into VERLAGE (VERLAGSNAME,VERLAGSORT) values ('Addison-Wesley','Bonn');
Insert into VERLAGE (VERLAGSNAME,VERLAGSORT) values ('Benjamin/Cummings','Redwood');
Insert into VERLAGE (VERLAGSNAME,VERLAGSORT) values ('Thomson','Bonn');


Insert into BUECHER (ISBN,TITEL,VERLAGSNAME) values ('3-89319-175-5','Das DB2-Handbuch','Addison-Wesley');
Insert into BUECHER (ISBN,TITEL,VERLAGSNAME) values ('0-8053-1753-8','Princ. Of DBS','Benjamin/Cummings');
Insert into BUECHER (ISBN,TITEL,VERLAGSNAME) values ('0-201-53771-0','Foundations of DB','Addison-Wesley');
Insert into BUECHER (ISBN,TITEL,VERLAGSNAME) values ('3-929821-31-1','Datenbanken','Thomson');


Insert into BUCH_AUTOR (ISBN,AUTOR) values ('0-201-53771-0','Abiteboul');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('0-201-53771-0','Hull');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('0-201-53771-0','Vianu');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('0-8053-1753-8','Elmasri');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('0-8053-1753-8','Navathe');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('3-89319-175-5','Vossen');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('3-89319-175-5','Witt');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('3-929821-31-1','Heuer');
Insert into BUCH_AUTOR (ISBN,AUTOR) values ('3-929821-31-1','Saake');


Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('0-201-53771-0','RDB');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('0-201-53771-0','Therie');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('0-8053-1753-8','ER');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('0-8053-1753-8','Lehrbuch');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('0-8053-1753-8','RDB');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('3-89319-175-5','RDB');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('3-929821-31-1','ER');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('3-929821-31-1','Lehrbuch');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('3-929821-31-1','OODB');
Insert into BUCH_STICHWORT (ISBN,STICHWORT) values ('3-929821-31-1','RDB');


Insert into BUCH_VERSIONEN (ISBN,AUFLAGE,JAHR,SEITEN,PREIS) values ('3-89319-175-5','1','1990','288','79');
Insert into BUCH_VERSIONEN (ISBN,AUFLAGE,JAHR,SEITEN,PREIS) values ('0-8053-1753-8','1','1989','802','72,35');
Insert into BUCH_VERSIONEN (ISBN,AUFLAGE,JAHR,SEITEN,PREIS) values ('0-8053-1753-8','2','1994','873','88,58');
Insert into BUCH_VERSIONEN (ISBN,AUFLAGE,JAHR,SEITEN,PREIS) values ('0-201-53771-0','1','1995','685','87,45');
Insert into BUCH_VERSIONEN (ISBN,AUFLAGE,JAHR,SEITEN,PREIS) values ('3-929821-31-1','1','1995','500','79');


Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('1','3-89319-175-5','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('5','0-8053-1753-8','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('84','0-8053-1753-8','2');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('85','0-8053-1753-8','2');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('101','0-201-53771-0','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('102','0-201-53771-0','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('138','3-929821-31-1','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('139','3-929821-31-1','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('140','3-929821-31-1','1');
Insert into BUCH_EXEMPLARE (INVENTARNR,ISBN,AUFLAGE) values ('141','3-929821-31-1','1');


Insert into AUSLEIHE (INVENTARNR,PANR) values ('1','1234');
Insert into AUSLEIHE (INVENTARNR,PANR) values ('140','7754');
Insert into AUSLEIHE (INVENTARNR,PANR) values ('141','4711');
Insert into AUSLEIHE (INVENTARNR,PANR) values ('101','2345');
Insert into AUSLEIHE (INVENTARNR,PANR) values ('102','3456');
Insert into AUSLEIHE (INVENTARNR,PANR) values ('85','6834');


Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','HRO-912291','Datenbanken I','2');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','HRO-912291','Objektorientierte Datenbanken','3');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('5588','MD-891372','Datenbanken I','1');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('5588','MD-891372','Spezifikationsmethoden','2');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('5588','XY-951372','Datenbanken I','1');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('5588','RS-992292','Spezifikationsmethoden','3');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('5588','AY-031370','Datenbanken I','3');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','HRO-912291','Theorie relationaler Datenbanken','1');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','HRO-912291','Spezifikationsmethoden','4');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','HRO-912291','Datenbanken II','1');
Insert into PRUEFT (PANR,MATRIKELNUMMER,V_BEZEICHNUNG,NOTE) values ('4711','MD-891372','Datenbanken I','1');


Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('4711','0-201-53771-0','Theorie relationaler Datenbanken');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('4711','0-8053-1753-8','Datenbanken I');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('4711','0-8053-1753-8','Datenbanken II');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('4711','3-929821-31-1','Datenbanken I');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('5588','0-8053-1753-8','Datenbanken I');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('5588','0-8053-1753-8','Datenbanken II');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('5588','3-89319-175-5','Datenbanken fuer Ingenieure');
Insert into EMPFIEHLT (PANR,ISBN,V_BEZEICHNUNG) values ('5588','3-929821-31-1','Datenbanken I');


Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Datenbanken II','Datenbanken I');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Objektorientierte Datenbanken','Datenbanken I');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Spezifikationsmethoden','Objektorientierte Datenbanken');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Spezifikationsmethoden','Theorie relationaler Datenbanken');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Theorie relationaler Datenbanken','Datenbanken I');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Verteilte Datenbanken','Datenbanken II');
Insert into VORL_VORAUS (V_BEZEICHNUNG,VORAUSSETZUNG) values ('Verteilte Datenbanken','Objektorientierte Datenbanken');


Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('4711','Datenbanken I','WS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('4711','Theorie relationaler Datenbanken','WS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('4711','Datenbanken II','SS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('4711','Objektorientierte Datenbanken','SS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('5588','Datenbanken fuer Ingenieure','WS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('5588','Datenbanken I','WS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('5588','Verteilte Datenbanken','SS');
Insert into LIEST (PANR,V_BEZEICHNUNG,SEMESTER) values ('5588','Spezifikationsmethoden','SS');


Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('MD-891372','Datenbanken I','5');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('MD-891372','Spezifikationsmethoden','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('MD-891372','Verteilte Datenbanken','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('HRO-912291','Datenbanken I','5');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('HRO-912291','Objektorientierte Datenbanken','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('HRO-912291','Datenbanken II','8');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('RS-992292','Objektorientierte Datenbanken','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('RS-992292','Datenbanken II','8');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('XY-951372','Spezifikationsmethoden','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('XY-951372','Datenbanken II','8');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('AY-031370','Spezifikationsmethoden','6');
Insert into HOERT (MATRIKELNUMMER,V_BEZEICHNUNG,SEMESTER) values ('AY-031370','Datenbanken I','5');

/* SQLite syntax*/
/* last change 13 March 25 */

/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('1001', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('1002', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Passagier */
Insert into user (username, password) values ('1003', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Mitarbeiter und Techniker */
Insert into user (username, password) values ('1200', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4one! */ /* dieser wird ein Mitarbeiter und Techniker */
Insert into user (username, password) values ('1204', 'pbkdf2:sha256:260000$TE7rfiidZO86orwh$7e0f8049432d0ab7842f45e2d1de68ed3c61fbd01655ba9a5d093e350cf9edfa');
/*pw: Go4two! */ /* dieser wird ein Mitarbeiter und Kapitaen */
Insert into user (username, password) values ('1100', 'pbkdf2:sha256:260000$mpqrArAgux5YGorA$aeda075bfc2657fc7ff500ed15901e591ad81080920aa22121cb90ce758c855b');
/*pw: Go4two! */ /* dieser wird ein Mitarbeiter und Kapitaen */
Insert into user (username, password) values ('1101', 'pbkdf2:sha256:260000$mpqrArAgux5YGorA$aeda075bfc2657fc7ff500ed15901e591ad81080920aa22121cb90ce758c855b');
/*pw: guest! Habe ich Rausgenummen um die Register Logik einfacher zu machen*/
--Insert into user (username, password) values ('guest', 'pbkdf2:sha256:260000$MzkPXrPPnl7F5dN7$11fed544bf7be1e520e908eaaea1222d62e3b567b36853a68116b617ae75882f');


/*UNSERE DATEN FUER SCHIFFSFAHRT*/

/*Passagiere*/
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1001', '1995-10-01', 'Max', 'Dre', '9613', 'Wien', 'Hauptstrasse', '38');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1002', '1990-05-15', 'Anna', 'Müller', '1020', 'Wien', 'Ringstrasse', '12');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1003', '1985-11-22', 'Lukas', 'Schmidt', '8010', 'Graz', 'Bahnhofstrasse', '5');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1004', '1988-07-03', 'Sophie', 'Maier', '5020', 'Salzburg', 'Mozartplatz', '7');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1005', '1992-09-09', 'Felix', 'Huber', '4020', 'Linz', 'Landstrasse', '20');
/*Mitarbeiter Kapitaen*/
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1100', '1997-12-18', 'Laura', 'Wagner', '6900', 'Bregenz', 'Seestrasse', '3');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1101', '1989-03-25', 'Thomas', 'Bauer', '6020', 'Innsbruck', 'Bergstrasse', '14');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1102', '1980-09-13', 'Peter', 'Huber', '3071', 'Böheimkirchen', 'Hauptsrtasse', '9');
/*Mitarbeiter Techniker*/
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1200', '1994-06-30', 'Julia', 'Lehner', '3500', 'Krems', 'Donauweg', '9');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1201', '1991-08-05', 'Michael', 'Fischer', '2340', 'Mödling', 'Schulweg', '22');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1202', '1996-04-12', 'Clara', 'Beck', '3100', 'St. Pölten', 'Marktplatz', '11');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1203', '1993-02-17', 'Daniel', 'Gruber', '4400', 'Steyr', 'Lindenweg', '6');
Insert into PERSON (PANR, GebDatum, VORNAME, NACHNAME, PLZ, ORT, STRASSE, Hausnummer)
values ('1204', '1998-09-29', 'Sarah', 'Hofer', '7000', 'Eisenstadt', 'Hauptplatz', '15');

INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0676/7894561','1001');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('02742/12744','1001');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0664/6487554','1101');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0677/8947564','1102');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0676/1247896','1200');
INSERT into TELEFONNUMMER (TELNUMMER,PANR) values ('0664/4548851','1201');

INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1001', 1100, 'AT12345678901234567890', 3500.00, 10000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1002', 1101, 'AT23456789012345678901', 4200.50, 20000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1003', 1102, 'AT34567890123456789012', 5000.00, 30000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1004', 1200, 'AT45678901234567890123', 3300.75, 40000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1005', 1201, 'AT56789012345678901234', 4800.20, 50000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1006', 1202, 'AT67890123456789012345', 5500.00, 10000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1007', 1203, 'AT78901234567890123456', 6000.00, 20000);
INSERT into Angestellter_besitzt_Gehaltskonto (AngestelltenNr, PANr, Kontonummer, Kontostand, BLZ) values ('A1008', 1204, 'AT71234234567890123456', 1200.00, 50000);

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


INSERT into Passagier (PassagierNr, PANr) values ('P-12564',1001);
INSERT into Passagier (PassagierNr, PANr) values ('P-45687',1002);
INSERT into Passagier (PassagierNr, PANr) values ('P-25864',1003);
INSERT into Passagier (PassagierNr, PANr) values ('P-87954',1004);
INSERT into Passagier (PassagierNr, PANr) values ('P-31456',1005);

INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-12345',1512,1100);
INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-90001',984,1101);
INSERT into Kapitaen (KapitaenpatentNr,Seemeilen,PANr) values ('K-54645',345,1102);

INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-12345','HTL','DS006',1200);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-45648','Hochschule','DS001',1201);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-00011','HTL','DS003',1202);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-13001','Hochschule','DS002',1203);
INSERT into Techniker (Lizenznummer,Ausbildung,Typennummer,PANr) values ('T-87400','Hochschule','DS004',1204);


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
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1011', 2020, 125000, 'DS006', 'LB011');
INSERT into Schiffexemplar_hat_Logbuch (InventarNr, Baujahr, Seemeilen, Typennummer, LogbuchNr) values ('SE1012', 2023, 100000, 'DS006', 'LB012');


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



INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB001', 'K-12345', NULL, '2025-01-01', 1100);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB002', NULL, 'T-13001', '2025-01-02', 1203);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB003', 'K-90001', NULL, '2025-01-03', 1101);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB004', NULL, 'T-13001', '2025-01-04', 1203);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB005', 'K-90001', NULL, '2025-01-05', 1101);
INSERT INTO Status_der_Entlehnung (LogbuchNr, KapitaenpatentNr, TechnikerNr, DATUM, PANr) VALUES ('LB006', NULL, 'T-45648', '2025-01-06', 1201);

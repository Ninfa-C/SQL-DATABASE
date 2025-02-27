use AziendaManagement

CREATE TABLE Impieghi (
IDImpiego UNIQUEIDENTIFIER PRIMARY KEY,
Tipo NVARCHAR(50) NOT NULL,
);

CREATE TABLE Impiegati(
IDImpiegato UNIQUEIDENTIFIER PRIMARY KEY,
nome NVARCHAR(100) NOT NULL,
cognome NVARCHAR(100) NOT NULL,
CodiceFiscale NVARCHAR(16) NOT NULL UNIQUE,
Et‡ int NOT NULL,
RedditoMensile DECIMAL(10,2) NOT NULL,
DetrazioneFiscale BIT NOT NULL,
IDImpiego UNIQUEIDENTIFIER NOT NULL,
Assunzione DATE NOT NULL,
CONSTRAINT FK_Impiegati_Impiego FOREIGN KEY (IDImpiego) REFERENCES Impieghi(IDImpiego)
);

INSERT INTO Impieghi (IDImpiego, Tipo) VALUES
(NEWID(), 'Sviluppatore'),
(NEWID(), 'Designer'),
(NEWID(), 'Tester'),
(NEWID(), 'HR Manager'),
(NEWID(), 'CEO');


DECLARE @1 UNIQUEIDENTIFIER, @2 UNIQUEIDENTIFIER, @3 UNIQUEIDENTIFIER, @4 UNIQUEIDENTIFIER, @5 UNIQUEIDENTIFIER;

SELECT @1 = IDImpiego FROM Impieghi WHERE Tipo = 'Sviluppatore';
SELECT @2 = IDImpiego FROM Impieghi WHERE Tipo = 'Designer';
SELECT @3 = IDImpiego FROM Impieghi WHERE Tipo = 'Tester';
SELECT @4 = IDImpiego FROM Impieghi WHERE Tipo = 'HR Manager';
SELECT @5 = IDImpiego FROM Impieghi WHERE Tipo = 'CEO';

INSERT INTO Impiegati (IDImpiegato, nome, cognome, CodiceFiscale, Et‡, RedditoMensile, DetrazioneFiscale, IDImpiego, Assunzione ) VALUES
(NEWID(), 'Marco', 'Rossi', 'RSSMRC80A01F205X', 35, 2500.50, 1, @1, '2022-04-09'),
(NEWID(), 'Luca', 'Bianchi', 'BNCLCU85B12H501Y', 40, 3200.75, 0, @2, '2021-06-12'),
(NEWID(), 'Giulia', 'Verdi', 'VRDGLL90C22D612Z', 29, 2800.00, 1, @3, '2023-01-10'),
(NEWID(), 'Elena', 'Neri', 'NRLENA95D13G702A', 31, 2600.90, 1, @4, '2019-11-20'),
(NEWID(), 'Francesco', 'Gialli', 'GLLFNC88E24J803B', 45, 4100.30, 0, @1, '2007-07-15'),
(NEWID(), 'Marta', 'Azzurri', 'AZZMRT93F14K904C', 27, 2300.10, 1, @2, '2020-02-28'),
(NEWID(), 'Davide', 'Marrone', 'MRNDVD87G25L105D', 38, 2900.80, 0, @1, '2017-05-10'),
(NEWID(), 'Serena', 'Argenti', 'ARGSRN92H16M206E', 33, 2700.60, 1, @1, '2021-09-22'),
(NEWID(), 'Alessandro', 'Blu', 'BLUALS86I17N307F', 36, 3100.40, 0, @1, '2022-12-12'),
(NEWID(), 'Federico', 'Viola', 'VLFDRC91J28O408G', 30, 2800.20, 1, @2, '2019-04-05'),
(NEWID(), 'Chiara', 'Porpora', 'PRPCHR94K19P509H', 28, 2550.90, 1, @3, '2007-06-18'),
(NEWID(), 'Giorgio', 'Bronzi', 'BRZGRG85L10Q601I', 22, 3300.70, 0, @4, '2015-08-30'),
(NEWID(), 'Silvia', 'Turchesi', 'TRCSLV90M21R702J', 53, 2750.80, 1, @5, '2002-03-15'),
(NEWID(), 'Antonio', 'Dorati', 'DRTANT89N22S803K', 39, 3000.00, 0, @2, '2021-11-11'),
(NEWID(), 'Beatrice', 'Verdoni', 'VRDBTR87O23T904L', 37, 2900.50, 1, @1, '2007-09-09'),
(NEWID(), 'Lorenzo', 'Smeraldi', 'SMRLNZ92P24U105M', 32, 2650.30, 1, @3, '2020-07-25'),
(NEWID(), 'Valeria', 'Rubini', 'RBNVLR95Q25V206N', 26, 2400.40, 1, @2, '2023-10-14'),
(NEWID(), 'Emanuele', 'Opali', 'OPLMNL88R26W307O', 44, 4000.90, 0, @4, '2014-06-17'),
(NEWID(), 'Roberta', 'Coralli', 'CRLRBT91S27X408P', 29, 2700.50, 1, @4, '2022-02-19'),
(NEWID(), 'Gabriele', 'Gilli', 'GDAGBR86T28Y509Q', 21, 3200.60, 0, @1, '2017-12-31 07:20:00');


SELECT I.nome, I.cognome, I.Et‡, L.Tipo, I.Assunzione
FROM Impiegati as I
INNER JOIN
Impieghi as L ON
I.IDImpiego= L.IDImpiego


--A Visualizzare tutti gli impiegati oltre i 29 anni;
SELECT *
FROM Impiegati
WHERE Et‡>29

--B Visualizzare tutti gli impiegati con un reddito di almeno 800 euro mensili;  
SELECT *
FROM Impiegati
WHERE RedditoMensile>=800

--C Visualizzare tutti gli impiegati che posseggono la detrazione fiscale;  
SELECT *
FROM Impiegati
WHERE DetrazioneFiscale=1

--E Visualizzare tutti gli impiegati che non posseggono la detrazione fiscale;  
SELECT *
FROM Impiegati
WHERE DetrazioneFiscale=0

--F Visualizzare tutti gli impiegati cui il cognome cominci con una lettera G e li visualizzi in ordine alfabetico; 
SELECT *
FROM Impiegati
WHERE cognome LIKE 'G%'
ORDER BY cognome ASC;

--G Visualizzare il numero totale degli impiegati registrati nella base dati;  
SELECT COUNT(*) AS NumeroTotaleImpiegati
FROM Impiegati;

--H Visualizzare il totale dei redditi mensili di tutti gli impiegati;  
SELECT SUM(RedditoMensile) AS TotaleRedditi
FROM Impiegati

--I Visualizzare la media dei redditi mensili di tutti gli impiegati;  
SELECT AVG(RedditoMensile) AS TotaleRedditi
FROM Impiegati

--J Visualizzare líimporto del reddito mensile maggiore;  
SELECT MAX(RedditoMensile) AS RedditoMassimo
FROM Impiegati;

--K Visualizzare líimporto del reddito mensile minore;  
SELECT MIN(RedditoMensile) AS RedditoMassimo
FROM Impiegati;

-- Visualizzare gli impiegati assunti dallí 01/01/2007 allí 01/01/2008;  
SELECT *
FROM Impiegati
WHERE Assunzione BETWEEN '2007-01-01' AND '2008-01-01'

--L Tramite una query parametrica che identifichi il tipo di impiego, visualizzare tutti gli impiegati che corrispondono a quel tipo di impiego; 
SELECT * 
FROM Impiegati
WHERE IDImpiegato = (
SELECT IDImpiego
FROM Impiegati

)

--M Visualizzare líet‡ media dei lavoratori allíinterno dellíazienda.  
SELECT AVG(Et‡) AS Et‡Media
FROM Impiegati



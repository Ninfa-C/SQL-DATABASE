USE Esercizio2

/*1) Selezione di tutti i prodotti (tutti i campi),*/
SELECT * FROM dbo.Products

/*2) Selezione di tutti i prodotti con uno quantità disponibile (UnitsInStock) di almeno 40 pezzi,*/
SELECT * FROM dbo.Products WHERE UnitsInStock >= 40;

/*3) Selezione di tutti i clienti (Employees) che abitano a Londra,*/
SELECT * FROM dbo.Employees WHERE City = 'London';

/*4) Selezione di tutti gli ordini, ordinati in ordine decrescente per spese di trasporto (Freight),*/
SELECT * FROM dbo.Orders ORDER BY Freight DESC;

/*5) Selezione degli ordini il cui importo del trasporto è superiore a 90 e inferiore i 200,*/
SELECT * FROM dbo.Orders WHERE Freight > 90 AND Freight < 200;

/*6) Selezione di tutti i prodotti la cui categoria è "1",*/
SELECT * FROM dbo.Products WHERE CategoryID = 1;

/*7) Selezione di tutte le righe dei dettagli degli ordini che hanno applicato uno sconto,*/
SELECT * FROM dbo.[Order Details] WHERE Discount > 0;

/*8) Selezione di tutti gli ordini del cliente con ID "BOTTM" le cui spese di trasporto superano l'importo di 50.*/
SELECT * FROM dbo.Orders WHERE CustomerID = 'BOTTM' AND Freight > 50;


--ESERCICI 26/02/2025

USE Esercizio2;

-- 1) Numero totale degli ordini
SELECT COUNT(*) AS NumeroTotaleOrdini FROM dbo.Orders;

-- 2) Numero totale di clienti
SELECT COUNT(*) AS NumeroTotaleClienti FROM dbo.Customers;

-- 3) Numero totale di clienti che abitano a Londra
SELECT COUNT(*) AS NumeroClientiLondra FROM dbo.Customers WHERE City = 'London';

-- 4) Media aritmetica del costo del trasporto di tutti gli ordini effettuati
SELECT AVG(Freight) AS MediaCostoTrasporto FROM dbo.Orders;

-- 5) Media aritmetica del costo del trasporto dei soli ordini effettuati dal cliente "BOTTM"
SELECT AVG(Freight) AS MediaTrasportoBOTTM FROM dbo.Orders WHERE CustomerID = 'BOTTM';

-- 6) Totale delle spese di trasporto effettuate raggruppate per id cliente
SELECT CustomerID, SUM(Freight) AS TotaleSpeseTrasporto 
FROM dbo.Orders 
GROUP BY CustomerID;

-- 7) Numero totale di clienti raggruppati per città di appartenenza
SELECT City, COUNT(*) AS NumeroClienti 
FROM dbo.Customers 
GROUP BY City;

-- 8) Totale di UnitPrice * Quantity raggruppato per ogni ordine
SELECT OrderID, SUM(UnitPrice * Quantity) AS TotaleOrdine 
FROM dbo.[Order Details] 
GROUP BY OrderID;

-- 9) Totale di UnitPrice * Quantity solo dell'ordine con id=10248
SELECT SUM(UnitPrice * Quantity) AS TotaleOrdine10248 
FROM dbo.[Order Details] 
WHERE OrderID = 10248;

-- 10) Numero di prodotti censiti per ogni categoria
SELECT CategoryID, COUNT(*) AS NumeroProdotti 
FROM dbo.Products 
GROUP BY CategoryID;

-- 11) Numero totale di ordini raggruppati per paese di spedizione (ShipCountry)
SELECT ShipCountry, COUNT(*) AS NumeroOrdini 
FROM dbo.Orders 
GROUP BY ShipCountry;

-- 12) Media del costo del trasporto raggruppata per paese di spedizione (ShipCountry)
SELECT ShipCountry, AVG(Freight) AS MediaTrasporto 
FROM dbo.Orders 
GROUP BY ShipCountry;

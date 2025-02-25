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
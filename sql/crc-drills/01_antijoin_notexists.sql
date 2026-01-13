/* PROBLEM: Znajdź klientów (Sales.Customer), którzy nigdy nie złożyli zamówienia (Sales.SalesOrderHeader).
CEL: Porównaj dwie techniki - obie muszą zwrócić tę samą liczbę rekordów.
*/

-- WERSJA 1: LEFT JOIN ... WHERE ... IS NULL
-- Napisz tutaj swoje zapytanie:
SELECT 
	  c.[CustomerID]
	 ,s.[SalesOrderID]
FROM [Sales].[Customer] AS c
LEFT JOIN [Sales].[SalesOrderHeader] AS s
ON c.CustomerID = s.CustomerID
WHERE s.[SalesOrderID] IS NULL

-- WERSJA 2: NOT EXISTS
-- Napisz tutaj swoje zapytanie:
SELECT 
	 c.[CustomerID]
FROM [Sales].[Customer] AS c
WHERE NOT EXISTS (
	SELECT 1
	FROM [Sales].[SalesOrderHeader] AS s
	WHERE c.CustomerID = s.CustomerID
)


-- WERSJA DLA CIEBIE: Dopisz ile rekordów wyszło w obu przypadkach (powinno być tyle samo).
-- Wynik:
-- WERSJA 1: wiersze: 701
-- WERSJA 2: wiersze: 701
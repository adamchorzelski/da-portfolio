SELECT
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS TotalSales
FROM Person.Person AS p
JOIN Sales.Customer AS c
    ON p.BusinessEntityID = c.PersonID
JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
GROUP BY
    p.FirstName,
    p.LastName
HAVING SUM(soh.TotalDue) > 10000
ORDER BY
    TotalSales ASC;
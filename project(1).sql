
--Recency
SELECT recency, COUNT(*)								
FROM (SELECT HouseholdId, DATEDIFF(day, MAX(OrderDate) , '2016-01-01') as recency								
      FROM Orders6 o JOIN Customers6 c ON o.CustomerId = c.CustomerId								
      WHERE OrderDate < '2016-01-01'								
      GROUP BY HouseholdId
	  --order by recency desc
	  ) h								
GROUP BY recency								
ORDER BY recency 								

--Frequency
SELECT DATEDIFF(day, mindate, '2016-01-01')/numorders as frequency,							
       COUNT(*)							
FROM (SELECT HouseholdId, MIN(OrderDate) as mindate, COUNT(*) as numorders							
      FROM Orders6 o JOIN Customers6 c ON o.CustomerId = c.CustomerId							
      WHERE OrderDate < '2016-01-01'							
      GROUP BY HouseholdId) h							
GROUP BY DATEDIFF(day, mindate, '2016-01-01')/numorders							
ORDER BY frequency							

--Monetary
SELECT FLOOR(money) as dollars, count(*)						
FROM (SELECT HouseholdId, AVG(TotalPrice) as money						
      FROM Orders6 o JOIN Customers6 c ON o.CustomerId = c.CustomerId						
      WHERE OrderDate < '2016-01-01'						
      GROUP BY HouseholdId) a						
GROUP BY FLOOR(money)						
ORDER BY dollars	



USE SalesDB;

SELECT *
FROM Sales.Orders;

SELECT
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime,
	GETDATE()
FROM Sales.Orders
;

SELECT
	OrderDate,
	YEAR(OrderDate) AS Year,
	MONTH(OrderDate) AS Month,
	DAY(OrderDate) AS Day
FROM Sales.Orders
;

SELECT
	CreationTime,
	DATEPART(year, CreationTime) AS Year,
	DATEPART(month, CreationTime) AS Month,
	DATEPART(week, CreationTime) AS Week,
	DATEPART(hour, CreationTime) AS Hour,
	DATEPART(quarter, CreationTime) AS Quarter,
	DATEPART(dayofyear, CreationTime) AS DayofYear
FROM sales.Orders
;

SELECT
	CreationTime,
	DATENAME(month, CreationTime) AS Month_Name,
	DATENAME(weekday, CreationTime) AS Day_Name
FROM Sales.Orders
;

SELECT
	CreationTime,
	DATETRUNC(minute, CreationTime),
	DATETRUNC(hour, CreationTime),
	DATETRUNC(day, CreationTime),
	DATETRUNC(month, CreationTime),
	DATETRUNC(year, CreationTime)
FROM Sales.Orders
;

SELECT
	CreationTime,
	EOMONTH(CreationTime) AS End_of_the_Month,
	DATETRUNC(month, EOMONTH(CreationTime)) AS Start_of_the_Month
FROM Sales.Orders;

SELECT
	Year(OrderDate) AS Year,
	COUNT(*) AS Order_Num
FROM Sales.Orders
GROUP BY Year(OrderDate)
;

SELECT *
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2
;

SELECT
	CreationTime,
	FORMAT(CreationTime, 'dd') AS DD,
	FORMAT(CreationTime, 'ddd') AS DDD,
	FORMAT(CreationTime, 'dddd') AS DDDD,
	FORMAT(CreationTime, 'MM') AS MM,
	FORMAT(CreationTime, 'MMM') AS MMM,
	FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders
;

SELECT
	CreationTime,
	'Day ' + FORMAT(CreationTime, 'ddd MMM') + ' Q' + DATENAME(quarter, CreationTime) + FORMAT(CreationTime, ' yyyy hh:mm:ss tt') AS Custom_Format
FROM Sales.Orders;

SELECT
	FORMAT(OrderDate, 'MMM yy') AS Month,
	COUNT(*) AS Orders_Num
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');

SELECT
	CreationTime,
	CONVERT(DATE, CreationTime) AS [Date of Creation],
	CONVERT(VARCHAR, CreationTime, 32) AS [In US Format]
FROM Sales.Orders;

SELECT
	CAST('2025-08-20' AS Date) AS [String to Date],
	CAST(CreationTime AS Date) AS [Datetime to Date]
FROM Sales.Orders
;

SELECT
	OrderDate,
	DATEADD(year, 2, OrderDate) AS DateTwoYearsLater,
	DATEADD(month, 3, OrderDate) AS Date_Three_Months_Later,
	DATEADD(day, -10, OrderDate) AS [Date Ten Days Before]
FROM Sales.Orders;

SELECT
	OrderDate,
	Shipdate,
	DATEDIFF(year, OrderDate, ShipDate) AS OrderToShippingTimeInYear,
	DATEDIFF(month, OrderDate, ShipDate)  AS Order_To_Shipping_Time_In_Month,
	DATEDIFF(day, OrderDate, ShipDate) AS [Order to Shipping Time In Days]
FROM Sales.Orders;

SELECT *
FROM Sales.Employees;

SELECT
	BirthDate,
	DATEDIFF(year, BirthDate, GETDATE()) AS AgeInYears
FROM Sales.Employees;

SELECT
	DATENAME(month, ShipDate) AS Month,
	AVG(DATEDIFF(day, OrderDate, ShipDate)) AS Avg_Shipping_Duration_In_Days
FROM Sales.Orders
GROUP BY DATENAME(month, ShipDate)
;

SELECT
	a.OrderID,
	a.OrderDate,
	b.OrderDate AS Previous_Order_Date,
	DATEDIFF(day, b.OrderDate, a.OrderDate) AS Num_Days
FROM Sales.Orders AS a
LEFT JOIN Sales.Orders AS b
ON b.OrderID = a.OrderID - 1
;

SELECT
	OrderID,
	OrderDate,
	LAG(OrderDate, 1) OVER (ORDER BY OrderID) AS Previous_Order_Date,
	DATEDIFF(day, LAG(OrderDate, 1) OVER (ORDER BY OrderID), OrderDate) AS Num_Days
FROM Sales.Orders
;

SELECT
	ISDATE('2025-08-20') AS DateCheck1,
	ISDATE('2025') AS DateCheck2,
	ISDATE('20-08-2025') AS DateCheck3
;
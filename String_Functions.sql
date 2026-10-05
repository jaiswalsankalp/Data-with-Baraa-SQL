--SalesDB
USE SalesDB;

SELECT *
FROM Sales.Customers;

SELECT
	CONCAT(FirstName, ' ', LastName, '-', Country) AS Name_And_Country
FROM Sales.Customers;

SELECT
	FirstName,
	LOWER(FirstName) AS NameInLowercase,
	UPPER(FirstName) AS NameInUppercase
FROM Sales.Customers;

SELECT
	TRIM(CONCAT(' ', FirstName, ' ', LastName, ' '))
FROM Sales.Customers;

--MyDatabase
USE MyDatabase;

SELECT *
FROM customers;

SELECT first_name
FROM customers
WHERE first_name != TRIM(first_name);

SELECT
	'942-438-9858' AS Phone_Num,
	REPLACE('942-438-9858', '-', '') AS Clean_Phone_Num;

SELECT
	first_name,
	len(first_name) AS Name_Length
FROM customers;

SELECT
	first_name,
	LEFT(first_name, 2) AS First_2_Characters,
	RIGHT(first_name, 2) AS Last_2_Characters
FROM customers;

SELECT
	first_name,
	SUBSTRING(TRIM(first_name), 2, LEN(TRIM(first_name))-1) AS sub_name
--SUBSTRING(TRIM(first_name), 2) AS sub_name will also work
FROM customers;

-- Reverse a String
SELECT
	first_name,
	REVERSE(first_name) AS Reverse_String
FROM customers;
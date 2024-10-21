SELECT *
FROM [Production].[Product]


SELECT Name,
Color,
Standardcost,
Standardcost*10/100
FROM [Production].[Product]

SELECT Name,
Color,
Standardcost,
Standardcost*10/100 AS Tenpercentofcost
FROM [Production].[Product]
ORDER BY StandardCost,Color

--Day 2

SELECT TOP 10 Name, Standardcost
FROM [Production].[Product]
ORDER BY Standardcost DESC

SELECT DISTINCT Color
FROM [Production].[Product]

SELECT TOP 10 PERCENT *
FROM [Production].[Product]
WHERE Color = 'Black'

SELECT *
FROM [Production].[Product]
WHERE Standardcost BETWEEN 500 AND 1000
ORDER BY Standardcost


SELECT *
FROM [Production].[Product]
WHERE Color IN ('Blue', 'Black', 'Red')

SELECT *
FROM [Production].[Product]
WHERE Color LIKE 'BL%'

SELECT *
FROM [Production].[Product]
WHERE ProductNumber LIKE 'Ca%'

SELECT *
FROM [Production].[Product]
WHERE ProductNumber LIKE '%61'

SELECT *
FROM [Production].[Product]
WHERE ProductNumber LIKE '%91%'

SELECT *
FROM [Production].[Product]
WHERE ProductNumber LIKE '%91-_'


--_returns a single character
--% returns any number of characters after or before
-- AND, OR, NOT

SELECT *
FROM [Production].[Product]
WHERE Color = 'Black' AND Standardcost > 1000


SELECT *
FROM [Production].[Product]
WHERE Color = 'Black' OR Standardcost > 1000

SELECT *
FROM [Production].[Product]
WHERE NOT Color = 'Black' AND Standardcost > 1000

SELECT *
FROM [Production].[Product]
WHERE Color <> 'Black' AND Standardcost > 1000

SELECT *
FROM [Production].[Product]
WHERE Color = 'Black' AND NOT Standardcost > 1000


SELECT *
FROM [Production].[Product]
WHERE Color IS NOT NULL AND Size IS NULL

SELECT *
FROM [Production].[Product]
WHERE Color IS NOT NULL

SELECT Color, ISNULL(Color, 'No Color')
FROM [Production].[Product]

SELECT Color, ISNULL(Color, 'No Color') AS NewColorGrops
FROM [Production].[Product]

SELECT Color, Size, COALESCE (Color, Size) AS Combined
FROM [Production].[Product]

SELECT Color,
		SUM(Standardcost) AS TotalCost,
		SUM(ListPrice) AS TotalPrice,
		AVG(Standardcost) AS AVERAGE
FROM [Production].[Product]
GROUP BY Color

SELECT Color,
		SUM(Standardcost) AS TotalCost,
		SUM(ListPrice) AS TotalPrice,
		AVG(Standardcost) AS AVERAGE
FROM [Production].[Product]
GROUP BY Color
HAVING SUM(Standardcost) >300

--DAY 3 LECTURE
SELECT *
FROM [Production].[ProductCategory] --4 ROWS

SELECT *
FROM [Production].[ProductSubcategory] --37 ROWS

SELECT *
FROM [Production].[Product] --504

SELECT Product.ProductSubcategoryID AS IDfromproducttable,
		Product. Name AS Productname,
		subcat.ProductsubcategoryID AS IDfromsubcattable,
		subcat.Name AS Subcategory

FROM [Production].[Product] AS Product
INNER JOIN [Production].[ProductSubcategory] AS Subcat
ON Product.ProductSubcategoryID = Subcat.ProductSubcategoryID

SELECT Product.ProductSubcategoryID AS IDfromproducttable,
		Product. Name AS Productname,
		subcat.ProductsubcategoryID AS IDfromsubcattable,
		subcat.Name AS Subcategory

FROM [Production].[Product] AS Product
LEFT JOIN [Production].[ProductSubcategory] AS Subcat
ON Product.ProductSubcategoryID = Subcat.ProductSubcategoryID

SELECT Product.ProductSubcategoryID AS IDfromproducttable,
		Product. Name AS Productname,
		subcat.ProductsubcategoryID AS IDfromsubcattable,
		subcat.Name AS Subcategory

FROM [Production].[Product] AS Product
RIGHT JOIN [Production].[ProductSubcategory] AS Subcat
ON Product.ProductSubcategoryID = Subcat.ProductSubcategoryID

SELECT Product.ProductSubcategoryID AS IDfromproducttable,
		Product. Name AS Productname,
		subcat.ProductsubcategoryID AS IDfromsubcattable,
		subcat.Name AS Subcategory

FROM [Production].[Product] AS Product
FULL JOIN [Production].[ProductSubcategory] AS Subcat
ON Product.ProductSubcategoryID = Subcat.ProductSubcategoryID

SELECT Product.ProductSubcategoryID AS IDfromproducttable,
		Product. Name AS Productname,
		subcat.ProductsubcategoryID AS IDfromsubcattable,
		subcat.Name AS Subcategory,
		Category.Name

FROM [Production].[Product] AS Product
LEFT JOIN [Production].[ProductSubcategory] AS Subcat
ON Product.ProductSubcategoryID = Subcat.ProductSubcategoryID
LEFT JOIN [Production].[ProductSubcategory] AS Category
ON Subcat.ProductCategoryID = Category.ProductCategoryID

SELECT Color,
	
		CASE
			WHEN Color = 'black' THEN 'Dark'
			WHEN Color = 'Silver' THEN 'light'
		END AS newcolor

FROM [Production].[Product]

SELECT StandardCost,
			CASE
			WHEN StandardCost > 1000 THEN 'expenive'
			WHEN StandardCost < 1000 THEN 'Cheap'
			ELSE 'Not Interested'
		END AS newcost

FROM [Production].[Product]

SELECT StandardCost,
			CASE
			WHEN StandardCost > 352.1394 THEN 'expenive'
			WHEN StandardCost < 352.1394 THEN 'Cheap'
			ELSE 'Not Interested'
		END AS newcost

FROM [Production].[Product]

--DAY 4

CREATE VIEW  BlackandWhiteProducts AS
SELECT name,
		Color,
		StandardCost,
		ListPrice
FROM [Production].[Product]
WHERE Color IN ('Black', 'White')

SELECT *
FROM [dbo].[BlackandWhiteProducts]

CREATE DATABASE Cloudstore

USE Cloudstore --or just change the data base from the drop down
CREATE TABLE CourseList(
		CourseID int primary key,
		Courses varchar(50)
)

CREATE TABLE StaudentNames(
		StudentID int primary key,
		Names varchar(50),
		Gender varchar(10),
		CourseID int foreign key references CourseList(CourseID)
)

--IF i Forgot to add a column to the students name table

/*CREATE TABLE Country(
		CountryID int primary key,
		CountryName varchar(20)

)*/

ALTER TABLE [dbo].[StaudentNames]
ADD Country varchar(20)

SELECT * FROM [dbo].[StaudentNames]

--TO DELETE A Table

DROP TABLE [dbo].[StaudentNames]

INSERT INTO [dbo].[CourseList]
VALUES
(1, 'Excel'),
(2, 'PowerBI'),
(3, 'SQL')

SELECT * FROM [dbo].[StaudentNames]

INSERT INTO [dbo].[StaudentNames]
VALUES
(1, 'Ola','Male', 1,'South Africa'),
(2, 'Chukwudi','Male', 3, 'Nigeria'),
(3, 'Uche', 'Female', 2, 'Nigeria'),
(4, 'Helen','Female', 2,'Nigeria')

SELECT * FROM [dbo].[StaudentNames]

UPDATE [dbo].[StaudentNames]
SET Gender ='male'

UPDATE [dbo].[StaudentNames]
SET Gender ='male'
WHERE names IN ('Uche''Helen')


SELECT * FROM [dbo].[StaudentNames]

DELETE FROM [dbo].[StaudentNames]
WHERE StudentID =4
-- Day 5

SELECT Maritalstatus,
		COUNT(BusinessEntityID) AS Numberofemployees
FROM [HumanResources].[Employee]
GROUP BY Maritalstatus
ORDER BY Maritalstatus DESC


SELECT Gender,
		COUNT(BusinessEntityID) AS Numberofemployees
FROM [HumanResources].[Employee]
GROUP BY Gender
ORDER BY Gender DESC

SELECT Birthdate,
		DATEDIFF(year, birthdate, '2024-03-29') AS Age
FROM [HumanResources].[Employee]

SELECT Jobtitle,
		SUM(Vacationhours)
FROM [HumanResources].[Employee]
GROUP BY Jobtitle

SELECT Jobtitle,
		SUM(Vacationhours) AS Vacationhours
FROM [HumanResources].[Employee]
GROUP BY Jobtitle
HAVING SUM(Vacationhours) >100

SELECT Persondetails.Firstname,
		Persondetails.Lastname,
		Employee.Gender,
		Employee.Jobtitle

FROM [HumanResources].[Employee] AS Employee
INNER JOIN [Person].[Person] AS Persondetails
ON Employee.BusinessEntityID = Persondetails.BusinessEntityID

SELECT Persondetails.Firstname,
		Persondetails.Lastname,
		CONCAT(Firstname, ' ', Lastname) AS fullname,
		Employee.Gender,
		Employee.Jobtitle

FROM [HumanResources].[Employee] AS Employee
INNER JOIN [Person].[Person] AS Persondetails
ON Employee.BusinessEntityID = Persondetails.BusinessEntityID

SELECT Persondetails.Firstname,
		Persondetails.Lastname,
		CONCAT(persondetails.Firstname, ' ', persondetails.Lastname) AS fullname,
		Employee.Gender,
		Employee.Jobtitle

FROM [HumanResources].[Employee] AS Employee
INNER JOIN [Person].[Person] AS Persondetails
ON Employee.BusinessEntityID = Persondetails.BusinessEntity
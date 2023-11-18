--Full Data 

SELECT *
FROM Sales


-- Distinct Values In Our Data

SELECT DISTINCT Age_Group
FROM Sales

SELECT DISTINCT Customer_Gender
FROM Sales
ORDER BY Customer_Gender

SELECT DISTINCT Country
FROM Sales
ORDER BY Country

SELECT DISTINCT Country, State
FROM Sales
ORDER BY Country, State

SELECT DISTINCT Product_Category
FROM Sales
ORDER BY Product_Category

SELECT DISTINCT Product_Category, Sub_Category
FROM Sales
ORDER BY Product_Category, Sub_Category


-- DEMOGRAPHIC INFORMATION

-- Total Number of Customers

SELECT COUNT(*) AS TotalCustomers, ROUND(AVG(CAST(Customer_Age AS float)), 1) AS AvgAge
FROM Sales


-- Customer Numbers Information Per Country

SELECT Country, COUNT(*) AS TotalCustomers, ROUND(CAST(COUNT(Country) * 100.0 / SUM(COUNT(Country)) OVER () AS decimal), 2) AS PercentageOfTotal, ROUND(AVG(CAST(Customer_Age AS float)), 1) AS AvgAge
FROM Sales
GROUP BY Country
ORDER BY PercentageOfTotal DESC



-- Customers Overall Gender Information

SELECT Customer_Gender, COUNT (Customer_Gender) AS NumberOfCustomers, ROUND(CAST(COUNT(Customer_Gender) * 100.0 / SUM(COUNT(Customer_Gender)) OVER () AS decimal), 2) AS PercentageOfTotal, ROUND(AVG(CAST(Customer_Age AS float)), 1) AS AvgAge
FROM Sales
GROUP BY Customer_Gender
ORDER BY NumberOfCustomers DESC


-- Gender Distribution of Customers By Country

SELECT
    Country,
    COUNT(CASE WHEN Customer_Gender = 'Male' THEN 1 END) AS Count_Male,
    COUNT(CASE WHEN Customer_Gender = 'Female' THEN 1 END) AS Count_Female,
    ROUND(CAST(COUNT(CASE WHEN Customer_Gender = 'Male' THEN 1 END) * 100.0 / COUNT(*) AS decimal), 2) AS Percentage_Male,
    ROUND(CAST(COUNT(CASE WHEN Customer_Gender = 'Female' THEN 1 END) * 100.0 / COUNT(*) AS decimal), 2) AS Percentage_Female,
	ROUND(AVG(CASE WHEN Customer_Gender = 'Male' THEN CAST(Customer_Age AS float) END), 1) AS AverageAge_Male,
    ROUND(AVG(CASE WHEN Customer_Gender = 'Female' THEN CAST(Customer_Age AS float) END), 1) AS AverageAge_Female
FROM Sales
GROUP BY Country
ORDER BY Country;


-- Breakdown of Age Groups

SELECT Age_Group, COUNT(Age_Group) AS TotalNumbers, ROUND(CAST(COUNT(Age_Group) * 100.0 / SUM(COUNT(Age_Group)) OVER () AS decimal), 2) AS PercentageOfTotal
FROM Sales
GROUP BY Age_Group
ORDER BY TotalNumbers DESC


-- PRODUCT INFORMATION

-- Product Category Information

-- Product Data

SELECT Country, Product_Category, Sub_Category, Product
FROM Sales


-- Category percentage distribution overall

SELECT Product_Category, ROUND(CAST(COUNT(Product_Category) * 100.0 / SUM(COUNT(Product_Category)) OVER () AS decimal), 2) AS PercentageOfTotal
FROM Sales
GROUP BY Product_Category
ORDER BY PercentageOfTotal DESC


-- Category information per country

SELECT
    Country,
    ROUND(CAST(COUNT(CASE WHEN Product_Category = 'Accessories' THEN 1 END) * 100.0 / COUNT(*) AS decimal), 2) AS Percentage_Accessories,
    ROUND(CAST(COUNT(CASE WHEN Product_Category = 'Bikes' THEN 1 END) * 100.0 / COUNT(*) AS decimal), 2) AS Percentage_Bikes,
	ROUND(CAST(COUNT(CASE WHEN Product_Category = 'Clothing' THEN 1 END) * 100.0 / COUNT(*) AS decimal), 2) AS Percentage_Clothing

FROM Sales
GROUP BY Country
ORDER BY Country


-- SALES NUMBERS

SELECT SUM(Revenue) AS TotalRevenue, SUM(Cost) AS TotalCost, SUM(Profit) AS TotalProfit
FROM Sales

--Breakdown By Country

SELECT Country, SUM (Profit) AS TotalProfit, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Country
ORDER BY TotalProfit DESC

SELECT Country, SUM (Revenue) AS TotalRevenue, ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Country
ORDER BY TotalRevenue DESC

SELECT Country, SUM (Cost) AS TotalCost, ROUND(SUM(Cost) * 100.0 / SUM(SUM(Cost)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Country
ORDER BY TotalCost DESC

--Breakdown By Year

SELECT Year, SUM (Profit) AS TotalProfit, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Year
ORDER BY TotalProfit DESC

SELECT Year, SUM (Revenue) AS TotalRevenue, ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Year
ORDER BY TotalRevenue DESC

SELECT Year, SUM (Cost) AS TotalCost, ROUND(SUM(Cost) * 100.0 / SUM(SUM(Cost)) OVER () , 0) AS PercentageOfTotal
FROM Sales
GROUP BY Year
ORDER BY TotalCost DESC


-- Numbers Per Category

SELECT Product_Category, SUM (Profit) AS TotalProfit, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfProfits, ROUND(CAST(COUNT(Product_Category) * 100.0 / SUM(COUNT(Product_Category)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Product_Category
ORDER BY TotalProfit DESC

SELECT Product_Category, SUM (Revenue) AS TotalRevenue, ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER () , 0) AS PercentageOfRevenue, ROUND(CAST(COUNT(Product_Category) * 100.0 / SUM(COUNT(Product_Category)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Product_Category
ORDER BY TotalRevenue DESC

SELECT Product_Category, SUM (Cost) AS TotalCost, ROUND(SUM(Cost) * 100.0 / SUM(SUM(Cost)) OVER () , 0) AS PercentageOfCosts, ROUND(CAST(COUNT(Product_Category) * 100.0 / SUM(COUNT(Product_Category)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Product_Category
ORDER BY TotalCost DESC


--Numbers Per Country

SELECT Country, SUM (Profit) AS TotalProfit, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfProfits, ROUND(CAST(COUNT(Country) * 100.0 / SUM(COUNT(Country)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Country
ORDER BY TotalProfit DESC


SELECT Country, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfProfits, ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER () , 0) AS PercentageOfRevenue, ROUND(SUM(Cost) * 100.0 / SUM(SUM(Cost)) OVER () , 0) AS PercentageOfCosts,  ROUND(CAST(COUNT(Country) * 100.0 / SUM(COUNT(Country)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Country
ORDER BY Country DESC


--Numbers Per Year

SELECT Year, SUM (Profit) AS TotalProfit, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfProfits
FROM Sales
GROUP BY Year
ORDER BY TotalProfit DESC


SELECT Year, ROUND(SUM(Profit) * 100.0 / SUM(SUM(Profit)) OVER () , 0) AS PercentageOfProfits, ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER () , 0) AS PercentageOfRevenue, ROUND(SUM(Cost) * 100.0 / SUM(SUM(Cost)) OVER () , 0) AS PercentageOfCosts,  ROUND(CAST(COUNT(Country) * 100.0 / SUM(COUNT(Country)) OVER () AS decimal), 2) AS PercentageOfSales
FROM Sales
GROUP BY Year
ORDER BY PercentageOfProfits DESC


-- Most Profitable Product in Each Country #CTE

WITH RankedProducts AS (
  SELECT Country,Product, SUM(Profit) AS Profit,
		ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Profit) DESC) AS Rank
  FROM Sales
  GROUP BY Country, Product
)

SELECT Country, Product AS MostProfitable, Profit AS ProfitMade
FROM RankedProducts
WHERE Rank = 1
ORDER BY ProfitMade DESC


--BREAKDOWN BY COUNTRY
--(UNITED STATES)

SELECT *
FROM Sales
WHERE Country = 'United States'


-- Most Profitable Product in Each Age Group

WITH RankedProducts AS (
  SELECT Age_Group,Product, SUM(Profit) AS Profit,
		ROW_NUMBER() OVER (PARTITION BY Age_Group ORDER BY SUM(Profit) DESC) AS Rank
  FROM Sales
  GROUP BY Age_Group, Product
)

SELECT Age_Group, Product AS MostProfitable, Profit AS ProfitMade
FROM RankedProducts
WHERE Rank = 1
ORDER BY ProfitMade DESC







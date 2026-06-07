SHOW TABLES;
SELECT * FROM sales;
SELECT COUNT(*) FROM sales;



## Removing decimal
SELECT TRUNCATE(SalesAmount, 0) AS Sales FROM sales;

## Total sales by city
SELECT City, ROUND(SUM(SalesAmount), 0) AS TotalSales
FROM sales
GROUP BY City;

## Top 5 highest sales orders
SELECT CustomerName, SalesAmount
FROM sales
ORDER BY SalesAmount DESC
LIMIT 5;

## Average sales by category
SELECT Category, ROUND(AVG(SalesAmount), 0) AS AverageSales
FROM sales
GROUP BY Category;

##Monthly sales trend
SELECT  Month(OrderDate), ROUND(SUM(SalesAmount), 0) AS MonthlySales
FROM sales
GROUP BY  Month(OrderDate)
ORDER BY Month(OrderDate) ASC;

## Customers with more than 5 orders
SELECT Customername,Category,  COUNT(Quantity) AS Orders
FROM sales
GROUP BY CustomerName, Category
HAVING COUNT(Quantity) > 5
ORDER BY CustomerName ASC;

## Total Orders by Each Customer
SELECT CustomerName, COUNT(*) Orders
FROM sales
GROUP BY CustomerName;

## Highest selling category
SELECT Category, ROUND(SUM(SalesAmount), 0) AS TotalSales
FROM sales
GROUP BY Category
ORDER BY SUM(SalesAmount) DESC;


SELECT AVG(SalesAmount) from sales;

## Orders above average sales
SELECT * FROM sales
WHERE SalesAmount >(SELECT AVG(SalesAmount) FROM sales);

## Rank cities by sales
SELECT City , ROUND(SUM(SalesAmount), 0) AS TotalSales,
RANK()OVER(ORDER BY SUM(SalesAmount) DESC) AS RankWiseSales
FROM sales
GROUP BY City;

## Top customer by revenue
SELECT CustomerName, ROUND(Sum(SalesAmount), 0) AS Revenue
FROM sales
GROUP BY CustomerName
ORDER BY Revenue DESC
LIMIT 5;

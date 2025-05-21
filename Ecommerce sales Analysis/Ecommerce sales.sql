create database ecommerce_sales;
use ecommerce_sales;
select* from orders;
select* from details;

---- 1) Total Sales

select sum(amount) as Total_sales
from details;

---- 2) Total Profit

select sum(profit) as Total_profit
from details;

---- 3) Total Quantity

select sum(Quantity) as Total_quantity
from details;

---- 4) Totals Sales by Category

select category,sum(amount) as Total_sales
from details
group by category;

---- 5) Top 5 customer names by total sales

SELECT o.CustomerName,SUM(d.Amount) AS TotalSales
FROM Details d
JOIN Orders o
ON d.`Order ID` = o.`Order ID`
GROUP BY o.CustomerName
ORDER BY TotalSales DESC
LIMIT 5;

---- 6) Total sales by paymentmode

select paymentmode,sum(amount) as total_sales
from details
group by paymentmode;

---- 7) Total sales by sub_category

SELECT `Sub-Category`,SUM(Amount) AS TotalSales
FROM Details
GROUP BY `Sub-Category`
ORDER BY TotalSales DESC;

----- 8) Top 5 State by total sales

SELECT 
    o.State,
    SUM(d.Amount) AS TotalSales
FROM 
    Details d
JOIN 
    Orders o
ON 
    d.`Order ID` = o.`Order ID`
GROUP BY 
    o.State
ORDER BY 
    TotalSales DESC
LIMIT 5;

----- 8) Top 5 cities by total sales and profit

SELECT 
    o.City,
    SUM(d.Amount) AS TotalSales,
    SUM(d.Profit) AS TotalProfit
FROM 
    Details d
JOIN 
    Orders o
ON 
    d.`Order ID` = o.`Order ID`
GROUP BY 
    o.City
ORDER BY 
    TotalSales DESC
LIMIT 5;

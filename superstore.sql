USE b0d01dcc;

#1. What percentage of total orders were shipped on the same date?
SELECT 
COUNT(*) * 100.0 *0  / (SELECT COUNT(*) FROM superstore),1) AS Same_Day_Shipping_Percentage
FROM superstore 
WHERE Ship_Date = Order_Date

#2. Name top 3 customers with highest total value of orders.
SELECT 
Customer_Name , 
SUM(Sales) AS TotalOrderValue
FROM superstore 
GROUP BY Customer_Name
ORDER BY TotalOrderValue DESC
 LIMIT 3;

#3. Find the top 5 items with the highest average sales per day.
SELECT 
Product_ID ,  
AVG(Sales) AS Average_Sales
FROM superstore 
GROUP BY Product_ID
ORDER BY Average_Sales DESC
 LIMIT 5;

#4. Write a query to find the average order value for each customer, and rank the customers by their average order value.
SELECT 
Customer_Name,  
AVG(Sales) , RANK() OVER(ORDER BY AVG(Sales) )  
FROM superstore 
GROUP BY Customer_Name;

#5. What is the most demanded sub-category in the west region?
SELECT Sub_Category , SUM(Sales) AS total_quantity
FROM superstore
WHERE Region = 'West'
GROUP BY Sub_Category
ORDER BY total_quantity DESC
LIMIT 1;

#6. Which order has the highest number of items?
SELECT Order_ID , COUNT(*) AS highest
FROM superstore
GROUP BY Order_ID 
ORDER BY highest DESC
LIMIT 1;

#7. Which order has the highest cumulative value?
SELECT Order_ID , SUM(Sales) AS highest
FROM superstore
GROUP BY Order_ID 
ORDER BY highest DESC
LIMIT 1;

#8. Which city is least contributing to total revenue?
SELECT City , SUM(Sales) AS TotalSales
FROM superstore
GROUP BY City 
ORDER BY TotalSales
LIMIT 1;

#9. What is the average time for orders to get shipped after order is placed?
SELECT 
CAST(AVG(DATEDIFF(Ship_Date, Order_Date))AS DECIMAL(18,8)) AS avg_ship_time
FROM superstore;






















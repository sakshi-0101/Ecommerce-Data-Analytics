show databases;
use ecommerce;
show tables;
select * from data;
#SALE ANALYSIS
#Total sales per category.
CREATE VIEW total_sale_per_category AS
select Category,sum(Price) 
from orders
group by Category;
SELECT * FROM  total_sale_per_category;

#Total sales per month/year.
CREATE VIEW total_sale_per_month_year AS
select Year(Order_Date)as year,
Month(Order_Date) as month,
sum(Price) 
from orders
group by year,month
order by year,month;
SELECT * FROM  total_sale_per_month_year;

#average order value
CREATE VIEW AO_V AS 
SELECT sum(Price)/sum(Quantity) 
from orders;
select * from AO_V;

#Customer Analysis
CREATE VIEW no_of_orders as
SELECT  CUSTOMER_NAME,COUNT(Order_ID)
FROM orders
group by CUSTOMER_NAME;

select * from no_of_orders ;

#top 10 customers by total purchase
CREATE VIEW top_10_custo as
SELECT CUSTOMER_NAME,sum(Price)
FROM orders 
group by CUSTOMER_NAME 
order by sum(price)
desc LIMIT 10;
select * from top_10_custo;

#most sold products
SELECT Product ,COUNT(Order_ID) as total_sales
from orders 
group by Product
order by total_sales DESC
LIMIT 5;

#Products with highest revenue
SELECT Product,SUM(Quantity *Price) as total_revenue
from orders
group by Product
order by total_revenue
desc limit 5;

#no of orders deleivered,cancelled,returned
SELECT Order_Status,count(Order_ID)
from orders where Order_Status IN ("delivered","cancelled","returned")
group by Order_Status;




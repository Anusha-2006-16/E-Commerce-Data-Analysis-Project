create database retail_sales;
use retail_sales;

select * from retail_sales_dataset_analysis;

rename table retail_sales_dataset_analysis to sales;

select * from sales;

-- 1. Total Revenue
select sum(sales) as total_revenue
from sales; 

-- 2. Top 5 Customers

select Customer_Name,Sales
from sales
order by sales desc limit 5;
 
 
-- 3. Monthly Sales Trend-- 

select Month,sum(sales)
from sales
group by Month;

-- 4. Most Profitable Category --
select Product_Category, sum(Sales)
from sales
group by Product_Category
order by sum(sales) desc limit 1;

-- 5. Find customers who ordered more than 5 times. --

select Customer_ID  ,Customer_Name
from sales
group by Customer_ID,Customer_Name
having  count(Customer_ID) > 5;


rename table sales to retail_sales;
select * from retail_sales;
-- 6. Find states where:

-- sales are high
-- but profit margin is low

SELECT state,sales,profit_margin from retail_sales
WHERE sales = (select max(sales) from retail_sales)
and profit_margin = (select min(profit_margin) from retail_sales);

-- 7.which category has highest return rate

select product_category,count(Returned)
from retail_sales 
where Returned = 'Yes'
group by product_category,Returned
order by count(Returned) desc limit 1;


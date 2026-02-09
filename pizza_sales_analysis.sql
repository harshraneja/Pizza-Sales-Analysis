create table pizza_sales(
pizza_id int, order_id int,	pizza_name_id varchar(15), quantity int, order_date Date,
order_time Time, unit_price float, total_price float, pizza_size varchar(5), 
pizza_category varchar(15),	pizza_ingredients varchar(200),	
pizza_name varchar(50)

);

select * from pizza_sales



-- Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales


 -- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales


-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


-- Average Pizzas Per Order

SELECT 
    ROUND(SUM(quantity)::numeric / COUNT(DISTINCT order_id), 2) AS avg_pizzas_per_order
FROM pizza_sales;

-- Daily Trend for Total Orders

SELECT 
    TO_CHAR(order_date, 'Day') AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day_name

--Monthly Trend for Orders

SELECT 
    TO_CHAR(order_date, 'Month') AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY day_name


-- %of Sales by Pizza Category

SELECT
    pizza_category,
    SUM(total_price) AS sales,
    ROUND(
        (SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER ())::numeric,
        2
    ) AS percent_sales
FROM pizza_sales
GROUP BY pizza_category;



-- % of Sales by Pizza Size


SELECT
    pizza_size,
    SUM(total_price) AS Sales,
    ROUND(
        (SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER ())::numeric,
        2
    ) AS percent_sales
FROM pizza_sales
GROUP BY pizza_size;


-- Total Pizzas Sold by Pizza Category

select pizza_category,
sum(quantity) as Sales_by_cat
from pizza_sales
group by pizza_category



--- Top 5 Pizzas by Revenue

select pizza_name,sum(total_price) as total_Revenue
from pizza_sales
group by pizza_name
order by total_Revenue desc 


-- Bottom 5 Pizzas by Revenue

select pizza_name,sum(total_price) as total_Revenue
from pizza_sales
group by pizza_name
order by total_Revenue asc 

-- Top 5 Pizzas by Quantity

select pizza_name,sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by  Total_Pizza_Sold DESC


--Bottom 5 Pizzas by Quantity

select pizza_name,sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by  Total_Pizza_Sold ASC 


--- Top 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id ) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc


--- Borrom 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id ) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders ASC











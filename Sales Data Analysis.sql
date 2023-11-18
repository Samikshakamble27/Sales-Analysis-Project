use sales;
select * from customers;

-- 1)customer types in E commers Brick & Mortar
SELECT Count(*) as TotalCustomerTypes FROM customers
where customer_type = "Brick & Mortar";


-- 2)customer types in E commers
SELECT Count(*) as TotalCustomerTypes FROM customers
where customer_type = "E-Commerce";


-- 5)only two currencies are USD other INR = we need to replace USD currency to INR
select count(currency) as USD_Currencies from transactions
where currency = "USD";

select count(currency) as INR_Currencies from transactions
where currency = "INR";

-- 6)fetching the sales quantity of each year
SELECT d.Year, SUM(t.sales_qty) AS TotalQuantity
FROM Date d JOIN Transactions t ON d.date = t.order_date
GROUP BY d.Year;

-- 7)Total Revenue By year
SELECT d.Year, SUM(t.sales_amount) AS TotalRevenue
FROM Date d JOIN Transactions t ON d.date = t.order_date
GROUP BY d.Year;

-- 8) Total Sales Amount by markets
select markets_name, sum(transactions.sales_amount) as Total_sales_By_Markets
from transactions inner join sales.markets 
on transactions.market_code = markets.markets_code
group by markets_name;


-- 8)Total Sales Quantity by zone
select zone, sum(transactions.sales_qty) as quantity_By_Zone
from transactions inner join markets
on transactions.market_code = markets.markets_code
group by zone;

-- 9) Total Revenue
select sum(sales_amount*Sales_qty) as Revenue
from transactions;

-- 10) Total Qyantity sold
select sum(Sales_qty) as Quantity_Sold
from transactions;

-- 11) Top 10 customers by High quantity purchase
select custmer_name as Customer_Names, sum(sales_qty) as Total_Quantity
from transactions inner join customers
on transactions.customer_code = customers.customer_code
group by custmer_name
order by Total_quantity DESC
limit 10;

-- 12) Years into the Table
select distinct(year)
from sales.date;





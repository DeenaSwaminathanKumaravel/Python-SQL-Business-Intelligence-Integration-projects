use datacore_pro;

select
	*
from
	sales_data sd ;
-- 1. Retrieve all records where the product sold is 'Laptop'.

select
	*
from
	sales_data
where
	ProductName = "Laptop";

-- 2: Select sales records that occurred between January 15, 2023, and February 15, 2023.

select
	*
from
	sales_data sd
where
	SaleDate between '2023-01-15' and '2023-02-15';

-- 3: Find all sales over $1000 in the 'North' region.

select
	*
from
	sales_data sd
where
	Region = "North"
	and SaleAmount > 1000;

-- 4: Get records where the quantity sold is less than 3, excluding sales in the 'East' region.

select
	*
from
	sales_data sd
where
	Region != "East"
	and Quantity < 3;

-- 5: Find records of sales where the product is either 'Laptop' or 'Tablet' and the sale amount is greater than $500

select
	*
from
	sales_data sd
where
	(ProductName = "Laptop"
		or ProductName = "Tablet")
	and SaleAmount > 500;

-- 6: Select sales that are not for 'Headphones' or 'Smartwatch' and occurred outside the 'South' region.

select
	*
from
	sales_data sd
where
	Region != 'South'
	and (ProductName != 'Headphones'
		and ProductName != 'Smartwatch');
	
-- 7: Find sales made to customers whose names start with 'J' and contain the letter 'e'.

select
	*
from
	sales_data sd
where
	CustomerName like 'J%e%';


-- 8: Retrieve records where the quantity sold is between 2 and 4 inclusive, made by Sales Representatives with IDs 101, 102, or 103.

select
	*
from
	sales_data sd
where
	Quantity between 2 and 4
	and SalesRepID in (101, 102, 103);

-- 9: Find products whose total sales amount exceeds $10,000.
select
	ProductName,
	sum(SaleAmount) Total_sales
from
	sales_data sd
group by
	ProductName
having
	Total_sales > 10000;

/* 
10: Determine the average sale amount for 'Laptop' and 'Tablet' in each region, including only regions with an average above $800, 
treating NULL regions as 'Unspecified'.
*/
select
	ProductName,
	coalesce(Region, 'Unspecified') Region,
	avg(SaleAmount) Avg_sales
from
	sales_data sd
where
	ProductName = 'Laptop'
	or ProductName = 'Tablet'
group by
	ProductName,
	Region
having
	Avg_sales > 800;

-- 11: Identify sales representatives who have sold a total quantity of more than 50 units across all products

select
	coalesce(SalesrepID, "Unspecified"),
	sum(Quantity) as Total_Sales
from
	sales_data sd
group by
	SalesRepID
having
	Total_sales > 50;

-- 12: For each region, find the highest sale amount, considering only sales above $500.

select
	Region,
	max(SaleAmount) Sale_Amount
from
	sales_data sd
where
	SaleAmount > 500
group by
	Region;

-- 13: Identify the top 5 best-selling products by total quantity sold.
select
	ProductName,
	sum(Quantity) Total_Qty
from
	sales_data sd
group by
	ProductName
order by
	Total_Qty desc
limit 5;


-- 14: Retrieve the details of the 10 most recent sales where the sale amount was greater than $1000, ordered by the sale date.

select
	*
from
	sales_data sd
where
	SaleAmount > 1000
order by
	SaleDate desc
limit 10;

-- 15: Create a single string combining product and customer names, with the product name in upper case and the customer name in lower case.

select
	ProductName,
	CustomerName,
	concat(ucase(productName), "-", lcase(CustomerName))
from
	sales_data sd; 

-- 16: Find records where the first character of the ProductName is the same as the last character of the CustomerName.

select
	ProductName
from
	sales_data sd
where
	substring(ProductName, 1, 1) = substring(ProductName, char_length(ProductName) , 1);


-- 17: Display customer names with spaces replaced by dashes, and order by these modified names.

select
	CustomerName,
	replace(CustomerName, " ", "_") Modified_name
from
	sales_data sd
order by
	Modified_name;

-- 18: Select records where the length of the ProductName is greater than the length of the CustomerName.

select
	ProductName, SaleID 
from
	sales_data sd
where
	char_length(ProductName) > char_length(CustomerName);

-- 19: For any NULL values in the Region column, replace them with 'Unknown'.

update
	sales_data
set
	Region = 'Unknown'
where
	Region is null;

-- 20: Find all sales records where the SalesRepID is NULL.

select
	*
from
	sales_data sd
where
	SalesRepID is null;

-- 21: Update the SalesRepID to '999' for all records where the SalesRepID is NULL
update
	sales_data
set
	SalesRepID = '999'
where
	SalesRepID is null;


-- 22: Add a new column named DiscountPercent to the sales_data table. And make the DiscountPercent column to have a default value of '5.00'.

alter table sales_data 
add column DiscountPercent VARCHAR(255) default '5.00';


-- 23: Rename the CustomerName column to ClientName.

alter table sales_data 
change column CustomerName ClientName varchar(255);




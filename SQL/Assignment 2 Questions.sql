--  Q.1 Calculate the duration of each campaign in days.

select * from campaigns c ;

select
	CampaignName,
	concat(timestampdiff(day, StartDate, EndDate), " Days") Duration_in_days
from
	campaigns c;
	
-- Q.2 List all customers and the campaigns they participated in.

select
	c1.Name,
	c2.CampaignName
from
	customers c1
join campaigns c2 on
	c1.CustomerID = c2.CampaignID;

-- Q.3 Categorize sales into tiers: > 500 High, 250 - 500 Medium, < 250 Low

select
	*,
	case
		when SaleAmount <= 250 then "Low"
		when SaleAmount > 250
		and SaleAmount <= 500 then "Medium"
		when SaleAmount > 500 then "High"
	end as Tiers
from
	sales s;

-- Q.4 Use Common Table Expressions (CTEs) to list the first and last sale date for each customer.

with final as
(
select
	c1.Name,
	s1.SaleDate
from
	customers c1
join sales s1 on
	c1.CustomerID = s1.CustomerID
)
select
	*,
	first_value(f.SaleDate) over (partition by Name) as First_sale,
	last_value (f.SaleDate) over (partition by Name rows between unbounded preceding and unbounded following) as last_sale
from
	final f;

-- Q.5 Rank customers based on their total sales

	select
		c1.Name,
		sum(s1.SaleAmount) as Total_salaes,
		rank() over (order by sum(s1.SaleAmount) desc) as Actual_rank
	from
		customers c1
	join sales s1 on
		c1.CustomerID = s1.CustomerID
	group by
		c1.Name;
		
-- Q.6 Find Customers Who Signed Up in the Last Two Years.

select
	Name,
	SignUpDate ,
	datediff(Curdate(), SignUpDate) / 365
from
	customers c
where
	datediff(Curdate(), SignUpDate)/ 365 <= 2 ;


-- Q.7 Calculate the number of days remaining from the current date until each campaign ends.

select
	CampaignName,
	concat(datediff(curdate(), EndDate) , " Days") as Duration
from
	campaigns c ;

-- Q.8 Identify the day in the week with maximum sales


select
	SaleDate,
	max(SaleAmount) as sale,
	weekday(SaleDate) as dateinweek
from
	sales s
group by
	SaleDate
order by
	sale desc
limit 1;

-- Q.9 List campaigns that lasted more than 30 days.

select
	*
from
	campaigns c
where
	(datediff(EndDate, StartDate)) >= 30;
	

-- Q.10 Extend all campaigns ending this month by an additional week.

select
	*,
	if(month(EndDate) = month(curdate()),
	date_add(EndDate, interval 1 week) ,
	EndDate) New_Enddate
from
	campaigns c ;

-- Q.11 Average number of days between the customer's sign-up date and their first purchase


select
	avg(datediff(SaleDate, SignUpDate)) as Average_days
from
	(
	select
		c.Name,
		c.Email,
		s.SaleDate,
		c.SignUpDate,
		row_number() over (partition by c.Name
	order by
		s.SaleDate) as Row_num
	from
		customers c
	join sales s on
		c.CustomerID = s.CustomerID
) as rankedsales
where
	Row_num = 1;

-- Q.12 Check if there were any campaigns running in June 2023.

select
	*
from
	campaigns c
where
	month(StartDate) = 6
	and year(StartDate) = 2023;

--  (OR)

select
	*
from
	campaigns c
where
	DATE_FORMAT(StartDate, '%Y-%m') = '2023-06';


/*
 * Q.13 Categorize customers into 'New', 'Established', and 'Veteran' based on their sign-up year.

New = Year in which you take the assignment

Established = two to four years  

Veteran = Before 4 years
 */

select
	*,
	case
		when (datediff(curdate(), SignUpDate)/ 365) <= 2 then 'New'
		when (datediff(curdate(), SignUpDate)/ 365) > 2
		and (datediff(curdate(), SignUpDate)/ 365) <= 4 then 'Established'
		else "Veteran"
	end as Category
from
	customers c;	

/*
 * 
Q.14 Adjust campaign budgets by increasing or decreasing based on their duration. 

- Days <= 15 then decrease by 10%, Days between 16 and 30 No change, Above 30 days increase by 10%
 */

select
	*,
	 case
		when datediff(EndDate, StartDate) <= 15 then 
	 	budget - (budget * 10 / 100)
		when datediff(EndDate, StartDate) > 15
		and datediff(EndDate, StartDate) <= 30 then 
	 	budget
		when datediff(EndDate, StartDate) > 30 then 
	 	budget + (budget * 10 / 100)
	end as new_budget
from
	campaigns c ;



/*
 * Q.15 Classify each customer into a loyalty tier ('Bronze', 'Silver', 'Gold') based on the number of purchases they've made.

- Bronze = 1 purchase, Silver = 2 to 3 purchase and Gold > 3 purchases
 */

select
	*, 
	case
		when t.Total_purchases = 1 then 'Bronze'
		when t.Total_purchases >1
		and t.Total_purchases <= 3 then 'Silver'
		when t.Total_purchases > 3 then 'Gold'
	end 
 as Tier
from
	(
	select
		c.Name,
		count(*) Total_purchases
	from
		customers c
	join sales s on
		c.CustomerID = s.CustomerID
	group by
		c.Name
) as t

-- Q.16 Find the campaign with the highest number of sales.

select
	c.CampaignName,
	sum(s.SaleAmount) as TotalSales
from
	campaigns c
join sales s on
	c.CampaignID = s.CampaignID
group by
	c.CampaignName
order by
	TotalSales desc
limit 1;

-- Q.17 Calculate the average sale amount for each campaign.


select
	c.CampaignName,
	round(avg(s.SaleAmount), 0)  as AvgSales
from
	campaigns c
join sales s on
	c.CampaignID = s.CampaignID
group by
	c.CampaignName
order by
	AvgSales desc;



-- Q.18 Use CTE to Rank Campaigns by Total Sales.

with TotalSales as
(
select
	c.CampaignName,
	sum(s.SaleAmount) as t_sales
from
	campaigns c
join sales s on
	c.CampaignID = s.CampaignID
group by
	c.CampaignName
order by
	t_sales desc
)
select
	*,
	dense_rank () over (
	order by t_sales desc) as n_rank
from
	TotalSales;

-- Q.19 Use a CTE to calculate both the duration and total sales of each campaign.


with TotalSales as
(
select
	c.CampaignName,
	sum(datediff(c.EndDate, c.StartDate)) Duration,
	sum(s.SaleAmount) as t_sales
from
	campaigns c
join sales s on
	s.CampaignID = c.CampaignID
group by
	c.CampaignName
order by
	t_sales desc
)
select
	*
from
	TotalSales;

-- Q.20 Calculate a running total of sales over time.

select
	*, 
	(sum(SaleAmount) over (
	order by SaleDate)) as RunningTotal
from
	sales s
order by SaleDate ;

-- Q.21 Calculate each customer's total sales as a percentage of the overall total sales.


select
c.Name,
	concat(round(sum(s.SaleAmount) / 
	(
	select
		sum(s.SaleAmount) as TotalSales
	from
		customers c
	join sales s on
		c.CustomerID = s.CustomerID
	order by
		TotalSales desc) * 100, 0), '%')  
	as TotalSalespercentage
from
	customers c
join sales s on	
	c.CustomerID = s.CustomerID
group by
	c.Name;

-- Q.22 Calculate the month-over-month growth rate in sales.

select
	*,
	concat(coalesce(round(((TotalSales - lag(TotalSales) over (order by Date)) / lag(TotalSales) over (order by Date)) * 100, 1), 0), '%') as MoM
from
	(
	select
		date(date_format(SaleDate, '%Y-%m-01')) as Date,
		sum(SaleAmount) as TotalSales
	from
		sales s
	group by
		date(date_format(SaleDate, '%Y-%m-01'))
	order by
		Date
) as Total_Sales;


-- Q.23 Find the number of days until the next purchase for each customer.


with s1 as
(
select
	*
from
	(
	select
		c.Name,
		s.SaleDate,
		row_number() over (partition by c.Name order by s.SaleDate) as row_num
	from
		customers c
	join sales s on
		c.CustomerID = s.CustomerID
) as firstsl
where
	row_num = 1
),
s2 as 
(
select
	*
from
	(
	select
		c.Name,
		s.SaleDate,
		row_number() over (partition by c.Name order by s.SaleDate) as row_num
	from
		customers c
	join sales s on
		c.CustomerID = s.CustomerID
) as firstsl
where
	row_num = 2
)
select
	s1.Name,
	s1.SaleDate FirstSale,
	s2.SaleDate SecondSale,
	datediff(s2.SaleDate ,s1.SaleDate) as Daysuntillnextpurchase
from
	s1
join s2 on
	s1.Name = s2.Name;


-- Q.24 Calculate the 7-Day Moving Average of Sales.

select
	*,
	avg(SaleAmount) over (
order by
	SaleDate rows between 6 preceding and current row)
from
	sales s ;


/*
 * Q.25 Write a stored procedure to provide a summary of campaigns including the number of participants, total sales, and average sale amount.

* HINT: Use function FIND_IN_SET() to filter multiple campaign IDs
 */










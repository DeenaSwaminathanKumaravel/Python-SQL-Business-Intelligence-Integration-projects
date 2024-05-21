
-- STORED PROCEDURES AND TRIGGERS

delimiter //

create procedure sp_campaigns()
begin
	select
	c.CampaignName ,
	count(*) no_of_participants,
	sum(SaleAmount) Total_sales,
	round(avg(SaleAmount), 2) Avg_sale
	from
		campaigns c
	join sales s on
		c.CampaignID = s.CampaignID
	group by
		c.CampaignName
	order by
		Total_sales desc;
end
//
delimiter ;

call sp_campaigns(); 


select * from campaigns c ;


-- Triggers
/*
 * Creating a trigger to create a audit trail after the rows are deleted and after rows are inserted.
 */

select * from employee e ;


create table emp_audit(
	EmployeeID INT primary key,
	Email VARCHAR(255)
);	

alter table emp_audit add column(
	Deleteddate Datetime
)

select * from emp_audit ea; 

-- creating a trigger for after delete

delimiter //
create trigger afterdelete
after delete on employee
for each row 

begin 
	insert into emp_audit (EmployeeID, Email, Deleteddate)
	values(old.EmployeeID, old.Email, now());
end
//
Delimiter ;


delete from employee where EmployeeID = 25;

select * from emp_audit ea;

delete from employee where EmployeeID = 30;

-- Trigger for new insert

Delimiter //

create trigger afterinsert after
insert
	on
	employee for each row begin 
	insert
	into
	emp_audit(EmployeeID,
	Email,
	DeletedDate)
values (new.EmployeeID,
new.Email,
now());
end;
Delimiter ;

insert into employee (EmployeeID, FirstName, LastName, Email)
values(100, 'guy', 'Might', 'thisisatestforinserttrigger@gmail.com');

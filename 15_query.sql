# Before Update Trigger

# create a table names as EmployeeDetail.
Create table EmployeeDetail (
id INT auto_increment primary key,
employee_number int not null,
last_name varchar(50) not null,
change_date datetime default null,
action varchar(50) default null
);

# Create another table and insert some rows into that table.
drop table if exists employee;
Create table employee (
id int auto_increment primary key,
employee_number int,
last_name varchar(50),
change_data datetime
);

insert into employee values(1,101,"singh", "2020-02-28");

select*from employee;
select*from employeedetail;

# Let’s create a trigger using the before update operation on employee table. 
drop trigger if exists before_on_employee_update;
Create trigger before_on_employee_update
before update on employee
for each row
insert into EmployeeDetail
Set action = 'update',
employee_number = old.employee_number,
last_name = old.last_name,
change_date = Now();

# let’s use the trigger and update the row values of employee,
Update employee
set 
last_name = "Kumar"
where 
employee_number = 101 and id = 1;

select * from employee;
select * from employeedetail;

# To delete the TRIGGER we use the DROP TRIGGER statement.
DROP TRIGGER before_on_employee_update;
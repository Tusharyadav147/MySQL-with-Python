use qafox;

select*from employee;

update employee 
set Name = 'Kiran' 
where id = 2;

update employee
set Experiance = 3;

show tables;

rename table employee to emp;
rename table emp to employee;

describe employee;

alter table employee
add location varchar(10);

alter table employee
modify column location int;

alter table employee 
modify column location varchar(50);

alter table employee
rename column location to loc;

alter table employee
drop column loc;


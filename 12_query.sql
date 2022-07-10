use world;
show tables;

select*from city;

Select * from city where name in (select name from city where CountryCode like 'N%');

select*from city where ID < any (select id from city where District like 'k%');

-- any work as 4 or 5 or 9
-- all work as 4 and 5 and 9

use sakila;

select*from city;
select*from country;

-- use single subquery in a single sql statement
select city, (select country from country where city.country_id= country.country_id) as Country from city;
select country from country;

-- use multiple sub query in a single statement
select * from film;

select max(length) from film;
select min(rental_duration) from film;

select title, length, rental_duration from film 
where length < (select max(length) from film) 
and rental_duration = (select min(rental_duration) from film);

-- integrity constraints
-- 1 not null
create table employees(id int not null, name varchar(10), experience int);
insert into employees values(1, "Tushar", 12);
insert into employees value(2, "Himanshu", 42);
insert into employees value("Tarun", 23);
insert into employees(id,name) value(1, "Tarun");

drop table employees;

-- 2 unique
create table employees(id int, name varchar(10), experience int, unique(id, name));
insert into employees values(1, "Tushar", 12);
insert into employees value(2, "Himanshu", 42);
insert into employees value(2,"Tarun", 23);

drop table employees;

-- 3 primary key = not null + unique
create table emp1(id int primary key, name varchar(15), experience int);
create table emp1(id int, name varchar(15), experience int , primary key(id));
insert into emp1 value(1,"Tushar", 23);
insert into emp1 value(1,"Tarun", 22);

drop table emp1;

-- 4 foreign key 

-- parent table
create table employee (id int, name varchar(15), experience int, primary key(id));
insert into employee value(1, "Tushar", 23);
insert into employee value(2, "Tarun", 22);


-- child table 
create table salary(id int, sal int, foreign key(id) references employee(id));
insert into salary value(1, 2432);
insert into salary value(2, 324567);

delete from salary where id = 2;
delete from employee where id = 2;

select a.id, a.name, b.sal from employee a
inner join salary b where a.id=b.id;

-- check intefrity constant
create table emp1(id int, name varchar(15), experience int check( experience > 5));

insert into emp1 value(1, "Tushar", 6);
insert into emp1 value(2, "Tushar", 4);

drop table emp1;

-- default integrity constant
create table emp1(id int, name varchar(15), experience int default(10000));
insert into emp1(id, name) value(1,"Tushar");

select*from emp1;

drop table emp1;

-- auto-increment
create table emp1(id int auto_increment, name varchar(15), primary key(id));
insert into emp1 value(3, "Tushar");
insert into emp1(name) value("Tushar");

select * from emp1;
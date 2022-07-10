show databases;
create database Testdb;
drop database Testdb;

create database qafox;

use sakila;
Select * from actor;
show tables;

use qafox;
create table employee(id int, Name varchar(15), Experiance int);
describe employee;
select*from employee;

create table emp as 
select id, name from employee;
drop table emp;

use world;
create table place as 
select ID, Name, District from city;
select * from place;
select * from place order by Name desc;

use qafox;
show tables;
select*from employee;

describe employee;
insert into employee values(2, "Tushar", 0); 
insert into employee values(2,"Tushar", 0);
insert into employee(id, Name) values(2,"Tushar");


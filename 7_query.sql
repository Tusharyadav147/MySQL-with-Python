use world;
select*from country;

select count(Name) from country; 
select count(Name), continent from country group by continent;

use sakila;
select * from payment;
select amount from payment;
select sum(amount) from payment;
select customer_id ,sum(amount) from payment group by customer_id;

use world;

select*from country;
select*from country where Continent= 'Asia';
select continent, count(name) from country group by continent having count(name) < 15;

select Region, Continent, count(name) from country
where surfacearea> 100 
group by region
having count(name) < 10;
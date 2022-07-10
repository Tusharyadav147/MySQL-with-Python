-- Sub query

use world;
show tables;

select*from country;

select*from country where continent = (select Continent from country where name = "Aruba");


-- in operator , whithout in operator, we can only give one value in the where clause condition
select* from country where Continent in ("North America", "Asia", "Africa", "Europe");

select* from country where Continent not in ("North America", "Asia", "Africa", "Europe");

select*from country where name in (select name from country where continent = "South America");
#fetch data from two tables simultaneously
-- union operator

use qafox;

create table tone(id int);
insert into tone value(1);
insert into tone value(3);
insert into tone value(5);

Select*from tone;

create table ttwo(num int);
insert into ttwo value (2);
insert into ttwo value (4);
insert into ttwo value (3);

select*from ttwo;

select*from tone 
union 
select *from ttwo;

select*from tone 
union all 
select*from ttwo;

drop table tone;
drop table ttwo;

create table empone(id int, name varchar(15));
insert into empone values(1, "Tushar");
insert into empone values(2, "Tarun");
insert into empone values(3, "Neelansh");

select*from empone;

create table emptwo(cone int, ctwo varchar(15));
insert into emptwo values(5, "anil");
insert into emptwo values(4, "gdf");
insert into emptwo values(3, "dgfh");
update emptwo
set ctwo = "Neelansh"
where cone= 3;

create table empthree(cone int, ctwo varchar(15), cthree int);
insert into empthree values(2, "Tushar", 23);
insert into empthree value(3, "Neelansh", 32);
insert into empthree value(5,'hejw', 34);

select cone, ctwo from emptwo
union
select cone, ctwo from empthree;

select*from empone
union
select*from emptwo;

select id, name from empone
union
select cone, ctwo from emptwo;

Select id, name from empone
union all
select cone, ctwo from emptwo;

-- RDBMS is not supports intersect & minus operator it will be supported by oracle

select o.id, o.name, t.ctwo from empone o, emptwo t;
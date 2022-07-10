-- AS to create a new table with the records of an existing table

use world;

select*from place;

create table newplace 
as select * from place;

select * from newplace;

-- IfNull 
use qafox;

drop table empone;
create table empone(id int, salary int);
insert into empone values(1, 34567);
insert into empone values(2,365);
insert into empone(id) value(2);

select (ifnull(salary,0) +1000) from empone;

-- case, end, when

use world;
select*from place;

select Name, District, 
case 
	when ID < 100 then "This price  is less than 100"
    when ID = 100 then "This price is 100"
    when ID > 100 then "This price is more then 100"
end as ID
from place;

-- index
use qafox;

select*from empdetails;

create index firstnameindex
on empdetails(firstname);

show indexes from empdetails;


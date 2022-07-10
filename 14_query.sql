-- view

use qafox;
create table emp11(id int, name varchar(15), experience int);
insert into emp11 value(1, "Tushar", 23);
insert into emp11 value(2, "Tarun", 34);
insert into emp11 value(3, "Neelansh", 65);
insert into emp11 value(4, "Aadi", 66);

select* from emp11;

create view emp11view
as 
select id, name from emp11;

create view emp11viewb
as
select id, name experience
from emp11 
where experience >35;

select*from emp11viewb;

create table emp22(id int, country varchar(16));
insert into emp22 value(1, "India");
insert into emp22 value(2, "London");
insert into emp22 value(3, "UK");

create view emp22view1
as 
select a.id, a.name, b.country from emp11 a, emp22 b 
where a.id = b.id;

select*from emp22view1;
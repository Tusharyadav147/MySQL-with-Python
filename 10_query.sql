-- how to use joins inner, left, right, full, self join

use qafox;

select * from empdetailsone;
select * from empdetailstwo;

-- common records retrive
select *
from empdetailsone
inner join empdetailstwo
on empdetailsone.id = empdetailstwo.id;

 
select *
from empdetailsone 
left join empdetailstwo
on empdetailsone.id = empdetailstwo.id;

select *
from empdetailsone 
right join empdetailstwo
on empdetailsone.id = empdetailstwo.id;

-- full join is not supported in mysql
select *
from empdetailsone 
full join empdetailstwo
on empdetailsone.id = empdetailstwo.id;

-- self join work on same table not in different table

create table empdetails( id int, firstname varchar(15), lastname varchar(15), depid int);
insert into empdetails values(1, "Tushar", "Sonp", 1);
insert into empdetails value(2, "Tarun", "Choudhary", 9);
insert into empdetails value(3, "Himanshu", "Jain", 3);

select*from empdetails;

select*
from empdetails a, empdetails b
where a.id = b.depid;
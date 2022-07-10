use qafox;

create table empdetailsone(id int, firstname varchar(15));
insert into empdetailsone values(1, "Tushar");
insert into empdetailsone values(2, "Himanshu");
insert into empdetailsone values(3, "tarun");

select*from empdetailsone;

create table empdetailstwo(id int, lastname varchar(15));
insert into empdetailstwo values(1, "Sonp");
insert into empdetailstwo value(2, "Jain");
insert into empdetailstwo value(4, "Choudhary");

select*from empdetailstwo;

select a.id, a.firstname, b.lastname
from empdetailsone a, empdetailstwo b
where a.id = b.id;
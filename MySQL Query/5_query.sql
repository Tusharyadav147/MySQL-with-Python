use qafox;

select*from employee;

insert into employee values(3, "Tushar", 24);

set autocommit = 0;   #default it will be 1 or True

insert into employee values(4,"Tarun", 23);

commit;
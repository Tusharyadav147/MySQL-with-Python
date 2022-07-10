use qafox;

create table xyz(a int);
show tables;
select*from xyz;

insert into xyz values(1);
insert into xyz values(1.5);
insert into xyz values(1.4);
drop table xyz;

create table xyz(a double);
select*from xyz;

insert into xyz values(9);
insert into xyz values(1.5);
drop table xyz;

create table xzy(a boolean);
select*from xzy;

insert into xzy values(9);
insert into xzy values(true);
insert into xzy values(false);
drop table xzy;

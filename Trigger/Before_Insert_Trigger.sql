# before insert trigger

create table totalamount(
id int auto_increment primary key,
name varchar(100) not null,
amount int not null
);

Select * From Totalamount;

create table totalamountstatus(
totalamount int not null
);

select * from totalamountstatus

Delimiter $$
create Trigger before_totalamount_insert
before insert
on totalamount for each row
begin
	declare rowcount int;
    select count(*)
    into rowcount
    from totalamountstatus;
    
    if rowcount > 0 then 
		update totalamountstatus
        set totalamount = totalamount + new.amount;
	else
		insert into totalamountstatus(totalamount)
        values(new.amount);
	end if;
end $$
Delimiter ;

# Let’s test the trigger by inserting the value in it.
insert into totalamount(name, amount) value("singh", 1000);

select * from totalamount;
select * from totalamountstatus;


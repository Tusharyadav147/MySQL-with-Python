# After insert Trigger

# Create a table named as members.
Create table members(
id int auto_increment,
name varchar(100) not null,
email_id varchar(255),
birth_date date,
primary key(id)
);

# Create another table as remembers.
create table reminders(
id int auto_increment,
member_id int,
message varchar(255) not null,
primary key (id, member_id)
);

# create a after insert trigger as after_members_insert 

delimiter $$
create trigger after_member_insert
after insert 
on members for each row
begin
	if new.birth_date is null then
		insert into reminders(member_id, message)
        values(new.id, concat("hello ",New.name, ", Update your date_of_birth."));
	End if;
end$$

delimiter ;

# Let's test the alter insert trigger.
insert into members(name, email_id, birth_date)
values
	("hemant", "hemant@gmail.com", Null),
    ("Vikash", "vikash@gmail.com", "2000-01-01");

Select * from members;
select * from reminders;
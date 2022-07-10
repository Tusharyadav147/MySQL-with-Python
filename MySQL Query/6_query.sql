#roll back to revert the temporary changes done on a particular table

use qafox;
show tables;

set autocommit = 0;

select*from employee;

delete from employee;
rollback;

#truncate table employee; #even after autocommit is set to 0 it will permanent the changes


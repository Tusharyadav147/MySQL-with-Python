# Second Highest Salary

DROP TABLE IF EXISTS Employee;
Create table If Not Exists Employee (Id int, Salary int);
Truncate table Employee;
insert into Employee (Id, Salary) values ('1', '100');
-- insert into Employee (Id, Salary) values ('2', '100');
insert into Employee (Id, Salary) values ('2', '200');
insert into Employee (Id, Salary) values ('3', '300');

Select * From Employee;

# One Solution:-
Select Salary From Employee order by Salary Desc limit 1 offset 1;

# Another Solution:-
# DENSE_RANK() the Salary at first
WITH CTE AS
    (
    SELECT
        Salary,
        DENSE_RANK() OVER(ORDER BY Salary DESC) AS Salary_Rank # Descening
    FROM
        Employee
    )
SELECT MAX(Salary) AS SecondHighestSalary # Use MAX() to generate NULL if no record
FROM CTE
WHERE Salary_Rank = 2;


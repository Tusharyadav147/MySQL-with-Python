# Department Highest Salary

DROP TABLE IF Exists Employee;
DROP TABLE IF Exists Department;
Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');

Select * from Employee;
Select * from Department;

WITH CTE AS
  (
  SELECT
    d.Name AS Department,
    e.Name AS Employee,
    e.Salary,
        DENSE_RANK() OVER(PARTITION BY d.Name ORDER BY e.Salary DESC) AS Salary_Rank
  FROM Employee e
  INNER JOIN Department d ON e.DepartmentId = d.Id
    )
SELECT Department, Employee, Salary
FROM CTE
WHERE Salary_Rank = 1;
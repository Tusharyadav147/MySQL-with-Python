#Nth Highest 
Delimiter $$ 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN
    (
    WITH CTE AS
    (
        SELECT
      Salary,
            DENSE_RANK() OVER(ORDER BY Salary DESC) AS Salary_Rank
    FROM Employee
        )
	SELECT MAX(Salary)
    FROM CTE
    WHERE Salary_Rank = N
);
END  $$
Delimiter ;
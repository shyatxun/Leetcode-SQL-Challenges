# https://leetcode.com/problems/second-highest-salary/description/

# option 1 451ms
select case when count(distinct salary) < 2 then null else (select distinct salary from employee order by salary desc limit 1 offset 1) end as SecondHighestSalary from employee

# option 2 384ms
select max(distinct salary) as SecondHighestSalary from Employee
where salary < (select max(salary) from Employee)

# https://leetcode.com/problems/department-top-three-salaries/description/

select d.name as department, e.name as employee, e.salary as salary from 
(select name, salary, departmentid, dense_rank() over(partition by departmentid order by salary desc) as rk from employee) e
left join department d on e.departmentid = d.id
where rk <= 3

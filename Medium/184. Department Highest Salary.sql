# https://leetcode.com/problems/department-highest-salary/description/

# option 1 1972ms
select d.name as Department, e.name as Employee, e.salary as Salary from employee e
left join department d on e.departmentid = d.id
where e.salary = (select max(salary) from employee where departmentid = e.departmentid)

# option 2 1384ms
select d.name as Department, e.name as Employee, e.salary as Salary from (select *, dense_rank() over(partition by departmentid order by salary desc) as rk from employee) e
left join department d on e.departmentid = d.id
where e.rk = 1

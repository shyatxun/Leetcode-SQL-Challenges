# https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

select e1.name as name from employee e1
inner join employee e2 on e1.id = e2.managerid
group by e2.managerid
having count(*) > 4

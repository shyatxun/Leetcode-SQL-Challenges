# https://leetcode.com/problems/nth-highest-salary/description/

create function getNthHighestSalary(N int) returns int
begin
set n = n-1;
    return (
        select distinct salary from employee order by salary desc limit 1 offset n
);
end

# https://leetcode.com/problems/exchange-seats/description/

# 678ms
select case when id = (select max(id) from seat) and id%2 =1 then id when id%2 = 1 then id+1 else id-1 end as id, student from seat
order by id

# option 2 670ms
select row_number() over(order by if(id%2 = 0, id-1, id+1)) as id, student from seat

# option 3 579ms
select row_number() over(order by if(mod(id,2) = 0, id-1, id+1)) as id, student from seat

# option 4 558ms
select row_number() over() as id, student from seat
order by if(mod(id,2) = 0, id-1, id+1)

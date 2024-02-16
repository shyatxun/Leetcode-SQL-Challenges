# https://leetcode.com/problems/consecutive-numbers/description/

# option 1 1008ms
select distinct l1.num as ConsecutiveNums from logs l1, logs l2, logs l3
where l1.num = l2.num and l2.num = l3.num and l2.id = l1.id + 1 and l3.id = l2.id + 1

# option 2 777ms
select distinct l1.num as ConsecutiveNums from logs l1
inner join logs l2 on l1.num = l2.num and l2.id = l1.id + 1
inner join logs l3 on l2.num = l3.num and l3.id = l2.id + 1

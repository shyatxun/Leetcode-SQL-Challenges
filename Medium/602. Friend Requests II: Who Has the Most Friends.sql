# https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/

# option 1 606ms
select id, count(*) as num from (select requester_id as id from requestaccepted union all select accepter_id as id from requestaccepted) as a
group by id
order by count(*) desc
limit 1

# option 2 569ms including multiple max values
select id, count(*) as num from (select requester_id as id from requestaccepted union all select accepter_id as id from requestaccepted) as a
group by id
having count(*) = (select count(*) from (select requester_id as id from requestaccepted union all select accepter_id as id from requestaccepted) as a group by id order by count(*) desc limit 1)

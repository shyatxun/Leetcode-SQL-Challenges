# https://leetcode.com/problems/trips-and-users/description/

select request_at as Day, round(avg(if(status = 'completed', 0, 1)), 2) as "Cancellation Rate" from trips
where request_at between "2013-10-01" and "2013-10-03" and client_id in (select users_id from users where banned = 'No') and driver_id in (select users_id from users where banned = 'No')
group by request_at

# https://leetcode.com/problems/market-analysis-i/description/

# option 1 2537ms
select u.user_id as buyer_id, u.join_date, (select count(order_id) from orders where date_format(order_date, '%Y') = 2019 and buyer_id = u.user_id) as orders_in_2019 from users u

# option 2 2209ms
select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019 from users u
left join orders o on u.user_id = o.buyer_id and date_format(o.order_date, '%Y') = 2019
group by u.user_id

# option 3 2148ms
select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019 from users u
left join orders o on u.user_id = o.buyer_id and o.order_date LIKE '2019%'
group by u.user_id

# option 4 1882ms why
select u.user_id as buyer_id, u.join_date, IFNULL(COUNT(ORDER_DATE), 0) as orders_in_2019 from users u
left join orders o on u.user_id = o.buyer_id and o.order_date LIKE '2019%'
group by u.user_id

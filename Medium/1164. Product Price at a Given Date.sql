# https://leetcode.com/problems/product-price-at-a-given-date/description/

# option 1 778ms
select product_id, new_price as price from products
where (product_id, change_date) in (select product_id, max(change_date) from products where change_date <= '2019-08-16' group by product_id)
union
select distinct product_id, 10 as price from products
where product_id not in (select distinct product_id from products where change_date <= '2019-08-16')

# https://leetcode.com/problems/customers-who-bought-all-products/description/

# option 1 1069ms
select customer_id from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product)

# option 2 1038ms
select customer_id from customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from product)

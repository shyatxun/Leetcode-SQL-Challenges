# https://leetcode.com/problems/product-sales-analysis-iii/

# option 1 1867ms
select product_id, first_year, quantity, price from (select product_id, year as first_year, quantity, price, rank() over(partition by product_id order by year) as rk from sales) rnk
where rk = 1

# option 2 1465ms
select product_id, year as first_year, quantity, price from sales
where (product_id, year) in (select product_id, min(year) from sales group by product_id)

# https://leetcode.com/problems/rank-scores/description/

select score, dense_rank() over(order by score desc) as 'rank' from scores

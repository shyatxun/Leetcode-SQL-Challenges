# https://leetcode.com/problems/tree-node/description/

select id, case when p_id is null then 'Root' when id in (select distinct p_id from tree) then 'Inner' else 'Leaf' end as type from tree
# *** null in pid, when a value is compared to a null value, neither 'True' or 'False' is returned, but rather 'Unknown' is returned -> dont use (id not in (select distinct p_id from tree) then 'Leaf')

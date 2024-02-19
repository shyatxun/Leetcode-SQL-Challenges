# https://leetcode.com/problems/investments-in-2016/description/

# option 1 2002ms
select round(sum(i1.tiv_2016), 2) as tiv_2016 from insurance i1
where i1.tiv_2015 in (select distinct tiv_2015 from insurance where pid <> i1.pid) and (i1.lat, i1.lon) not in (select lat, lon from insurance where pid <> i1.pid)

# option 2 849ms w/o distinct
select round(sum(i1.tiv_2016), 2) as tiv_2016 from insurance i1
where i1.tiv_2015 in (select tiv_2015 from insurance where pid <> i1.pid) and (i1.lat, i1.lon) not in (select lat, lon from insurance where pid <> i1.pid)

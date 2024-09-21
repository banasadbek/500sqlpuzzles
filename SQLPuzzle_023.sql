use sql500puzzles
go

select * from Test2DistinctCount

--solution1
with cte as(
select a,
	b,
	concat(a,b) as dis
from Test2DistinctCount
), rn as(
select a,
	b,
	dis,
	row_number() over(partition by dis order by(select null)) as rn
from cte
)
select a, b 
from rn
where rn = 1

--solution1 from site
SELECT DISTINCT a,b FROM Test2DistinctCount 
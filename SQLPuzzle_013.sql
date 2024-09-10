use sql500puzzles
go
--Create table
 
CREATE TABLE [dbo].[testGoldRateChange]
(
[dt] [datetime] NULL,
[Rate] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[testGoldRateChange](dt,Rate)
VALUES
('2014-09-18 06:25:19.897', 27000),
('2014-09-19 06:25:19.897', 27000),
('2014-09-20 06:25:19.897', 31000),
('2014-09-21 06:25:19.897', 31000),
('2014-09-22 06:25:19.897', 31000),
('2014-09-23 06:25:19.897', 32000),
('2014-09-24 06:25:19.897', 31000),
('2014-09-25 06:25:19.897', 32000),
('2014-09-26 06:25:19.897', 27000)
 
--Check data
SELECT dt,Rate FROM [dbo].[testGoldRateChange]

--solution1
with gold_rate_test_cte as(
select dt,
	rate,
	case when lag(rate) over(order by(select null)) = rate then 0
		else 1 end as rn
from testGoldRateChange
),
groups_cte as(
	select dt,
		rate,
		sum(rn) over(order by dt) as grp
	from gold_rate_test_cte
)
select min(dt) as starting_date,
	max(dt) as end_date,
	rate
from groups_cte
group by grp, rate
order by starting_date

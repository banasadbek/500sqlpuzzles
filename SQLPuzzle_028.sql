use sql500puzzles
go
--CREATE TABLE
CREATE TABLE DeleteDup
(
ID INT
)
Go
 
--Insert Data
INSERT INTO DeleteDup VALUES(1),(2),(1)
 
--Verify Data
SELECT ID FROM DeleteDup


--solution1

with cte as(
select id,
	row_number() over(partition by id order by id) as rn
from DeleteDup
)
delete from cte
where rn>1
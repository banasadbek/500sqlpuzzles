CREATE TABLE List
(
ID INT
)
GO
 
INSERT INTO List(ID) VALUES (1),(2),(3),(4),(5)

--solution1
select id,
	sum(id) over(order by id) as SumPreValues
from list

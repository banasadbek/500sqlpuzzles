use sql500puzzles
go

--Create a table called PQ..
 
CREATE TABLE PQ
(
ID INT
,Name VARCHAR(10)
,Typed VARCHAR(10)
)
 
--Insert data
INSERT INTO PQ(ID,Name,Typed) VALUES  (1,'P',NULL) , (1,NULL,'Q')
 
--Verify data
SELECT * FROM  PQ

--solution1
select a.id, a.name, b.typed 
from pq a
inner join pq b
on a.id = b.id
where a.name is not null and b.typed is not null

--solution1 from site
select a.id, 
	a.name, 
	(select b.typed from pq b where a.id = b.id and b.typed is not null) typed 
from pq a 
where a.name is not null



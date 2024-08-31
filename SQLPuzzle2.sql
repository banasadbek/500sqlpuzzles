use sql500puzzles
go

--Create table

CREATE TABLE lag
(
 BusinessEntityID INT
,SalesYear   INT
,CurrentQuota DECIMAL(20,4)
)
 
GO
 
--Insert Data
INSERT INTO lag
SELECT 275 , 2005 , '367000.00'
UNION ALL
SELECT 275 , 2005 , '556000.00'
UNION ALL
SELECT 275 , 2006 , '502000.00'
UNION ALL
SELECT 275 , 2006 , '550000.00'
UNION ALL
SELECT 275 , 2006 , '1429000.00'
UNION ALL
SELECT 275 , 2006 ,   '1324000.00'
 
--Check data
SELECT BusinessEntityID,SalesYear,CurrentQuota FROM lag

--solution 1
select *, 
lead(currentquota, 1, 0) over(order by (select null)) as NextCurrentData
from lag
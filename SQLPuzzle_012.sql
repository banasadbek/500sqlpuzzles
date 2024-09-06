--Create table
CREATE TABLE GroupbyMultipleColumns
(
ID INT
,Typ VARCHAR(1)
,Value1 VARCHAR(1)
,Value2 VARCHAR(1)
,Value3 VARCHAR(1)
)
GO

--Insert Data
INSERT INTO GroupbyMultipleColumns(ID,Typ,Value1,Value2,Value3)
VALUES
(1,'I','a','b',''),
(2,'O','a','d','f'),
(3,'I','d','b',''),
(4,'O','g','l',''),
(5,'I','z','g','a'),
(6,'I','z','g','a')
 
--Verify Data
SELECT ID,Typ,Value1,Value2,Value3 FROM GroupbyMultipleColumns

--solution1

select typ,
 sum(summs) from (
select typ,
	case
	when value1 = 'a' and value2 = 'a' and value3='a' then 3
	when value1='a' and value2 = 'a' or (value1='a' and value2='a') or (value2='a' and value3 = 'a') then 2 
	when value1 = 'a' or value2 = 'a' or value3='a' then 1
	else 0 end as summs
from GroupbyMultipleColumns) as subms
group by typ



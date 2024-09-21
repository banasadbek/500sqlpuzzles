use sql500puzzles
go

--puzzle 19

--Create Table
 
CREATE TABLE TestSplitData
(
 Start DATETIME
,EndDt DATETIME
,Amount INT
)
GO
 
--Insert Data
 
INSERT INTO TestSplitData(Start,EndDt,Amount)
VALUES
('14-Apr-14','13-May-14',200),
('15-May-14','16-Jun-14',320)
 
--Verify Data
 
SELECT format([Start], 'dd-MMMM-yyyy') as [Start],
	format(EndDt, 'dd-MMMM-yyyy') as [End],
	Amount
from TestSplitData

--solution1
select format(start, 'dd-MMMM-yyyy') as [Start],
	format(eomonth(start), 'dd-MMMM-yyyy') [End],
	amount/2 as amount
from testsplitdata
union all
select format((DATEADD(day, -(day(enddt)-1), [enddt])), 'dd-MMMM-yyyy') as [Start],
	format([Enddt], 'dd-MMMM-yyyy') as [End],
	amount/2 as amount
from TestSplitData
order by amount, start desc


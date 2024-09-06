use sql500puzzles
go

--Create table
 
CREATE TABLE EmpBirth
(
 EmpId INT  IDENTITY(1,1) 
,EmpName VARCHAR(50) 
,BirthDate DATETIME 
)
 
--Insert Data
INSERT INTO EmpBirth(EmpName,BirthDate)
SELECT 'Pawan' , '12/04/1983'
UNION ALL
SELECT 'Zuzu' , '11/28/1986'
UNION ALL
SELECT 'Parveen', '05/07/1977'
UNION ALL
SELECT 'Mahesh', '01/13/1983'
UNION ALL
SELECT'Ramesh', '05/09/1983'
 
--Verify data
SELECT EmpId,EmpName,BirthDate FROM EmpBirth

--solution1
select EmpName, BirthDate from EmpBirth
where month(BirthDate) = '05' and (day(BirthDate) >= '7' and day(BirthDate) <= '15')
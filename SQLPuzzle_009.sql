--Create table
CREATE TABLE [dbo].[EmpSalaryGreaterManager]
(
[EmpID] [int] NULL,
[EmpName] [varchar](50) NULL,
[EmpSalary] [bigint] NULL,
[MgrID] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [EmpSalaryGreaterManager](EmpID,EmpName,EmpSalary,MgrID)
VALUES
(1,    'Pawan',      80000, 4),
(2,    'Dheeraj',    70000, 4),
(3,    'Isha',       100000,       4),
(4,    'Joteep',     90000, NULL),
(5,    'Suchita',    110000,       4)
 
--Verify Data
SELECT * FROM [dbo].[EmpSalaryGreaterManager]

--solution1
select empid,
	empname,
	empsalary,
	mgrid
from EmpSalaryGreaterManager
where empsalary > (select empsalary from EmpSalaryGreaterManager
	where mgrid is null)
	and mgrid is not null

--solution2
select employee.empid,
	employee.empname,
	employee.empsalary,
	employee.mgrid
from EmpSalaryGreaterManager employee
inner join EmpSalaryGreaterManager manager
on employee.mgrid = manager.empid and
	employee.EmpSalary > manager.EmpSalary

--solution1 from site
select * from dbo.EmpSalaryGreaterManager e1
where EmpSalary > (select EmpSalary from dbo.EmpSalaryGreaterManager e2 where e1.MgrID = e2.EmpID);



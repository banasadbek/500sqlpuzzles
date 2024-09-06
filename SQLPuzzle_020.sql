use sql500puzzles
go

CREATE TABLE dbo.AlternateMaleFemale
(
ID INT
,NAME VARCHAR(10)
,GENDER VARCHAR(1)
)
GO
 
--Insert data
INSERT INTO dbo.AlternateMaleFemale(ID,NAME,GENDER)
VALUES
(1,'Neeraj','M'),
(2,'Mayank','M'),
(3,'Pawan','M'),
(4,'Gopal','M'),
(5,'Sandeep','M'),
(6,'Isha','F'),
(7,'Sugandha','F'),
(8,'kritika','F')
 
--Verify Data
SELECT ID,NAME,GENDER FROM AlternateMaleFemale

--solution1
select id, name, gender
from AlternateMaleFemale
order by row_number() over(partition by gender order by(gender)), gender desc

--solution from site
SELECT ID,NAME,GENDER FROM AlternateMaleFemale
order by RANK()over(partition by gender order by id),GENDER desc
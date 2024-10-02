--Create Table
 
CREATE TABLE GenderCount
(
NAME VARCHAR(10)
,Gender VARCHAR(1)
)
GO
 
--INSERT Data
INSERT INTO GenderCount(NAME,Gender)
VALUES
('Pawan','M'),
('Isha','F'),
('Neeraj','M'),
('Mayank','M'),
('Sandeep','M'),
('Gopal','M'),
('Sugandha','F'),
('Kritika','F')
 
--Verify Data
SELECT NAME,Gender FROM GenderCount

--solution1
select
	sum(case when gender = 'f' then 1 else 0 end) as femalecount,
	sum(case when gender = 'm' then 1 else 0 end) as malecount
from GenderCount

use sql500puzzles
go

--Create table
 
CREATE TABLE NthHighest
(
 Name  varchar(5)  NOT NULL,
 Salary  int  NOT NULL
)
 
--Insert the values
INSERT INTO  NthHighest(Name, Salary)
VALUES
('e5', 45000),
('e3', 30000),
('e2', 49000),
('e4', 36600),
('e1', 58000)
 
--Check data
SELECT Name,Salary FROM NthHighest

--solution1
select name,
	salary
from NthHighest
order by salary desc
offset 1 rows
fetch next 1 rows only

--solution2
declare @nth int

create procedure uspnthhighestsalary @nth int
as begin
	select name,
		salary
	from NthHighest
	order by salary desc
	offset @nth-1 rows
	fetch next 1 rows only
end;

exec uspnthhighestsalary 2



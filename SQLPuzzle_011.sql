use sql500puzzles
go

--Create table
CREATE TABLE [dbo].[TestMultipleZero]
(
[A] [int] NULL,
[B] [int] NULL,
[C] [int] NULL,
[D] [int] NULL
)
GO
 
--Insert Data
INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES (0,0,0,1),(0,0,1,0),(0,1,0,0),(1,0,0,0),(0,0,0,0),(1,1,1,0)
 
--Check data
SELECT A,B,C,D FROM [dbo].[TestMultipleZero]

--solution1
select A,B,C,D
from TestMultipleZero
except
select A,B,C,D
from TestMultipleZero
where A=0 and B=0 and C=0 and D=0

--solution2
select A,B,C,D
from TestMultipleZero
where greatest(A,B,C,D) = 1

--solution3
select A,B,C,D
from TestMultipleZero
where A !=0 or B !=0 or C!=0 or D !=0

--solution4
select A,B,C,D
from (select A,B,C,D, A+B+C+D as summ
	from TestMultipleZero) as Summ
where summ !=0
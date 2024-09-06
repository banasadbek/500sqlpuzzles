use sql500puzzles
go

--puzzle4
--Create a sample movie table
CREATE TABLE [Movie]
(
 
[MName] [varchar] (10) NULL,
[AName] [varchar] (10) NULL,
[Roles] [varchar] (10) NULL
)
 
GO
 
--Insert data in the table
 
INSERT INTO Movie(MName,AName,Roles)
SELECT 'A','Amitabh','Actor'
UNION ALL
SELECT 'A','Vinod','Villan'
UNION ALL
SELECT 'B','Amitabh','Actor'
UNION ALL
SELECT 'B','Vinod','Actor'
UNION ALL
SELECT 'D','Amitabh','Actor'
UNION ALL
SELECT 'E','Vinod','Actor'
 
--Check your data
SELECT MName , AName , Roles FROM Movie

--solution1
select *
from movie
where mname in (
select mname
from movie
where roles = 'Actor'
group by mname
having count(aName) = 2)

--solution from site
select a.*
from movie a
inner join movie b
on a.mname = b.mname
where (a.aname = 'amitabh' and b.aname = 'vinod' or
	b.aname = 'amitabh' and a.aname = 'vinod')
	and a.roles = 'actor'
	and b.roles = 'actor'


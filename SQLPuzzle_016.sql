use sql500puzzles
go

--Create table
 
CREATE TABLE IndAusSeries
(
TeamA VARCHAR(3)
,TeamB VARCHAR(3)
,MatchDate DATETIME
,WinsBy VARCHAR(3)
)
GO
 
--Insert Data
 
INSERT INTO IndAusSeries(TeamA,TeamB,MatchDate,WinsBy)
VALUES
('Ind','Aus','01-10-2014','Ind'),
('Ind','Aus','01-15-2014','Ind'),
('Ind','Aus','01-19-2014','Ind'),
('Ind','Aus','01-23-2014','Aus'),
('Ind','Aus','01-27-2014','Ind'),
('Ind','Aus','01-31-2014','Ind')
 
--Verify Data
 
SELECT TeamA,TeamB,MatchDate,WinsBy FROM IndAusSeries

--solution1

with rankedmatches as(
	select teama,
		teamb,
		matchdate,
		winsby,
		row_number() over(order by matchdate) as matchrank,
		row_number() over(partition by winsby order by matchdate) as wingroup
	from IndAusSeries
)
select teama,
	teamb,
	matchdate,
	winsby
from rankedmatches
where winsby = 'Ind'
	and (matchrank - wingroup) = (
		select min(matchrank-wingroup)
		from rankedmatches
		where winsby = 'Ind'
)
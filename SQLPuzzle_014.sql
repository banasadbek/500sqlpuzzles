use sql500puzzles
go

--Create table
 
Create table tr_football_league
(
club_id INT,
club_name Varchar(32),
championship_year INT,
year_100th_champion INT
)
 
--Insert Data
insert into tr_football_league values (1, 'FENERBAHCE', 2007, 1) ;
insert into tr_football_league values (2, 'GALATASARAY', 2006, 0) ;
insert into tr_football_league values (3, 'BESIKTAS', 2003, 1) ;
insert into tr_football_league values (1, 'FENERBAHCE', 2005, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 2004, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 2002, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 2000, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1999, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1998, 0) ;
insert into tr_football_league values (2, 'GALATASARAY', 1997, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1996, 0);
insert into tr_football_league values (1, 'FENERBAHCE', 2001, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1989, 0) ;
insert into tr_football_league values (1, 'FENERBAHCE', 1985, 0) ;
 
--Verify Data
SELECT club_id, club_name , championship_year , year_100th_champion FROM tr_football_league

--solution1
with count_champ_years_cte as(
	select club_id,
		count(championship_year) as count_champ_years
	from tr_football_league
	group by club_id
),
max_champ_club_cte as(
	select max(count_champ_years)as max_champ_club
	from count_champ_years_cte
	)
select club_name
from tr_football_league
where year_100th_champion = 1
and club_id in (
	select club_id
	from count_champ_years_cte
	where count_champ_years = (select max_champ_club from max_champ_club_cte)
)

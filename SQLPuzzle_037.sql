use sql500puzzles
go

--Create table
CREATE TABLE FruitCount
(
Name VARCHAR(20)
,Fruit VARCHAR(25)
)
GO

--Insert Data
INSERT INTO FruitCount(Name,Fruit) VALUES
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'MANGO'),
('Neeraj'    ,'APPLE'),
('Neeraj'    ,'ORANGE'),
('Neeraj'    ,'LICHI'),
('Neeraj'    ,'LICHI'),
('Neeraj'    ,'LICHI'),
('Isha'     ,'MANGO'),
('Isha'     ,'MANGO'),
('Isha'     ,'APPLE'),
('Isha'     ,'ORANGE'),
('Isha'     ,'LICHI'),
('Gopal' ,'MANGO'),
('Gopal' ,'MANGO'),
('Gopal' ,'APPLE'),
('Gopal' ,'APPLE'),
('Gopal' ,'APPLE'),
('Gopal' ,'ORANGE'),
('Gopal' ,'LICHI'),
('Mayank'  ,'MANGO'),
('Mayank'  ,'MANGO'),
('Mayank'  ,'APPLE'),
('Mayank'  ,'APPLE'),
('Mayank'  ,'ORANGE'),
('Mayank'  ,'LICHI')

--Verify Data
SELECT Name,Fruit FROM FruitCount

--solution1
with cte1 as(
select name,
	count(fruit) MangoCount
from FruitCount
where fruit = 'mango'
group by name
), cte2 as(
select name,
	count(fruit) AppleCount
from FruitCount
where fruit = 'apple'
group by name
), cte3 as(
select name,
	count(fruit) LichiCount
from FruitCount
where fruit = 'lichi'
group by name
), cte4 as(
select name,
	count(fruit) OrangeCount
from FruitCount
where fruit = 'orange'
group by name
)
select cte1.name,
	mangocount,
	applecount,
	lichicount,
	orangecount
from cte1
inner join cte2
on cte1.name = cte2.name
inner join cte3
on cte1.name = cte3.name
inner join cte4
on cte1.name = cte4.name

--solution2
select name,
	sum(case when fruit = 'mango' then 1 else 0 end) as mangocount,
	sum(case when fruit = 'apple' then 1 else 0 end) as applecount,
	sum(case when fruit = 'lichi' then 1 else 0 end) as lichicount,
	sum(case when fruit = 'orange' then 1 else 0 end) as orangecount
from FruitCount
group by name
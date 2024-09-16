use sql500puzzles
go

--Create Table
 
CREATE TABLE WorkOrders
(
WorkOrderID CHAR(5) NOT NULL,
STEP_NBR INTEGER NOT NULL CHECK (step_nbr BETWEEN 0 AND 1000),
STEP_STATUS CHAR(1) NOT NULL CHECK (step_status IN ('C', 'W')), -- complete, waiting
)
GO
 
--Insert Data
INSERT INTO WorkOrders(WorkOrderID,STEP_NBR,STEP_STATUS) VALUES
('AA100', 0, 'C'),
('AA100', 1, 'W'),
('AA100', 2, 'W'),
('AA200', 0, 'W'),
('AA200', 1, 'W'),
('AA300', 0, 'C'),
('AA300', 1, 'C')
GO
 
 
SELECT WorkOrderID,STEP_NBR,STEP_STATUS FROM WorkOrders

--solution1
select workorderID
from WorkOrders
where step_nbr = 0
	and step_status = 'C'
intersect
select workorderID
from WorkOrders
where step_nbr > 0
	and step_status = 'W'

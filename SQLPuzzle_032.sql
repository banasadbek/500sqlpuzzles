use sql500puzzles
go

--Create table

CREATE TABLE Approver
(
ID INT
,Name VARCHAR(10)
)
GO


--Insert data
INSERT INTO Approver(ID,Name)
VALUES (1001,'Ram') , (1002,'Ramesh') , (1003,'Supriya') ,(1004,'Sharlee')


--Verify data
SELECT ID,Name FROM Approver


--Create table
CREATE TABLE TicketDetails
(
TicketID INT
,CreatedBy INT
,ApprovedBy INT
)
GO

--Insert data
INSERT INTO TicketDetails(TicketID,CreatedBy,ApprovedBy)
VALUES
(1,1001,1004),
(2,1001,1004),
(3,1002,1004),
(4,1001,1003)

--Verify data
SELECT TicketID,CreatedBy,ApprovedBy FROM TicketDetails

--solution1
select a.TicketID
	,b.Name CreatedBy
	,c.Name ApprovedBy
from TicketDetails a
left join Approver b
on a.CreatedBy = b.ID 
left join Approver c
on a.ApprovedBy = c.ID
order by TicketID
use sql500puzzles
go

--Create Table
CREATE TABLE FindRunningBalance
(
Dt DATETIME,
CID VARCHAR(50),
TransactionType VARCHAR(2),
Amount MONEY
)
 
--Insert data
INSERT INTO FindRunningBalance(Dt,CID,TransactionType,Amount)
VALUES
( '2015-01-01','IshaMattoo','CR','18,000' ),
( '2015-01-02','IshaMattoo','DB','3,000' ),
( '2015-01-03','IshaMattoo','CR','8,000' ),
( '2015-01-04','IshaMattoo','DB','9,000' ),
( '2015-01-04','AvtaarKishan','CR','1,000' ),
( '2015-01-05','AvtaarKishan','CR','6,000'),
( '2015-01-05','AvtaarKishan','DB','5,000' )
 
--Verify Data
SELECT Dt,CID,TransactionType,Amount FROM FindRunningBalance

--solution1
select Dt
	,CID
	,TransactionType
	,Amount
	,sum(case when transactiontype = 'DB' then -Amount else Amount end) over(partition by CID order by dt, Transactiontype, amount) as FindRunningBalance
FROM FindRunningBalance
use sql500puzzles
go

--Create Table
drop table if exists PatientProblem
CREATE TABLE PatientProblem
(
PatientID INT,
AdmissionDate DATETIME,
DischargeDate DATETIME,
Cost MONEY
)
GO
 
--Insert Data
INSERT INTO PatientProblem(PatientID,AdmissionDate,DischargeDate
,Cost)
VALUES
(1009,'2014-07-27','2014-07-31',1050.00),
(1009,'2014-08-01','2014-08-23',1070.00),
(1009,'2014-08-31','2014-08-31',1900.00),
(1009,'2014-09-01','2014-09-14',1260.00),
(1009,'2014-12-01','2014-12-31',2090.00),
(1024,'2014-06-07','2014-06-28',1900.00),
(1024,'2014-06-29','2014-07-31',2900.00),
(1024,'2014-08-01','2014-08-02',1800.00)
 
--Verify Data
SELECT PatientID,AdmissionDate,DischargeDate,Cost 
FROM PatientProblem

--solution1

WITH cte AS (
    SELECT
        PatientID,
        AdmissionDate,
        DischargeDate,
        Cost,
        LAG(DischargeDate) OVER (PARTITION BY PatientID ORDER BY AdmissionDate) AS PrevDischargeDate
    FROM patientproblem
),
cte2 AS (
    SELECT *,
        -- Create a grouping identifier based on whether admission date follows the previous discharge date
        CASE
            WHEN AdmissionDate = DATEADD(DAY, 1, PrevDischargeDate) THEN 0
            ELSE 1
        END AS NewGroup
    FROM cte
),
cte3 AS (
    SELECT *,
        -- Create a running sum to identify groups of consecutive admissions
        SUM(NewGroup) OVER (PARTITION BY PatientID ORDER BY AdmissionDate) AS GroupID
    FROM cte2
)
--select * from cte3
-- Aggregate by PatientID and GroupID to merge consecutive stays
SELECT
    PatientID,
    MIN(AdmissionDate) AS AdmissionDate,
    MAX(DischargeDate) AS DischargeDate,
    SUM(Cost) AS TotalCost
FROM cte3
GROUP BY PatientID, GroupID
ORDER BY PatientID, AdmissionDate;

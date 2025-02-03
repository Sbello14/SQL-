Drop Table if Exists World 

Create Table World
(
First_Name Varchar(70),
Last_Name Varchar(70),
Country Varchar (70)
)

Insert Into World (First_Name, Last_Name, Country)
Values
('Adam','Cooper', 'USA'),
('John','Smith', 'USA'),
('Mark','Allan', 'UK'),
('Sally','Jones', 'USA'),
('Steve','Brown', 'Canada')

--------------------
--Create a logic to show Continents. USA & Canada are North America, UK is Europe.

Select
First_Name,
Last_Name,
Country,
CASE
WHEN Country = 'USA' OR Country = 'Canada' THEN 'North America' ELSE 'Europe'
END
AS Continent
From World
-------------------------------------------------------------------
--SHow size of company for employees whose number is 55 as Large, Number 4 as Small,
--Numbers higher than 10, but below 55 as Medium

Alter Table World
ADD Employees INT

UPDATE World 
SET Employees = CASE
    WHEN First_Name = 'Adam' THEN 55
    WHEN First_Name = 'John' THEN 4
	WHEN First_Name = 'Mark' THEN 23
	WHEN First_Name = 'Sally' THEN 10
	WHEN First_Name = 'Steve' THEN 15
    ELSE First_Name -- Keeps the current value if no match
END;

Select * from world

Select
First_Name,
Last_Name,
Country,
Employees,
CASE
WHEN Employees = 55 THEN 'Large'
WHEN Employees = 4 THEN 'Small'
WHEN Employees Between 10 and 55 THEN 'Medium'
ELSE CAST(Employees as Varchar)
END AS Continent
From World
------------------------------------------
--SHow size of company for employees whose number is below 1 as "No Employee". SHow size of company for employees whose number is 55 as Large, Number 4 as Small,
--Numbers higher than 10, but below 55 as Medium



Select
First_Name,
Last_Name,
Country,
Employees,
CASE
WHEN Employees < 1 THEN 'No Employee'
WHEN Employees = 55 THEN 'Large'
WHEN Employees = 4 THEN 'Small'
WHEN Employees Between 10 and 55 THEN 'Medium'
ELSE CAST(Employees as Varchar)
END AS Continent
From World
-------------------------------------------------------------

-- Create the table
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SCORE INT,
    GRADE VARCHAR(2)
);

-- Insert the data
INSERT INTO Students (ID, NAME, SCORE, GRADE) VALUES
(1, 'Simisola', 60, 'D'),
(2, 'Ivan', 80, 'B-'),
(3, 'Metodija', 52, 'F'),
(4, 'Callum', 98, 'A'),
(5, 'Leia', 84, 'B'),
(6, 'Aparecida', 82, 'B-'),
(7, 'Ursula', 69, 'D+'),
(8, 'Ramazan', 78, 'C+'),
(9, 'Corona', 87, 'B+'),
(10, 'Alise', 57, 'F'),
(11, 'Galadriel', 89, 'B+'),
(12, 'Merel', 99, 'A'),
(13, 'Cherice', 55, 'F'),
(14, 'Nithya', 81, 'B-'),
(15, 'Elşad', 71, 'C-'),
(16, 'Liisi', 90, 'A-'),
(17, 'Johanna', 90, 'A-'),
(18, 'Anfisa', 90, 'A-'),
(19, 'Ryōsuke', 97, 'A'),
(20, 'Sakchai', 61, 'D'),
(21, 'Elbert', 63, 'D'),
(22, 'Katelyn', 51, 'F');


--When score is 94 or Higher then A
--When score is 94 A
--If score is 90 A-
--If score is 87 then B+
--If score is 83 then B
--If score is 80 then B-
--If score is 77 then C+
--If score is 73 then C
--If score is 70 then C-
--If score is 67 then D+
--If score is 60 then D
--Else F

Select
ID,
NAME,
SCORE,
CASE
	WHEN Score >= 94 THEN 'A'
	WHEN Score >= 94 THEN 'A'
	WHEN Score >= 90 THEN 'A-'
	WHEN Score >= 87 THEN 'B+'
	WHEN Score >= 83 THEN 'B'
	WHEN Score >= 80 THEN 'B-'
	WHEN Score >= 77 THEN 'C+'
	WHEN Score >= 73 THEN 'C'
	WHEN Score >= 70 THEN 'C-'
	WHEN Score >= 67 THEN 'D+'
	WHEN Score >= 60 THEN 'D'
	ELSE 'F'
	END AS
	Grade
FROM Students
Order By ID 

--------------------------------------------------
--Show how many students passed or failed. If a student scores 60 or higher that student passed.
--If lower than 60 they failed

Select Result,
Count(*) as Number_of_Students
From
(
Select
CASE
	WHEN Score >= 60 THEN 'Passed'
	WHEN Score < 60 THEN 'Failed'
END AS
Result
FROM Students
) A
GROUP BY Result
ORDER BY Number_of_Students DESC

-------------------------------------------------------
DROP TABLE IF EXISTS AfricaTemperature;
CREATE TABLE AfricaTemperature
( [RecordedDate] DATE NOT NULL, [DegreeInFahrenheit] DECIMAL(4, 2) NULL ); INSERT INTO AfricaTemperature ( [RecordedDate], [DegreeInFahrenheit] )
VALUES ('01-01-2023', '32.60'),
('01-02-2023', '31.20'),
('01-03-2023', '42.00'),
('01-04-2023', '44.60'),
('01-05-2023', '39.40'),
('01-06-2023', '31.70'),
('01-07-2023', NULL),
('01-08-2023', '21.20'),
('01-09-2023', '19.15'),
('01-10-2023', '07.90')

SELECT * FROM
AfricaTemperature

--Business requirements: DegreeInFahrenheit is more than 40.00' ,show as Hot 
--If DegreeInFahrenheit is below 32:00, show as 'It''s too cold outside!' 
--If DegreeInFahrenheit is not available, show as 'Why didn''t you record this?' Otherwise, shows as Sounds about right' Show the result in a new column Weather


Select
RecordedDate,
DegreeInFahrenheit,
CASE
	WHEN DegreeInFahrenheit > 40.00 THEN 'Hot'
	WHEN DegreeInFahrenheit < 32.00 THEN 'It''s too cold outside!'
	WHEN DegreeInFahrenheit IS NULL THEN 'Why didn''t you record this?'
	ELSE 'Sounds about right'
	END AS
	Weather
From AfricaTemperature
--------------------------------------------
--Count of Weather
SELECT
    CASE
        WHEN DegreeInFahrenheit > 40.00 THEN 'Hot'
        WHEN DegreeInFahrenheit < 32.00 THEN 'It''s too cold outside!'
        WHEN DegreeInFahrenheit IS NULL THEN 'Why didn''t you record this?'
        ELSE 'Sounds about right'
    END AS Weather,
    COUNT(*) AS WeatherCount
FROM AfricaTemperature
GROUP BY
    CASE
        WHEN DegreeInFahrenheit > 40.00 THEN 'Hot'
        WHEN DegreeInFahrenheit < 32.00 THEN 'It''s too cold outside!'
        WHEN DegreeInFahrenheit IS NULL THEN 'Why didn''t you record this?'
        ELSE 'Sounds about right'
    END;


Select * from healthcaredataset

Truncate Table healthcaredataset



--1 Show total # of records in the table
Select Count(*) as '# of Records'
From healthcaredataset

--2 Show maximum age of patients addmited 
	Select  Max(age) as 'Max Age of Patients Admitted'
	From healthcaredataset
	

-- 3 Average age of people hospitalized
Select AVG(age) as 'AVG Age of People Hospitalized'
From healthcaredataset


-- 4 Patients Hospitalized Age from Max to Min
Select age, Count(age) as 'Age count'
from healthcaredataset
Group by Age
Order BY age desc

-- 5 Calculating Max Count of patients on basis of total patiens in respect to age
Select age, MAX(count) as 'Max Count of Patients in respect to Age'
From
(
Select  age, count(*) as Count
From healthcaredataset
Group By age 
) D
Group By age

--6 Ranking age on the number of patients hospitalized 
Select Age,
count(Age) as 'Total', 
DENSE_RANK() OVER (order by count(age) DESC, age DESC) As Rank
From healthcaredataset
Group By Age
HAVING Count(age) > AVG(Age)

  
/*

SELECT AGE, COUNT(AGE) As Total, dense_RANK() OVER(ORDER BY COUNT(AGE) DESC, age DESC) as Ranking_Admitted 
FROM HealthcareDataSet
GROUP BY age
HAVING COUNT(AGE) > Avg(age);

*/
7 Find Count of Medical Condition of patients and listing it by Max no. of patients

Select [Medical Condition], Count (*) as 'Max no. of patients'
From healthcaredataset
Group By [Medical Condition]

--8 Finding Rank & MAX number of medicines recommended to patients based on Medical Condition pertaining to them

Select [medical condition],medication, COUNT(medication) as 'Max # of Medicines', 
DENSE_RANK() OVER (order by COUNT(medication) DESC) as Rank
FROM healthcaredataset
Group By [Medical Condition], medication



--9 Most Preffered Insurance Provider by Patients

Select TOP 1  [Insurance Provider], Count(*) as Count
From healthcaredataset
Group By [Insurance Provider]
Order By Count DESC


--10 Most Preffered Hospital 

Select TOP 1  Hospital, Count(*) as Count
From healthcaredataset
Group By Hospital
Order By Count DESC



Select * from 
healthcaredataset

Alter Table healthcaredataset
Alter Column [Billing Amount] DECIMAL(18,2)

Select [Billing Amount]
FROM HealthCareDataSet
Where ISNUMERIC([Billing Amount]) = 0

--11 Identify Average Billing Amount by medical condition
Select [Medical Condition], AVG([Billing Amount]) from 
healthcaredataset
Group By [Medical Condition]



--12 Find Billing amount of patients admitted and number of days spent in respective hospital

Select * from healthcaredataset

Select Name, [Billing Amount], [Date of Admission] - [Discharge Date] As 'Number of Days in Hospital', Hospital
From healthcaredataset

Alter Table healthcaredataset
Alter Column [Date of Admission] DATE;

Alter Table healthcaredataset
Alter Column [Discharge Date] DATE;


--13 Find total number of days spent by patient in a hospital for given medical condition








--14 Find hospitals which were succesful in discharging patients after having test results as Normal with count of days taken to get results to Normal


Select Hospital, [Test Results]







--15 Calculate number of blood types of patients which lies between age 20 to 45

Select [Blood Type], count(*) as 'Count of Blood Type'
From healthcaredataset
Where Age Between 20 and 45
Group By [blood type]
Order By Count(*) DESC



-- 16 Find how many patients are Universal blood doners and Universal Blood reciever

Select Count(*) as 'Count of Uni Blood Doner & Uni Blood Reci'
From healthcaredataset
Where [Blood Type] IN('O-', 'AB+')

--OR

Select [Blood Type], Count(*) as 'Count of Uni Blood Doner & Uni Blood Reci'
From healthcaredataset
Where [Blood Type] IN ('O-', 'AB+')
Group By [Blood Type]








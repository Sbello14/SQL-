Select * from [dbo].[EmployeeDemographics]
Select * from [dbo].[EmployeeSalary]
-- Based on Gender How many people that the age is above 30 or above

Select Gender,
Count(EmployeeID) as Countof30orAbove
From [EmployeeDemographics]
Where Age > 30
Group by Gender







--Highest salary for each gender
Select * from [dbo].[EmployeeDemographics]
Select * from [dbo].[EmployeeSalary]

Select ED.Gender, 
MAX(ES.Salary) as HighestSalaryPerGender
From [EmployeeDemographics] ED
JOIN [EmployeeSalary] ES
ON ED.EmployeeID = ES.EmployeeID
Group By Ed.Gender




--Salary of every employee and there title (all data)
Select * from [dbo].[EmployeeDemographics]
Select * from [dbo].[EmployeeSalary]

Select ED.*,
ES.*
FROM [EmployeeDemographics] ED
JOIN [EmployeeSalary] ES
ON ED.employeeID = ES.employeeID


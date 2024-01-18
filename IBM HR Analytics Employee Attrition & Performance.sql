-- Display the first few rows of the dataset
SELECT *
FROM IBMHR
LIMIT 5;

-- Calculate the average age of employees
SELECT AVG(Age) AS AverageAge
FROM IBMHR;

-- Count the number of employees by gender
SELECT Gender, COUNT(*) AS EmployeeCount
FROM IBMHR
GROUP BY Gender;

-- Calculate the average monthly income by department
SELECT Department, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM IBMHR
GROUP BY Department;

-- Identify the most common job roles
SELECT JobRole, COUNT(*) AS JobRoleCount
FROM IBMHR
GROUP BY JobRole
ORDER BY JobRoleCount DESC;

-- Calculate the overall attrition rate
SELECT Attrition, COUNT(*) AS AttritionCount
FROM IBMHR
GROUP BY Attrition;

-- Calculate the average years of experience (TotalWorkingYears) by education level
SELECT Education, AVG(TotalWorkingYears) AS AvgExperienceByEducation
FROM IBMHR
GROUP BY Education;

-- Identify employees with the highest monthly income
SELECT *
FROM IBMHR
WHERE MonthlyIncome = (SELECT MAX(MonthlyIncome) FROM IBMHR);

-- Identify employees with the lowest job satisfaction
SELECT *
FROM IBMHR
WHERE JobSatisfaction = (SELECT MIN(JobSatisfaction) FROM IBMHR);

-- Calculate the average years spent in the current role by department
SELECT Department, AVG(YearsInCurrentRole) AS AvgYearsInCurrentRole
FROM IBMHR
GROUP BY Department;

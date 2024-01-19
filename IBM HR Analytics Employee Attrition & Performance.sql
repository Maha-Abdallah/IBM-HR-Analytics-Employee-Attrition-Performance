-- Display the first few rows of the dataset
SELECT *
FROM IBMHR
LIMIT 5;

-- Calculate the average age of employees
SELECT AVG(Age) AS AverageAge
FROM IBMHR;

--Average Age of Employees: 36.923809523809524--

-- Count the number of employees by gender
SELECT Gender, COUNT(*) AS EmployeeCount
FROM IBMHR
GROUP BY Gender;

/*
Number of Employees by Gender:--
   --Gender  EmployeeCount--
--0  Female            588--
--1    Male            882
*/
-- Calculate the average monthly income by department
SELECT Department, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM IBMHR
GROUP BY Department;

/*
--Average Monthly Income by Department:--
--               Department  AverageMonthlyIncome--
--0         Human Resources           6654.507937--
--1  Research & Development           6281.252862--
--2                   Sales           6959.172646--
*/

-- Identify the most common job roles
SELECT JobRole, COUNT(*) AS JobRoleCount
FROM IBMHR
GROUP BY JobRole
ORDER BY JobRoleCount DESC;

/*
--Most Common Job Roles:--
--                       index  JobRoleCount--
--0            Sales Executive           326--
--1         Research Scientist           292--
--2      Laboratory Technician           259--
--3     Manufacturing Director           145--
--4  Healthcare Representative           131--
--5                    Manager           102--
--6       Sales Representative            83--
--7          Research Director            80--
--8            Human Resources            52--
*/

-- Calculate the overall attrition rate
SELECT Attrition, COUNT(*) AS AttritionCount
FROM IBMHR
GROUP BY Attrition;

/*
--Attrition Rate:--
--  index  AttritionCount--
--0    No            1233--
--1   Yes             237--
*/

-- Calculate the average years of experience (TotalWorkingYears) by education level
SELECT Education, AVG(TotalWorkingYears) AS AvgExperienceByEducation
FROM IBMHR
GROUP BY Education;

/*
--Average Years of Experience by Education Level:--
--   Education  AvgExperienceByEducation--
--0          1                  8.788235--
--1          2                 10.712766--
--2          3                 11.260490--
--3          4                 12.434673--
--4          5                 14.083333--
*/
  
-- Identify employees with the highest monthly income
SELECT *
FROM IBMHR
WHERE MonthlyIncome = (SELECT MAX(MonthlyIncome) FROM IBMHR);

/*
--Employees with the Highest Monthly Income:--
--     Age Attrition BusinessTravel  DailyRate              Department  --
--190   52        No  Travel_Rarely        699  Research & Development   --
--     DistanceFromHome  Education EducationField  EmployeeCount  --
--190                 1          4  Life Sciences              1   --

--     EmployeeNumber  ...  RelationshipSatisfaction StandardHours  --
--190             259  ...                         1            80   --

--     StockOptionLevel  TotalWorkingYears  TrainingTimesLastYear  --
--190                 1                 34                      5  -- 

--    WorkLifeBalance  YearsAtCompany YearsInCurrentRole  --
--190               3              33                 18   --

  --   YearsSinceLastPromotion  YearsWithCurrManager  --
--190                       11                     9  --

-- Identify employees with the lowest job satisfaction
SELECT *
FROM IBMHR
WHERE JobSatisfaction = (SELECT MIN(JobSatisfaction) FROM IBMHR);

--Employees with the Lowest Job Satisfaction:--
--      Age Attrition     BusinessTravel  DailyRate              Department  --
--6      59        No      Travel_Rarely       1324  Research & Development --  
--15     29        No      Travel_Rarely       1389  Research & Development   --
--21     36       Yes      Travel_Rarely       1218                   Sales --  
--24     34       Yes      Travel_Rarely        699  Research & Development   --
--26     32       Yes  Travel_Frequently       1125  Research & Development   --
...   ...       ...                ...        ...                     ...   
--1449   32        No      Travel_Rarely        529  Research & Development --  
--1460   29        No      Travel_Rarely        468  Research & Development --  
--1461   50       Yes      Travel_Rarely        410                   Sales  -- 
--1463   31        No         Non-Travel        325  Research & Development   --
--1466   39        No      Travel_Rarely        613  Research & Development--   
--DistanceFromHome  Education    EducationField  EmployeeCount  \
6                    3          3           Medical              1   
15                  21          4     Life Sciences              1   
21                   9          4     Life Sciences              1   
24                   6          1           Medical              1   
26                  16          1     Life Sciences              1   
...                ...        ...               ...            ...   
1449                 2          3  Technical Degree              1   
1460                28          4           Medical              1   
1461                28          3         Marketing              1   
1463                 5          3           Medical              1   
1466                 6          1           Medical              1   

      EmployeeNumber  ...  RelationshipSatisfaction StandardHours  \
6                 10  ...                         1            80   
15                20  ...                         3            80   
21                27  ...                         2            80   
24                31  ...                         3            80   
26                33  ...                         2            80   
...              ...  ...                       ...           ...   
1449            2038  ...                         4            80   
1460            2054  ...                         2            80   
1461            2055  ...                         2            80   
1463            2057  ...                         2            80   
1466            2062  ...                         1            80   

      StockOptionLevel  TotalWorkingYears  TrainingTimesLastYear  \
6                    3                 12                      3   
15                   1                 10                      1   
21                   0                 10                      4   
24                   0                  8                      2   
26                   0                 10                      5   
...                ...                ...                    ...   
1449                 0                  4                      4   
1460                 0                  5                      3   
1461                 1                 20                      3   
1463                 0                 10                      2   
1466                 1                  9                      5   

     WorkLifeBalance  YearsAtCompany YearsInCurrentRole  \
6                  2               1                  0   
15                 3              10                  9   
21                 3               5                  3   
24                 3               4                  2   
26                 3              10                  2   
...              ...             ...                ...   
1449               3               4                  2   
1460               1               5                  4   
1461               3               3                  2   
1463               3               9                  4   
1466               3               7                  7   

      YearsSinceLastPromotion  YearsWithCurrManager  
6                           0                     0  
15                          8                     8  
21                          0                     3  
24                          1                     3  
26                          6                     7  
...                       ...                   ...  
1449                        1                     2  
1460                        0                     4  
1461                        2                     0  
1463                        1                     7  
1466                        1                     7  
*/

-- Calculate the average years spent in the current role by department
SELECT Department, AVG(YearsInCurrentRole) AS AvgYearsInCurrentRole
FROM IBMHR
GROUP BY Department;

/*
Average Years in Current Role by Department:
               Department  AvgYearsInCurrentRole
0         Human Resources               3.539683
1  Research & Development               4.155047
2                   Sales               4.486547
*/


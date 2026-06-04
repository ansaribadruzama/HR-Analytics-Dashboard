use hr_analytics;

CREATE TABLE hr_employees (
    Age INT,
    Attrition VARCHAR(5),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    Attrition_Flag INT,
    Age_Group VARCHAR(10)
);

LOAD DATA LOCAL INFILE 'C:/Users/Dell/Downloads/HR-Analytics-Dashboard/dataset/hr_analytics_cleaned.csv'
INTO TABLE hr_employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS Total_Employees FROM hr_employees;

SELECT Attrition_Flag, MonthlyIncome 
FROM hr_employees 
LIMIT 5;

#1 Overall attrition summary
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income,
    ROUND(AVG(Age), 1) AS Avg_Age
FROM hr_employees;

#2 Identifying which department has the highest attrition risk
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary
FROM hr_employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

#3 Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary
FROM hr_employees
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;

#4 Attrition by Age Group
SELECT 
    Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_employees
GROUP BY Age_Group
ORDER BY Attrition_Rate_Percent DESC;

#5 Salary analysis by department and attrition
SELECT 
    Department,
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary,
    ROUND(MIN(MonthlyIncome), 2) AS Min_Salary,
    ROUND(MAX(MonthlyIncome), 2) AS Max_Salary
FROM hr_employees
GROUP BY Department, Attrition
ORDER BY Department, Attrition;

#6 Attrition by Overtime
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_employees
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

#7 Attrition by Job Satisfaction and Work Life Balance
SELECT 
    JobSatisfaction,
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(Attrition_Flag) AS Employees_Left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_employees
GROUP BY JobSatisfaction, WorkLifeBalance
ORDER BY Attrition_Rate_Percent DESC
LIMIT 10;

#8 Employees most likely to leave based on key factors
SELECT 
    JobRole,Department,Age,MonthlyIncome,JobSatisfaction,WorkLifeBalance,
    OverTime,YearsAtCompany
FROM hr_employees
WHERE Attrition = 'Yes'
    AND JobSatisfaction <= 2 AND WorkLifeBalance <= 2 AND OverTime = 'Yes'
ORDER BY MonthlyIncome ASC
LIMIT 15;

#9 Department wise experience and salary band
SELECT 
    Department,
    ROUND(AVG(TotalWorkingYears), 1) AS Avg_Experience_Years,
    ROUND(AVG(YearsAtCompany), 1) AS Avg_Years_At_Company,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Salary,
    CASE 
        WHEN AVG(MonthlyIncome) < 4000 THEN 'Low'
        WHEN AVG(MonthlyIncome) BETWEEN 4000 AND 8000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Band
FROM hr_employees
GROUP BY Department
ORDER BY Avg_Salary DESC;



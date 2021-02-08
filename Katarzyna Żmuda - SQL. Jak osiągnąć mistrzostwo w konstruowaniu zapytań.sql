/*Katarzyna ¯muda - SQL. Jak osi¹gn¹æ mistrzostwo w konstruowaniu zapytañ
Rozdzia³ 1. Klauzula SELECT
Æwiczenia
1.1*/
SELECT Employee.*
FROM Employee;
--1.2
SELECT Employee.FirstName, Employee.LastName
FROM Employee;
--1.3
SELECT Employee.FirstName, Employee.LastName
FROM Employee
WHERE Employee.Id = 1;
--1.4
SELECT Employee.*
FROM Employee
WHERE Employee.Salary >= 2500;
--1.5
SELECT Employee.*
FROM Employee
WHERE Employee.DepartmentId = 3;
--1.6
SELECT Employee.*
FROM Employee
WHERE Employee.DepartmentId <> 3;
--1.7
SELECT Employee.*
FROM Employee
WHERE Employee.HireDate > '2012-02-23';
--1.8
SELECT Employee.*
FROM Employee
WHERE Employee.Salary = 1000
AND Employee.DepartmentId = 4;
--1.9
SELECT Employee.*
FROM Employee
WHERE (Employee.Salary = 1000
OR Employee.Salary = 2000)
AND Employee.DepartmentId = 4;
--1.10
SELECT Employee.*
FROM Employee
WHERE Employee.Active = 1;
--1.11
SELECT Employee.*
FROM Employee
WHERE Employee.Active = 0;
--1.12
SELECT Employee.*, Employee.Salary + 100 AS SalaryAfterRaiseBy100PLN
FROM Employee;
--1.13
SELECT Employee.*, Employee.Salary * 1.1 AS SalaryAfterRaiseBy10Percent
FROM Employee;
--1.14
SELECT Employee.*
FROM Employee
WHERE Employee.Salary * 1.1 > 2500;
--1.15
SELECT Employee.*
FROM Employee
WHERE Employee.Gender = 'M'
AND Employee.BirthDate > '1990-01-01';
--1.16
SELECT Employee.*
FROM Employee
WHERE Employee.Gender = 'W'
AND Employee.BirthDate > '1990-01-01'
AND Employee.Salary <= 2000;
--1.17
SELECT Employee.*
FROM Employee
WHERE Employee.Gender = 'M'
AND Employee.Salary BETWEEN 1000 AND 2000;
--1.18
SELECT Employee.*
FROM Employee
WHERE Employee.HireDate BETWEEN '2012-01-01' AND '2013-12-31';
--1.19
SELECT Employee.*
FROM Employee
WHERE Employee.Salary NOT BETWEEN 1000 AND 2000;
--1.20
SELECT Employee.*
FROM Employee
WHERE Employee.Id IN (1, 2, 3);
--1.21
SELECT Employee.*
FROM Employee
WHERE Employee.Id NOT IN (1, 2, 3);
--1.22
SELECT Employee.*
FROM Employee
WHERE Employee.FirstName = 'John'
AND Employee.Salary > 1500;
--1.23
SELECT Employee.*
FROM Employee
WHERE Employee.FirstName <> 'John'
AND Employee.Salary > 1500;
--1.24
SELECT Employee.*
FROM Employee
WHERE Employee.FirstName IN ('John', 'Linda');
--1.25
SELECT Employee.*
FROM Employee
WHERE Employee.Gender = 'W'
AND Employee.FirstName = 'John';
--1.26
SELECT Employee.*
FROM Employee
WHERE SUBSTRING(Employee.FirstName, 1, 1) = 'J';
--1.27
SELECT Employee.*
FROM Employee
WHERE RIGHT(Employee.LastName, 1) = 'n';
--1.28
SELECT Employee.*
FROM Employee
WHERE SUBSTRING(Employee.FirstName, 2, 1) = 'a';
--1.29
SELECT Employee.*
FROM Employee
WHERE SUBSTRING(Employee.FirstName, 1, 2) = 'Jo'
AND RIGHT(Employee.FirstName, 1) = 'n';
--1.30
SELECT Employee.*
FROM Employee
WHERE SUBSTRING(Employee.LastName, 1, 1) = 'a'
AND SUBSTRING(Employee.LastName, 3, 1) = 'd'
AND RIGHT(Employee.LastName, 1) = 'n';
--1.31
WITH FemaleNames AS (
SELECT 'Magdalena' AS FirstName
UNION ALL
SELECT 'Katarzyna'
UNION ALL
SELECT 'Agnieszka')

SELECT FemaleNames.FirstName
FROM FemaleNames
WHERE SUBSTRING(FemaleNames.FirstName, 2, 1) = 'a'
AND FemaleNames.FirstName LIKE '%a%'
AND RIGHT(FemaleNames.FirstName, 1) = 'a';
--1.32
SELECT Employee.*
FROM Employee
ORDER BY Employee.LastName ASC;
--1.33
SELECT Employee.*
FROM Employee
ORDER BY Employee.LastName ASC, Employee.FirstName ASC;
--1.34
SELECT Employee.*
FROM Employee
ORDER BY Employee.Salary DESC;
--1.35
SELECT Employee.*
FROM Employee
ORDER BY Employee.LastName ASC, Employee.Salary DESC;
--1.36
SELECT TOP(3) Employee.*
FROM Employee
ORDER BY Employee.Salary DESC;
--1.37
SELECT TOP(5) WITH TIES Employee.*
FROM Employee
ORDER BY Employee.Salary DESC;;
--1.38
SELECT TOP(20) PERCENT Employee.*
FROM Employee
ORDER BY Employee.Salary ASC;
--1.39
SELECT DISTINCT Employee.LastName
FROM Employee;
--1.40
SELECT Employee.*
FROM Employee
WHERE Employee.SecondName IS NULL;
--1.41
SELECT Employee.*
FROM Employee
WHERE Employee.Active = 1
AND Employee.RelieveDate IS NOT NULL;
--1.42
SELECT Employee.FirstName, ISNULL(Employee.SecondName, 'Unknown') AS SecondName, Employee.LastName
FROM Employee;
--1.43
SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS FullName
FROM Employee;
--1.44
SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS FullName
FROM Employee
WHERE Employee.SecondName IS NULL
UNION ALL
SELECT CONCAT(Employee.FirstName, ' ', Employee.SecondName, ' ', Employee.LastName) AS FullName
FROM Employee
WHERE Employee.SecondName IS NOT NULL;
--1.45
SELECT Employee.*
FROM Employee
WHERE ISNULL(Employee.Gender, 'W') = 'W';
/*Zadania do samodzielnego wykonania
1.1*/
SELECT Company.*
FROM Company
WHERE LEFT(Company.Name, 1) = 'P';
--1.2
SELECT Company.*
FROM Company
WHERE Company.CityId = 1
AND LEFT(Company.PostCode, 1) = '5';
--1.3
SELECT Company.*
FROM Company
WHERE DATEPART(YEAR, Company.StartDate) = 2000;

SELECT Company.*
FROM Company
WHERE Company.StartDate BETWEEN '2000-01-01' AND '2000-12-13';
--1.4
SELECT Company.Name, Company.AnnualIncome, Company.AnnualIncome / 12 AS MonthlyIncome
FROM Company
WHERE Company.Active = 1
AND Company.EmployeeCount > 1000;
--1.5
SELECT TOP(3) Company.Name, Company.AnnualIncome / 12 AS MonthlyIncome
FROM Company
ORDER BY MonthlyIncome DESC;
--1.6
SELECT Company.*
FROM Company
WHERE Company.AnnualIncome / 12 > 10000;
--1.7
SELECT Company.Name, Company.PostCode, CONCAT(Company.Street, ' ', Company.Number) AS Address
FROM Company
WHERE Company.PostCode IN ('54-621', '78-695', '63896');
--1.8
SELECT Company.Name, CONCAT(ISNULL(Company.Street, 'Unknown'), ' ', Company.Number) AS Address
FROM Company;
--1.9
SELECT Company.*
FROM Company
WHERE Company.CityId NOT IN (1, 3, 5);

SELECT Company.*
FROM Company
WHERE Company.CityId <> 1
AND Company.CityId <> 3
AND Company.CityId <> 5;
--1.10
SELECT Company.*
FROM Company
WHERE Company.Active = 1
AND Company.StartDate IS NULL;
--1.11
SELECT Company.*
FROM Company
WHERE LEFT(Company.Name, 1) IN ('C', 'P', 'T')
AND RIGHT(Company.Name, 1) IN ('O', 'R');
--1.12
SELECT Company.*
FROM Company
WHERE SUBSTRING(Company.Name, 2, 1) = 'o'
AND RIGHT(Company.Name, 1) <> 'E';
--1.13
SELECT TOP(3) Company.*
FROM Company
WHERE Company.StartDate IS NOT NULL
ORDER BY Company.StartDate ASC;
--1.14
SELECT Company.Name, Company.EmployeeCount, 1000 - Company.EmployeeCount AS NumberOfWorkerLeftTo1000
FROM Company
WHERE Company.Active = 1
AND Company.EmployeeCount < 1000;
--1.15
SELECT Company.Name, Company.AnnualIncome / Company.EmployeeCount AS AnnualIncomePerEmployee
FROM Company
WHERE Company.Active = 1;
--1.16
SELECT Company.Name
FROM Company
WHERE Company.AnnualIncome / Company.EmployeeCount > 300;
--1.17
SELECT TOP(1) Company.*
FROM Company
ORDER BY Company.AnnualIncome / Company.EmployeeCount DESC;
--1.18
SELECT Company.*
FROM Company
WHERE Company.Active = 1
AND Company.CityId IN (1, 2)
AND Company.EmployeeCount NOT BETWEEN 500 AND 1500;
--1.19
SELECT Company.*
FROM Company
WHERE SUBSTRING(Company.PostCode, 3, 1) <> '-';

SELECT Company.*
FROM Company
WHERE Company.PostCode NOT LIKE '__-___';
--1.20
SELECT TOP(10) PERCENT Company.*
FROM Company
ORDER BY Company.EmployeeCount DESC;
--1.21
SELECT DISTINCT Company.Street
FROM Company;
--1.22
SELECT Company.Name, Company.CityId, Company.AnnualIncome, Company.EmployeeCount
FROM Company
WHERE Company.CityId IS NOT NULL
ORDER BY Company.CityId ASC, Company.AnnualIncome DESC, Company.EmployeeCount DESC;
--1.23
SELECT Company.*
FROM Company
WHERE ISNULL(Company.StartDate, '2000-01-01') >= '2000-01-01';

SELECT Company.*
FROM Company
WHERE Company.StartDate IS NULL
OR Company.StartDate >= '2000-01-01';
--1.24
SELECT Company.*
FROM Company
WHERE Company.EmployeeCount BETWEEN 1000 AND 1500;

SELECT Company.*
FROM Company
WHERE Company.EmployeeCount >= 1000
AND Company.EmployeeCount <= 1500;
--1.25
SELECT Company.*
FROM Company
WHERE Company.Active = 1
AND Company.Name NOT IN ('Casio', 'Yamaha');

SELECT Company.*
FROM Company
WHERE Company.Active = 1
AND Company.Name <> 'Casio'
AND Company.Name <> 'Yamaha';
/*Rozdzia³ 2. Funkcje wbudowane
Æwiczenia
2.1*/
SELECT Employee.FirstName, Employee.LastName, DATEPART(YEAR, Employee.BirthDate) AS YearOfBirth
FROM Employee;
--2.2
SELECT Employee.FirstName, Employee.LastName, DATEPART(YEAR, Employee.BirthDate) AS YearOfBirth, DATEPART(MONTH, Employee.BirthDate) AS MonthOfBirth, DATEPART(DAY, Employee.BirthDate) AS DayOfBirth, DATENAME(WEEKDAY, Employee.BirthDate) AS WeekDayOfBirth
FROM Employee;
--2.3
SELECT Employee.*
FROM Employee
WHERE DATEPART(YEAR, Employee.BirthDate) = 1990;
--2.4
SELECT Employee.*
FROM Employee
WHERE DATEPART(YEAR, Employee.BirthDate) = 1990
AND DATEPART(MONTH, Employee.BirthDate) = 5;
--2.5
SELECT GETDATE() AS PresentDate;
--2.6
SELECT DATEDIFF(YEAR, '1990-01-01', GETDATE()) AS YearsSubstraction;
--2.7
SELECT Employee.FirstName, Employee.LastName, DATEDIFF(YEAR, Employee.BirthDate, GETDATE()) AS Age
FROM Employee;
--2.8
SELECT Employee.*
FROM Employee
WHERE DATEDIFF(YEAR, Employee.BirthDate, GETDATE()) > 25;
--2.9
SELECT Employee.*
FROM Employee
WHERE DATEDIFF(YEAR, Employee.BirthDate, GETDATE()) < 25
AND Employee.Salary < 2000;
--2.10
SELECT Employee.FirstName, Employee.LastName, DATEDIFF(YEAR, Employee.HireDate, GETDATE()) AS SeniorityInYears
FROM Employee;
--2.11
SELECT Employee.FirstName, Employee.LastName, DATEDIFF(MONTH, Employee.HireDate, GETDATE()) AS SeniorityInMonths
FROM Employee
WHERE Employee.Active = 1;
--2.12
SELECT Employee.*
FROM Employee
WHERE DATEDIFF(MONTH, Employee.HireDate, GETDATE()) BETWEEN 10 AND 20;
--2.13
SELECT Employee.FirstName, Employee.LastName, DATEPART(YEAR, Employee.BirthDate) AS YearOfBirth, DATEDIFF(YEAR, Employee.BirthDate, Employee.HireDate) AS AgeWhenHired
FROM Employee;
--2.14
SELECT Employee.*
FROM Employee
WHERE Employee.HireDate > Employee.RelieveDate;
--2.15
SELECT Employee.FirstName, Employee.LastName, DATEDIFF(MONTH, Employee.HireDate, Employee.RelieveDate) AS MonthsOfSeniorityWhenRelieved
FROM Employee
WHERE Employee.Active = 0;
--2.16
SELECT Employee.FirstName, Employee.LastName, CONCAT(LEFT(Employee.FirstName, 1), LEFT(Employee.LastName, 1)) AS Initials
FROM Employee;
--2.17
SELECT Employee.FirstName, Employee.LastName, LEN(Employee.LastName) AS NumbersOfLettersInSurname
FROM Employee;
--2.18
SELECT Employee.*
FROM Employee
WHERE LEN(Employee.LastName) > 6;
--2.19
SELECT LOWER(Employee.FirstName) AS FirstName, UPPER(Employee.LastName) AS LastName
FROM Employee;
--2.20
SELECT CONCAT(LEFT(Employee.FirstName, 1), Employee.LastName) AS Login
FROM Employee;
--2.21
SELECT LOWER(CONCAT(LEFT(Employee.FirstName, 1), Employee.LastName)) AS Login
FROM Employee;
--2.22
SELECT UPPER(CONCAT(LEFT(Employee.FirstName, 1), LEFT(Employee.LastName, 5))) AS ShortLogin
FROM Employee;
--2.23
SELECT Employee.FirstName, Employee.LastName, DATEDIFF(YEAR, Employee.BirthDate, GETDATE()) AS Age
FROM Employee
ORDER BY Age ASC, Employee.LastName ASC, Employee.FirstName ASC;
/*Zadania do samodzielnego wykonania
2.1*/
SELECT Company.Name, DATEPART(YEAR, Company.StartDate) AS YearOfCommencementOfOperation
FROM Company;
--2.2
SELECT DISTINCT DATEPART(YEAR, Company.StartDate) AS DistinctYearOfCommencementOfOperation
FROM Company;
--2.3
SELECT Company.*
FROM Company
WHERE DATEPART(YEAR, Company.StartDate) BETWEEN 2000 AND 2005
ORDER BY DATEPART(YEAR, Company.StartDate) ASC;
--2.4
SELECT Company.*
FROM Company
WHERE Company.Active = 1
AND DATEPART(MONTH, Company.StartDate) IN (1, 2);
--2.5
SELECT Company.*
FROM Company
WHERE DATEDIFF(YEAR, Company.StartDate, GETDATE()) > 20;
--2.6
SELECT Company.*
FROM Company
WHERE DATEPART(DAY, Company.StartDate) = 13
AND DATEPART(MONTH, Company.StartDate) = 5
AND DATENAME(WEEKDAY, Company.StartDate) = 'friday';
--2.7
SELECT Company.*
FROM Company
WHERE ISNULL(DATEPART(YEAR, Company.StartDate), 0) < 2000;
--2.8
SELECT Company.*, DATENAME(MONTH, Company.StartDate) AS MonthOfCommencementOfOperation
FROM Company
WHERE Company.StartDate IS NOT NULL
ORDER BY MonthOfCommencementOfOperation ASC;
--2.9
SELECT Company.*
FROM Company
WHERE DATEPART(YEAR, Company.StartDate) % 4 = 0
AND (DATEPART(YEAR, Company.StartDate) % 100 <> 0
OR DATEPART(YEAR, Company.StartDate) % 400 = 0);
--2.10
SELECT TOP(1) Company.*
FROM Company
WHERE Company.Active = 1
AND Company.StartDate IS NOT NULL
ORDER BY DATEDIFF(YEAR, Company.StartDate, GETDATE()) ASC;
--2.11
SELECT TOP(1) Company.*
FROM Company
WHERE Company.Active = 1
AND Company.StartDate IS NOT NULL
AND DATEDIFF(YEAR, Company.StartDate, GETDATE()) < 20
ORDER BY DATEDIFF(YEAR, Company.StartDate, GETDATE()) DESC;
--2.12
SELECT Company.Name, LEN(Company.Name) AS NumberOfLettersInName
FROM Company
WHERE LEN(Company.Name) >= 8;
--2.13
SELECT Company.*
FROM Company
WHERE LEFT(Company.Name, 1) = 'K';
--2.14
SELECT Company.Name, UPPER(LEFT(Company.Name, 3)) AS CompanysNameAbbreviation
FROM Company
WHERE DATEPART(MONTH, Company.StartDate) = 5;
--2.15
SELECT Company.Name, UPPER(RIGHT(Company.Name, 3)) AS CompanysNameAbbreviation
FROM Company;
--2.16
SELECT Company.Name, CONCAT(UPPER(Company.Street), ' ', LOWER(Company.Number)) AS Address
FROM Company;
--2.17
SELECT TOP(2) WITH TIES Company.Name, LEN(Company.Name) AS NumbersOfLettersInName
FROM Company
ORDER BY NumbersOfLettersInName DESC;
--2.18
SELECT DISTINCT LEN(Company.Name) AS DistinctNumbersOfLettersInName
FROM Company
ORDER BY DistinctNumbersOfLettersInName ASC;
--2.19
SELECT Company.Name
FROM Company
WHERE SUBSTRING(Company.Name, 3, 1) IN ('a', 'o', 'e', 'i');
/*Rozdzia³ 3. Z³¹czenia
Æwiczenia
3.1*/
SELECT Employee.FirstName, Employee.LastName, Department.Name
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id;
--3.2
SELECT Employee.FirstName, Employee.LastName, ISNULL(Department.Name, 'None') AS DepartmentsName
FROM Employee
LEFT OUTER JOIN Department ON Employee.DepartmentId = Department.Id;
--3.3
SELECT Employee.FirstName, Employee.LastName
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Department.Name = 'IT';
--3.4
SELECT Employee.FirstName, Employee.LastName, Department.Name
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Employee.Salary < 2000
AND LEN(Department.Name) = 2;
--3.5
SELECT TOP(1) Employee.FirstName, Employee.LastName, Employee.Salary, Department.Name
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
ORDER BY Employee.Salary DESC;
--3.6
SELECT DISTINCT Department.Name
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId;
--3.7
SELECT Department.Name, Employee.FirstName, Employee.LastName
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
ORDER BY Department.Name ASC;
--3.8
SELECT Department.Name, Employee.FirstName, Employee.LastName
FROM Department
LEFT OUTER JOIN Employee ON Department.ManagerId = Employee.Id;
--3.9
SELECT Department.Name, ISNULL(Employee.FirstName, 'No manager') AS DepartmentManagersFirstName, ISNULL(Employee.LastName, 'No manager') AS DepartmentManagersLastName
FROM Department
LEFT OUTER JOIN Employee ON Department.ManagerId = Employee.Id;
--3.10
SELECT Department.Name
FROM Department
LEFT OUTER JOIN Employee ON Department.ManagerId = Employee.Id
WHERE Employee.Id IS NULL;
--3.11
SELECT Department.Name
FROM Department
LEFT OUTER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Id IS NULL;
--3.12
SELECT Department.Name, City.Name
FROM Department
LEFT OUTER JOIN City ON Department.CityId = City.Id;
--3.13
SELECT Employee.FirstName, Employee.LastName, Department.Name, City.Name
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN City ON Department.CityId = City.Id;
--3.14
SELECT Employee.FirstName, Employee.LastName, Department.Name, City.Name
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN City ON Department.CityId = City.Id
WHERE LEFT(Employee.FirstName, 1) = 'J'
AND City.Name = 'Warsaw';
--3.15
SELECT Employee.*
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN City ON Department.CityId = City.Id
WHERE LEFT(Employee.FirstName, 1) = LEFT(City.Name, 1);
--3.16
SELECT Employee.*
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Employee.Id <> Department.ManagerId;
--3.17
SELECT Employee.*, DepartmentsManagers.FirstName, DepartmentsManagers.LastName
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN Employee AS DepartmentsManagers ON Department.ManagerId = DepartmentsManagers.Id;
--3.18
SELECT Employee.*
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN Employee AS DepartmentsManagers ON Department.ManagerId = DepartmentsManagers.Id
WHERE LEFT(Employee.FirstName, 1) = LEFT(DepartmentsManagers.FirstName, 1)
AND Employee.Id <> DepartmentsManagers.Id;
--3.19
SELECT Department.*, City.Name, Employee.FirstName, Employee.LastName, DepartmentsManagers.FirstName AS DepartmentManagersFirstName, DepartmentsManagers.LastName AS DepartmentManagersLastName
FROM Department
INNER JOIN City ON Department.CityId = City.Id
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
INNER JOIN Employee AS DepartmentsManagers ON Department.ManagerId = DepartmentsManagers.Id
ORDER BY Employee.LastName ASC;
--3.20
SELECT City.Name, Department.Name
FROM City
FULL OUTER JOIN Department ON City.Id = Department.CityId;
--3.21
SELECT Employee.FirstName, Employee.LastName
FROM Employee 
CROSS JOIN Employee AS EmployeeCrossJoinTable;
--3.22
SELECT City.Name, CityCrossJoinTable.Name
FROM City
CROSS JOIN City AS CityCrossJoinTable
WHERE City.Name <> CityCrossJoinTable.Name
AND City.Name < CityCrossJoinTable.Name
ORDER BY City.Name ASC, CityCrossJoinTable.Name ASC;
/*Zadania do samodzielnego wykonania
3.1*/
SELECT Orders.OrderNumber, Orders.OrderDate
FROM Orders
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
WHERE Employee.LastName = 'Brown';
--3.2
SELECT Orders.OrderNumber, Orders.OrderDate
FROM Orders
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
WHERE Employee.LastName = 'Brown'
AND DATEPART(YEAR, Orders.OrderDate) = 2015;
--3.3
SELECT Product.*, OrderDetails.Quantity
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE Orders.OrderNumber = 'Z/25/2015';
--3.4
SELECT Product.Name, OrderDetails.Quantity
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
AND DATEPART(MONTH, Orders.OrderDate) = 2;
--3.5
SELECT Product.*
FROM Product
INNER JOIN ProductCategory ON Product.CategoryId = ProductCategory.Id
WHERE ProductCategory.Name = 'Drive';
--3.6
SELECT Product.*
FROM Product
INNER JOIN ProductCategory ON Product.CategoryId = ProductCategory.Id
WHERE RIGHT(ProductCategory.Name, 1) = 'y';
--3.7
SELECT Product.*
FROM Product
INNER JOIN ProductCategory ON Product.CategoryId = ProductCategory.Id
WHERE Product.Name LIKE CONCAT('%', ProductCategory.Name, '%');
--3.8
SELECT Product.Name, OrderDetails.Quantity
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE DATEDIFF(MONTH, Orders.OrderDate, GETDATE()) <= 1;
--3.9
SELECT ProductCategory.Name
FROM ProductCategory
LEFT OUTER JOIN Product ON ProductCategory.Id = Product.CategoryId
WHERE Product.Id IS NULL;
--3.10
SELECT Product.Name
FROM Product
LEFT OUTER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
WHERE OrderDetails.Id IS NULL;
--3.11
SELECT TOP(1) Employee.FirstName, Employee.LastName, Orders.OrderTotal
FROM Employee
INNER JOIN Orders ON Employee.Id = Orders.EmployeeId
ORDER BY Orders.OrderTotal DESC;
--3.12
SELECT Orders.OrderNumber, Orders.OrderNumber, Orders.OrderDate, DATENAME(WEEKDAY, Orders.OrderDate) AS WeekDayOfOrderIssuing, UPPER(CONCAT(LEFT(Employee.FirstName, 3), LEFT(Employee.LastName, 3))) AS EmployeesCode
FROM Orders
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Department.Name = 'IT'
ORDER BY Orders.OrderDate ASC;
--3.13
SELECT Orders.OrderNumber, Orders.OrderDate
FROM Orders
LEFT OUTER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
WHERE OrderDetails.Id IS NULL;
--3.14
SELECT DISTINCT Product.*
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
INNER JOIN Employee ON Employee.Id = Orders.EmployeeId
WHERE Employee.SecondName IS NULL;
--3.15
SELECT Employee.FirstName, Employee.LastName, Employee.Salary, Orders.OrderTotal
FROM Employee
INNER JOIN Orders ON Employee.Id = Orders.EmployeeId
WHERE Orders.OrderTotal = Employee.Salary;
--3.16
SELECT Orders.*
FROM Orders
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
INNER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
WHERE OrderDetails.Quantity = DATEDIFF(YEAR, Employee.BirthDate, GETDATE());
--3.17
SELECT OrderDetails.Quantity, Employee.FirstName, Employee.LastName, DATEPART(MONTH, Orders.OrderDate) AS NumberOfTheMonth
FROM OrderDetails
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
WHERE OrderDetails.Quantity = DATEPART(MONTH, Orders.OrderDate);
--3.18
SELECT Product.Name, Product.Price, OrderDetails.UnitCost
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
WHERE OrderDetails.UnitCost < Product.Price;
/*Rozdzia³ 4. Funkcje agreguj¹ce
Æwiczenia
4.1*/
SELECT COUNT(Employee.Id) AS NumberOfEmployees
FROM Employee;
--4.2
SELECT COUNT(Employee.Id) AS NumberOfEmployeesWithoutASecondName
FROM Employee
WHERE Employee.SecondName IS NULL;
--4.3
SELECT COUNT(Employee.Id) AS NumberOfActiveEmployees
FROM Employee
WHERE Employee.Active = 1;
--4.4
SELECT COUNT(Employee.Id) AS NumberOfITDepartmentEmployees
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Department.Name = 'IT';
--4.5
SELECT COUNT(Employee.Id) AS NumberOfWarsawDepartmentEmployees
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN City ON Department.CityId = City.Id
WHERE City.Name = 'Warsaw';
--4.6
SELECT SUM(Employee.Salary) AS SumOfSalariesMontlyExpenses
FROM Employee
WHERE Employee.Active = 1;
--4.7
SELECT SUM(Employee.Salary) * 12 AS SumOfSalariesAnnualExpenses
FROM Employee
WHERE Employee.Active = 1;
--4.8
SELECT MIN(Employee.Salary) AS MinimalSalary
FROM Employee;
--4.9
SELECT MIN(LEN(Employee.FirstName)) AS NumberOfLettersInShortestEmployeesName
FROM Employee;
--4.10
SELECT SUM(DATEDIFF(YEAR, Employee.HireDate, GETDATE())) AS YearsOfSeniorityOfAllEmployees
FROM Employee
WHERE Employee.Active = 1;
--4.11
SELECT MAX(Employee.Salary) - MIN(Employee.Salary) AS SubstractionBetweenMaximalAndMinimalSalary
FROM Employee;
--4.12
SELECT AVG(Employee.Salary) AS AverageSalary, MIN(Employee.Salary) AS MinimalSalary, MAX(Employee.Salary) AS MaximalSalary
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Department.Name = 'IT';
--4.13
SELECT AVG(Employee.Salary) - MIN(Employee.Salary) AS GapBetweenAverageAndMinimalSalary
FROM Employee;
--4.14
SELECT AVG(DATEDIFF(YEAR, Employee.BirthDate, GETDATE())) AS EmployeesAverageAge
FROM Employee;
--4.15
SELECT AVG(DATEDIFF(MONTH, Employee.HireDate, Employee.RelieveDate)) AS AverageSeniorityInMonthsOfRelievedEmployees
FROM Employee
WHERE Employee.RelieveDate IS NOT NULL;
--4.16
SELECT MAX(Employee.BirthDate) AS MostRecentBirthDate
FROM Employee;
--4.17
SELECT DISTINCT Employee.Salary, COUNT(Employee.Id) AS NumberOfEmployeesWithACertainSalary
FROM Employee
GROUP BY Employee.Salary;
--4.18
SELECT DISTINCT Employee.Salary
FROM Employee;
--4.19
SELECT Department.Name, COUNT(Employee.Id) AS NumberOfEmployees
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
GROUP BY Department.Name;
--4.20
SELECT Department.Name, COUNT(Employee.Id) AS NumberOfEmployees
FROM Department
LEFT OUTER JOIN Employee ON Department.Id = Employee.DepartmentId
GROUP BY Department.Name;
--4.21
SELECT Department.Name, COUNT(Employee.Id) AS NumberOfEmployees
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Salary > 1500
GROUP BY Department.Name;
--4.22
SELECT Department.Name, AVG(Employee.Salary) AS AverageSalaray
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
GROUP BY Department.Name
ORDER BY Department.Name ASC;
--4.23
SELECT Department.Name, SUM(Employee.Salary) AS SumOfExpensesOnSalaries
FROM Department
LEFT OUTER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Active = 1
GROUP BY Department.Name;
--4.24
SELECT TOP(1) Department.Name
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
GROUP BY Department.Name
ORDER BY AVG(Employee.Salary) DESC;
--4.25
SELECT DATEPART(YEAR, Employee.BirthDate) AS YearOfBirth, COUNT(Employee.Id) AS NumberOfEmployeesBornInYear
FROM Employee
GROUP BY DATEPART(YEAR, Employee.BirthDate);
--4.26
SELECT LEFT(Employee.FirstName, 1) AS FirstLetterOfName, COUNT(Employee.Id) AS NumberOfOccurences
FROM Employee
WHERE Employee.Active = 1
GROUP BY LEFT(Employee.FirstName, 1);
--4.27
SELECT Department.Name, Employee.Gender, COUNT(Employee.Id) AS NumberOfEmployees
FROM Department
LEFT OUTER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Gender IS NOT NULL
GROUP BY Department.Name, Employee.Gender;
--4.28
SELECT Department.Name, AVG(Employee.Salary) AS AverageSalary, MAX(Employee.Salary) AS MaximalSalary, MIN(Employee.Salary) AS MinimalSalary
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
GROUP BY Department.Name;
--4.29
SELECT Managers.FirstName, Managers.LastName, AVG(Employee.Salary) AS AverageSalaryInDepartment, SUM(Employee.Salary) AS SumOfExpensesOnSalaries
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN Employee AS Managers ON Department.ManagerId = Managers.Id
WHERE Employee.Active = 1
GROUP BY Managers.FirstName, Managers.LastName;
--4.30
SELECT Department.Name, AVG(Employee.Salary) AS AverageSalaryAmongActiveEmployees
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Active = 1
GROUP BY Department.Name
HAVING AVG(Employee.Salary) > 1500
ORDER BY Department.Name;
--4.31
SELECT City.Name
FROM City
INNER JOIN Department ON City.Id = Department.CityId
GROUP BY City.Name
HAVING COUNT(Department.Id) > 1;
--4.32
SELECT Department.Name, AVG(DATEDIFF(YEAR, Employee.BirthDate, GETDATE())) AS AverageAge
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
WHERE Employee.Active = 1
GROUP BY Department.Name
HAVING AVG(DATEDIFF(YEAR, Employee.BirthDate, GETDATE())) > 27;
/*Zadania do samodzielnego wykonania
4.1*/
SELECT COUNT(Product.Id) AS NumberOfProducts
FROM Product;
--4.2
SELECT COUNT(Product.Id) AS NumberOfProductsWithPriceLowerThan100PLN
FROM Product
WHERE Product.Price < 100;
--4.3
SELECT COUNT(Orders.Id) AS NumberOfOrders
FROM Orders
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015;
--4.4
SELECT AVG(Product.Price) AS AveragePrice, MIN(Product.Price) AS MinimalPrice, MAX(Product.Price) AS MaximalPrice
FROM Product;
--4.5
SELECT AVG(Product.Price) AS AveragePrice
FROM Product
INNER JOIN ProductCategory ON Product.CategoryId = ProductCategory.Id
WHERE ProductCategory.Name = 'Drive';
--4.6
SELECT SUM(Orders.OrderTotal) AS SumOfOrders
FROM Orders
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
AND DATEPART(MONTH, Orders.OrderDate) = 2;
--4.7
SELECT SUM(Orders.OrderTotal) AS SumOfOrders
FROM Orders
INNER JOIN Employee ON Orders.EmployeeId = Employee.Id
WHERE Employee.Gender = 'W';
--4.8
SELECT ProductCategory.Name, COUNT(Product.Id) AS NumberOfProducts
FROM ProductCategory
LEFT OUTER JOIN Product ON ProductCategory.Id = Product.CategoryId
GROUP BY ProductCategory.Name;
--4.9
SELECT Employee.FirstName, Employee.LastName, SUM(Orders.OrderTotal) AS OrderTotal
FROM Employee
INNER JOIN Orders ON Employee.Id = Orders.EmployeeId
GROUP BY Employee.FirstName, Employee.LastName
HAVING SUM(Orders.OrderTotal) > 0;
--4.10
SELECT Employee.FirstName, Employee.LastName, SUM(Orders.OrderTotal) AS OrderTotal
FROM Employee
INNER JOIN Orders ON Employee.Id = Orders.EmployeeId
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
GROUP BY Employee.FirstName, Employee.LastName
HAVING SUM(Orders.OrderTotal) BETWEEN 2000 AND 3000;
--4.11
SELECT Product.Name, ISNULL(SUM(OrderDetails.Quantity), 0) AS NumberOfUnitsOrdered
FROM Product
LEFT OUTER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
GROUP BY Product.Name;
--4.12
SELECT Product.Name, MIN(Orders.OrderDate) AS MinimalOrderDate
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE Product.Id = OrderDetails.ProductId
GROUP BY Product.Name;
--4.13
SELECT Product.Name, COUNT(OrderDetails.Id) AS NumberOfUnitsOrdered
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
GROUP BY Product.Name;
--4.14
SELECT Product.Name, ISNULL(SUM(OrderDetails.Quantity), 0) AS NumberOfUnitsOrdered
FROM Product
LEFT OUTER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
LEFT OUTER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE ISNULL(DATEPART(YEAR, Orders.OrderDate), 2015) = 2015
GROUP BY Product.Name
HAVING ISNULL(SUM(OrderDetails.Quantity), 0) < 10;
--4.15
SELECT Orders.OrderNumber, COUNT(OrderDetails.ProductId) AS NumberOfUnitsInOrder
FROM Orders
LEFT OUTER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY Orders.OrderNumber;
--4.16
SELECT Orders.OrderNumber, ISNULL(SUM(OrderDetails.Quantity), 0) AS NumberOfUnitsInOrder
FROM Orders
LEFT OUTER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY Orders.OrderNumber;
--4.17
SELECT Orders.OrderNumber, ISNULL(AVG(OrderDetails.UnitCost), 0) AS NumberOfUnitsInOrder
FROM Orders
LEFT OUTER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY Orders.OrderNumber;
--4.18
SELECT DATEPART(YEAR, Orders.OrderDate) AS YearOfOrder, SUM(Orders.OrderTotal) AS ValueOfOrder
FROM Orders
INNER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY DATEPART(YEAR, Orders.OrderDate);
--4.19
SELECT DATEPART(MONTH, Orders.OrderDate) AS Month, SUM(Orders.OrderTotal) AS ValueOfOrder
FROM Orders
INNER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY DATEPART(MONTH, Orders.OrderDate);
--4.20
SELECT Employee.FirstName, Employee.LastName, DATEPART(YEAR, Orders.OrderDate) AS Year, SUM(Orders.OrderTotal) AS OrderValue
FROM Employee
INNER JOIN Orders ON Orders.EmployeeId = Employee.Id
INNER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
WHERE Employee.Active = 1
GROUP BY Employee.FirstName, Employee.LastName, DATEPART(YEAR, Orders.OrderDate)
--4.21
SELECT Orders.OrderNumber, Orders.OrderTotal, SUM(OrderDetails.Quantity * OrderDetails.UnitCost) AS RealCost
FROM Orders
INNER JOIN OrderDetails ON Orders.Id = OrderDetails.OrderId
GROUP BY Orders.OrderNumber, Orders.OrderTotal
HAVING Orders.OrderTotal <> SUM(OrderDetails.Quantity * OrderDetails.UnitCost);
--4.22
SELECT TOP(1) Employee.FirstName, Employee.LastName, SUM(Orders.OrderTotal) AS OrdersTotal
FROM Employee
INNER JOIN Orders ON Orders.EmployeeId = Employee.Id
GROUP BY Employee.FirstName, Employee.LastName
ORDER BY SUM(Orders.OrderTotal) DESC;
--4.23
SELECT TOP(1) Department.Name, Employee.FirstName, Employee.LastName, SUM(Orders.OrderTotal) AS OrdersTotal
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
INNER JOIN Orders ON Orders.EmployeeId = Employee.Id
GROUP BY Department.Name, Employee.FirstName, Employee.LastName
ORDER BY SUM(Orders.OrderTotal) DESC;
--4.24
SELECT ProductCategory.Name, SUM(OrderDetails.Quantity) AS NumberOfUnitsSold
FROM ProductCategory
INNER JOIN Product ON ProductCategory.Id = Product.CategoryId
INNER JOIN OrderDetails ON OrderDetails.ProductId = Product.Id
INNER JOIN Orders ON OrderDetails.OrderId = Orders.Id
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
GROUP BY ProductCategory.Name;
--4.25
SELECT Employee.FirstName, Employee.LastName, Employee.Salary, SUM(Orders.OrderTotal) AS OrderTotal
FROM Employee
INNER JOIN Orders ON Orders.EmployeeId = Employee.Id
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015
AND DATEPART(MONTH, Orders.OrderDate) = 5
GROUP BY Employee.FirstName, Employee.LastName, Employee.Salary
HAVING SUM(Orders.OrderTotal) > Employee.Salary;
--4.26
SELECT Managers.FirstName, Managers.LastName, ISNULL(SUM(Orders.OrderTotal), 0) AS OrdersTotal
FROM Employee AS Managers
INNER JOIN Department ON Managers.Id = Department.ManagerId
LEFT OUTER JOIN Employee ON Department.Id = Employee.DepartmentId
LEFT OUTER JOIN Orders ON Orders.EmployeeId = Employee.Id
GROUP BY Managers.FirstName, Managers.LastName;
--4.27
SELECT Department.Name, DATEPART(YEAR, Orders.OrderDate) AS Year, DATEPART(MONTH, Orders.OrderDate) AS Month, COUNT(Orders.Id) AS NumberOfOrders, SUM(OrderDetails.Quantity) AS VolumeOfSales, SUM(Orders.OrderTotal) AS OrderTotal
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
INNER JOIN Orders ON Orders.EmployeeId = Employee.Id
INNER JOIN OrderDetails ON OrderDetails.OrderId = Orders.Id
GROUP BY Department.Name, DATEPART(YEAR, Orders.OrderDate), DATEPART(MONTH, Orders.OrderDate)
ORDER BY Department.Name ASC, DATEPART(YEAR, Orders.OrderDate) ASC, DATEPART(MONTH, Orders.OrderDate) ASC;
--4.28
SELECT COUNT(Orders.Id) AS NumberOfOrders, DATENAME(WEEKDAY, Orders.OrderDate) AS WeekdayOfOrder, SUM(Orders.OrderTotal) AS OrderTotal
FROM Orders
GROUP BY DATENAME(WEEKDAY, Orders.OrderDate);
--4.29
SELECT TOP(50) PERCENT Product.Name, SUM(OrderDetails.Quantity) AS VolumeOfSales
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
GROUP BY Product.Name
ORDER BY SUM(OrderDetails.Quantity) DESC;
--4.30
SELECT Product.Name, SUM(OrderDetails.Quantity) AS VolumeOfSales
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
GROUP BY Product.Name
HAVING SUM(OrderDetails.Quantity) > 20;
--4.31
SELECT SUM(Product.Price - OrderDetails.UnitCost) AS Difference
FROM OrderDetails
INNER JOIN Product ON OrderDetails.ProductId = Product.Id
WHERE Product.Price > OrderDetails.UnitCost;
--4.32
SELECT SUM(OrderDetails.Quantity * OrderDetails.UnitCost) AS OrdersTotal, SUM(OrderDetails.Quantity * Product.Price) AS ProperOrdersTotal
FROM OrderDetails
INNER JOIN Product ON OrderDetails.ProductId = Product.Id;
/*Rozdzia³ 5. Operacje na zbiorach
Æwiczenia
5.1*/
SELECT Employee.*
FROM Employee
WHERE Employee.Salary NOT BETWEEN 1000 AND 2000;
--5.2
SELECT Employee.FirstName, Employee.LastName
FROM Employee
UNION ALL
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee;
--5.3
SELECT Employee.FirstName, Employee.LastName
FROM Employee
UNION ALL
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee
ORDER BY Employee.LastName ASC;
--5.4
SELECT Employee.FirstName, Employee.LastName
FROM Employee
UNION
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee;
--5.5
SELECT Employee.FirstName, Employee.LastName
FROM Employee
WHERE Employee.Active = 0
UNION
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee;
--5.6
SELECT 'NumberOfFemaleEmployees' AS NameOfColumn, COUNT(Employee.Id) AS NumerOfEmployees
FROM Employee
WHERE Employee.Gender = 'W'
UNION ALL
SELECT 'NumberOfMaleEmployees', COUNT(Employee.Id)
FROM Employee
WHERE Employee.Gender = 'M';
--5.7
SELECT Employee.*, 'Manager' AS Position
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Employee.Id = Department.ManagerId
AND Employee.DepartmentId = 1
UNION ALL
SELECT Employee.*, 'Employee'
FROM Employee
INNER JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Employee.Id <> Department.ManagerId
AND Employee.DepartmentId = 1;
--5.8
SELECT Employee.FirstName, Employee.LastName
FROM Employee
INTERSECT
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee;
--5.9
SELECT Department.Name
FROM Department
INNER JOIN Employee ON Department.Id = Employee.DepartmentId
INTERSECT
SELECT Department.Name
FROM Department
INNER JOIN FormerEmployee ON Department.Id = FormerEmployee.DepartmentId;
--5.10
SELECT FormerEmployee.FirstName, FormerEmployee.LastName
FROM FormerEmployee
EXCEPT
SELECT Employee.FirstName, Employee.LastName
FROM Employee;
--5.11
SELECT Department.Name
FROM Department
EXCEPT
SELECT Department.Name
FROM Department
INNER JOIN FormerEmployee ON Department.Id = FormerEmployee.DepartmentId;
/*Rozdzia³ 5. Operacje na zbiorach
Zadania do samodzielnego wykonania
5.1*/
SELECT 'Number of orders' AS Description, COUNT(Orders.Id) AS Value
FROM Orders
UNION ALL
SELECT 'Number of ordered goods', SUM(OrderDetails.Quantity)
FROM OrderDetails;
--5.2
SELECT Product.Name, 'Low price' AS Description
FROM Product
WHERE Product.Price < 100
UNION ALL
SELECT Product.Name, 'Middle price'
FROM Product
WHERE Product.Price BETWEEN 100 AND 500
UNION ALL
SELECT Product.Name, 'High price'
FROM Product
WHERE Product.Price > 500;
--5.3
SELECT Product.*
FROM Product
EXCEPT
SELECT Product.*
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId;
--5.4
SELECT Product.*
FROM Product
UNION ALL
SELECT ArchivedProduct.*
FROM ArchivedProduct
ORDER BY Product.Name ASC;
--5.5
SELECT Product.*
FROM Product
UNION
SELECT ArchivedProduct.*
FROM ArchivedProduct
ORDER BY Product.Name ASC;
--5.6
SELECT Product.*
FROM Product
INTERSECT
SELECT ArchivedProduct.*
FROM ArchivedProduct;
--5.7
SELECT ArchivedProduct.*
FROM ArchivedProduct
EXCEPT
SELECT Product.*
FROM Product;
--5.8
SELECT Product.*
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON Orders.Id = OrderDetails.OrderId
WHERE DATEPART(YEAR, Orders.OrderDate) = 2014
INTERSECT
SELECT Product.*
FROM Product
INNER JOIN OrderDetails ON Product.Id = OrderDetails.ProductId
INNER JOIN Orders ON Orders.Id = OrderDetails.OrderId
WHERE DATEPART(YEAR, Orders.OrderDate) = 2015;
--5.9
SELECT ProductCategory.*
FROM ProductCategory
EXCEPT
SELECT ProductCategory.*
FROM ProductCategory
INNER JOIN ArchivedProduct ON ProductCategory.Id = ArchivedProduct.CategoryId;
--5.10
SELECT ProductCategory.*
FROM ProductCategory
INTERSECT
SELECT ProductCategory.*
FROM ProductCategory
INNER JOIN ArchivedProduct ON ProductCategory.Id = ArchivedProduct.CategoryId;
/*Rozdzia³ 6. Podzapytania
Æwiczenia
6.1*/
SELECT Employee.*
FROM Employee
WHERE Employee.Salary = (
	SELECT MAX(Employee.Salary)
	FROM Employee);
--6.2
SELECT Employee.*
FROM Employee
WHERE Employee.Salary > (
	SELECT AVG(Employee.Salary)
	FROM Employee);
--6.3
SELECT Employee.*
FROM Employee
WHERE DATEDIFF(YEAR, Employee.BirthDate, GETDATE()) = (
	SELECT MIN(DATEDIFF(YEAR, Employee.BirthDate, GETDATE()))
	FROM Employee);
--6.4
SELECT Employee.*
FROM Employee
WHERE Employee.Salary + 200 = (
	SELECT DISTINCT Employee.Salary
	FROM Employee
	INNER JOIN Department ON Employee.Id = Department.ManagerId
	WHERE Employee.DepartmentId = 1);
--6.5
SELECT Employee.*, AverageSalary.AverageSalary - Employee.Salary AS DifferenceBetweenAverageSalaryAndEmployeesSalary
FROM Employee
CROSS JOIN (
	SELECT AVG(Employee.Salary) AS AverageSalary
	FROM Employee) AS AverageSalary
WHERE Employee.Salary < AverageSalary.AverageSalary;
--6.6
SELECT SUM(Ciphers.Ciphers) AS SumOfCiphersFrom1to3
FROM (
	SELECT 1 AS Ciphers
	UNION ALL
	SELECT 2
	UNION ALL
	SELECT 3) AS Ciphers;
--6.7
SELECT COUNT(Employee.Id) AS NumberOfPresentEmployees, (
	SELECT COUNT(FormerEmployee.Id)
	FROM FormerEmployee) AS NumberOfFormerEmployees
FROM Employee;
--6.8
SELECT Employee.FirstName, Employee.LastName, 'Salary lower than average salary.' AS Description
FROM Employee
WHERE Employee.Salary < (
	SELECT AVG(Employee.Salary)
	FROM Employee)
UNION ALL
SELECT Employee.FirstName, Employee.LastName, 'Salary equal to average salary.'
FROM Employee
WHERE Employee.Salary = (
	SELECT AVG(Employee.Salary)
	FROM Employee)
UNION ALL
SELECT Employee.FirstName, Employee.LastName, 'Salary higher than average salary.'
FROM Employee
WHERE Employee.Salary > (
	SELECT AVG(Employee.Salary)
	FROM Employee);
--6.9
SELECT SUM(NumberOfActiveAndFormerEmployees.Value) AS NumberOfActiveAndFormerEmployees
FROM (SELECT COUNT(Employee.Id) AS Value
FROM Employee
UNION ALL
SELECT COUNT(FormerEmployee.Id)
FROM FormerEmployee) AS NumberOfActiveAndFormerEmployees;
--6.10
SELECT MAX(LEN(FemaleNames.FemaleName)) AS NumberOfLettersInALongestFemaleName
FROM (
	SELECT 'Magdalena' AS FemaleName
	UNION ALL
	SELECT 'Katarzyna'
	UNION ALL
	SELECT 'Agnieszka') AS FemaleNames;
--6.11
SELECT Employee.FirstName
FROM Employee
WHERE LEN(Employee.FirstName) = (
	SELECT MAX(LEN(Employee.FirstName))
	FROM Employee);
--6.12
SELECT Employee.FirstName, Employee.LastName, 'Female' AS Gender
FROM Employee
WHERE Employee.Gender = 'W'
UNION ALL
SELECT Employee.FirstName, Employee.LastName, 'Male' AS Gender
FROM Employee
WHERE Employee.Gender = 'M';
--6.13
SELECT Employee.FirstName, Employee.LastName, Employee.Salary
FROM Employee
INNER JOIN (
	SELECT Employee.DepartmentId, AVG(Employee.Salary) AS AverageSalary
	FROM Employee
	GROUP BY Employee.DepartmentId) AS AverageSalariesInDepartments ON Employee.DepartmentId = AverageSalariesInDepartments.DepartmentId
WHERE Employee.Salary < AverageSalariesInDepartments.AverageSalary;
--6.14
SELECT OutterSelect.FirstName, OutterSelect.LastName, (
	SELECT AVG(Employee.Salary) AS AverageSalary
	FROM Employee
	WHERE Employee.DepartmentId = OutterSelect.DepartmentId) AS AverageSalaryInDepartment
FROM Employee AS OutterSelect;
--6.15
SELECT OutterSelect.FirstName, OutterSelect.LastName, (
	SELECT COUNT(Employee.Id)
	FROM Employee
	WHERE Employee.Gender = OutterSelect.Gender) AS NumberOfEmployeesOfSameGender
FROM Employee AS OutterSelect;
--6.16
SELECT Managers.FirstName, Managers.LastName, Managers.Salary / (
	SELECT SUM(Employee.Salary)
	FROM Employee
	WHERE Managers.DepartmentId = Employee.DepartmentId) * 100 AS PercentageShareOfManagersSalaryInDepartmentsSalaryExpenses
FROM Employee AS Managers
INNER JOIN Department ON Managers.Id = Department.ManagerId;
--6.17
SELECT Employee.*
FROM Employee
WHERE Employee.Id NOT IN (
	SELECT Department.ManagerId
	FROM Department);
/*Rozdzia³ 6. Podzapytania
Zadania do samodzielnego wykonania
6.1*/
SELECT Product.*
FROM Product
WHERE Product.Price > (
	SELECT AVG(Product.Price)
	FROM Product);
--6.2
SELECT Product.*, Product.Price - (
	SELECT AVG(Product.Price)
	FROM Product) AS DifferenceBetweenProductsPriceAndAveragePrice
FROM Product;
--6.3
SELECT OutterSelect.*
FROM Product AS OutterSelect
WHERE OutterSelect.Price > (
	SELECT AVG(Product.Price)
	FROM Product
	WHERE Product.CategoryId = OutterSelect.CategoryId);
--6.4
SELECT Orders.OrderNumber
FROM Orders
WHERE Orders.OrderTotal = (
	SELECT MAX(Orders.OrderTotal)
	FROM Orders);
--6.5
SELECT (
	SELECT COUNT(OrderDetails.ProductId)
	FROM OrderDetails) / COUNT(Orders.Id) AS AverageNumberOfPositionsPerOrder
FROM Orders;
--6.6
SELECT 'Small orders' AS Description, COUNT(Orders.Id) AS NumberOfOrders
FROM Orders
WHERE Orders.OrderTotal <= 1000
UNION ALL
SELECT 'Small orders', COUNT(Orders.Id)
FROM Orders
WHERE Orders.OrderTotal BETWEEN 1001 AND 1499
UNION ALL
SELECT 'Large orders', COUNT(Orders.Id)
FROM Orders
WHERE Orders.OrderTotal > 1500;
--6.7
SELECT Orders.*
FROM Orders
INNER JOIN (SELECT OrderDetails.OrderId, SUM(OrderDetails.Quantity * OrderDetails.UnitCost) AS Value
	FROM OrderDetails
	GROUP BY OrderDetails.OrderId) AS RealOrdersValue ON RealOrdersValue.OrderId = Orders.Id
WHERE Orders.OrderTotal <> RealOrdersValue.Value;
--6.8
SELECT Orders.*
FROM Orders
WHERE DATEPART(MONTH, Orders.OrderDate) = (
	SELECT COUNT(OrderDetails.ProductId)
	FROM OrderDetails
	WHERE Orders.Id = OrderDetails.OrderId);
--6.9
SELECT Product.*, (
	SELECT ProductCategory.Name
	FROM ProductCategory
	WHERE ProductCategory.Id = Product.CategoryId) AS ProductCategoryName, (
	)
FROM Product;
--6.10
SELECT 
FROM ;
--6.11
SELECT 
FROM ;
--6.12
SELECT 
FROM ;
--6.13
SELECT 
FROM ;
--6.14
SELECT 
FROM ;
--6.15
SELECT 
FROM ;
--6.16
SELECT 
FROM ;
--6.17
SELECT 
FROM ;
--6.18
SELECT 
FROM ;
/*Rozdzia³ 7. CASE, CAST i CONVERT
Æwiczenia
7.1*/
SELECT 
FROM ;
--7.2
SELECT 
FROM ;
--7.3
SELECT 
FROM ;
--7.4
SELECT 
FROM ;
--7.5
SELECT 
FROM ;
--7.6
SELECT 
FROM ;
--7.7
SELECT 
FROM ;
/*Rozdzia³ 7. CASE, CAST i CONVERT
Zadania do samodzielnego wykonania
7.1*/
SELECT 
FROM ;
--7.2
SELECT 
FROM ;
--7.3
SELECT 
FROM ;
--7.4
SELECT 
FROM ;
--7.5
SELECT 
FROM ;
--7.6
SELECT 
FROM ;
/*Rozdzia³ 8. Zadania
Zadania do samodzielnego wykonania
8.1*/
SELECT 
FROM ;
--8.2
SELECT 
FROM ;
--8.3
SELECT 
FROM ;
--8.4
SELECT 
FROM ;
--8.5
SELECT 
FROM ;
--8.6
SELECT 
FROM ;
--8.7
SELECT 
FROM ;
--8.8
SELECT 
FROM ;
--8.9
SELECT 
FROM ;
--8.10
SELECT 
FROM ;
--8.11
SELECT 
FROM ;
--8.12
SELECT 
FROM ;
--8.13
SELECT 
FROM ;
--8.14
SELECT 
FROM ;
--8.15
SELECT 
FROM ;
--8.16
SELECT 
FROM ;
--8.17
SELECT 
FROM ;
--8.18
SELECT 
FROM ;
--8.19
SELECT 
FROM ;
--8.20
SELECT 
FROM ;
--8.21
SELECT 
FROM ;
--8.22
SELECT 
FROM ;
--8.23
SELECT 
FROM ;
--8.24
SELECT 
FROM ;
--8.25
SELECT 
FROM ;
--8.26
SELECT 
FROM ;
--8.27
SELECT 
FROM ;
--8.28
SELECT 
FROM ;
--8.29
SELECT 
FROM ;
--8.30
SELECT 
FROM ;
--8.31
SELECT 
FROM ;
--8.32
SELECT 
FROM ;
--8.33
SELECT 
FROM ;
--8.34
SELECT 
FROM ;
--8.35
SELECT 
FROM ;
--8.36
SELECT 
FROM ;
--8.37
SELECT 
FROM ;
--8.38
SELECT 
FROM ;
--8.39
SELECT 
FROM ;
--8.40
SELECT 
FROM ;
--8.41
SELECT 
FROM ;
--8.42
SELECT 
FROM ;
--8.43
SELECT 
FROM ;
--8.44
SELECT 
FROM ;
--8.45
SELECT 
FROM ;
--8.46
SELECT 
FROM ;
--8.47
SELECT 
FROM ;
--8.48
SELECT 
FROM ;
--8.49
SELECT 
FROM ;
--8.50
SELECT 
FROM ;
--8.51
SELECT 
FROM ;
--8.52
SELECT 
FROM ;
--8.53
SELECT 
FROM ;
--8.54
SELECT 
FROM ;
--8.55
SELECT 
FROM ;
--8.56
SELECT 
FROM ;
--8.57
SELECT 
FROM ;
--8.58
SELECT 
FROM ;
--8.59
SELECT 
FROM ;
--8.60
SELECT 
FROM ;
--8.61
SELECT 
FROM ;
--8.62
SELECT 
FROM ;
--8.63
SELECT 
FROM ;
--8.64
SELECT 
FROM ;
--8.65
SELECT 
FROM ;
--8.66
SELECT 
FROM ;
--8.67
SELECT 
FROM ;
--8.68
SELECT 
FROM ;
--8.69
SELECT 
FROM ;
--8.70
SELECT 
FROM ;
--8.71
SELECT 
FROM ;
--8.72
SELECT 
FROM ;
--8.73
SELECT 
FROM ;
--8.74
SELECT 
FROM ;
--8.75
SELECT 
FROM ;
--8.76
SELECT 
FROM ;
--8.77
SELECT 
FROM ;
--8.78
SELECT 
FROM ;
--8.79
SELECT 
FROM ;
CREATE TABLE EmployeeInfo(
	EmpID SERIAL PRIMARY KEY,
	EmpFname VARCHAR(10) NOT NULL,
	EmpLname VARCHAR(10) NOT NULL,
	Department VARCHAR(10) NOT NULL,
	Project VARCHAR(5) NOT NULL,
	Address VARCHAR(30),
	DOB DATE DEFAULT CURRENT_TIMESTAMP,
	Gender CHAR(1)
);

INSERT INTO 
	EmployeeInfo (EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
VALUES
	('Sanjay','Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
	('Ananya','Mishra','Admin','P2','Delhi(DEL)','02/05/1968','F'),
	('Rohan','Diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
	('Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
	('Ankit','Kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

CREATE TABLE EmployeePosition(
	EmpID INT PRIMARY KEY,
	EmpPosition VARCHAR(10) NOT NULL,
	DateOfJoining DATE DEFAULT CURRENT_TIMESTAMP,
	Salary INT NOT NULL,
	FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);

INSERT INTO
	EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary)
VALUES
	(1, 'Manager', '01/05/2022', 500000),
	(2, 'Executive', '02/05/2022', 75000),
	(3, 'Manager', '01/05/2022', 90000),
	(4, 'Lead', '02/05/2022', 85000),
	(5, 'Executive', '01/05/2022', 300000);

--  Q-1 Write a query to fetch the number of employees working in the department ‘Admin’.

SELECT
	COUNT(EmpID) AS "Admin-Count"
FROM
	EmployeeInfo
WHERE
	Department = 'Admin';

--  Q-2 Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT
	SUBSTR(EmpLname,1,4) AS "First-4-empL"
FROM
	EmployeeInfo;

--  Q-3 Write a query to find all the employees whose salary is between 50000 to 100000.

SELECT
	EmployeeInfo.EmpFname
FROM
	EmployeeInfo
	JOIN EmployeePosition ON EmployeeInfo.EmpID = EmployeePosition.EmpID
WHERE
	EmployeePosition.Salary BETWEEN 50000
	AND 100000;

--  Q-4 Write a query to find the names of employees that begin with ‘S’.

SELECT
	EmpFname
FROM
	EmployeeInfo
WHERE
	EmpFname LIKE ('S%');

--  Q-5 Write a query to fetch top N records order by salary. (ex. top 5 records)

SELECT
	*.EmployeeInfo
FROM
	EmployeeInfo
	JOIN EmployeePosition ON EmployeeInfo.EmpID = EmployeePosition.EmpID
ORDER BY
	SALARY DESC
LIMIT
	2;

--  Q-6 Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT
	*
FROM
	EmployeeInfo
WHERE
	EmpFname NOT IN ('Sanjay', 'Sonia');

--  Q-7 Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT
	Department,
	COUNT(EmpFname) AS "Count"
FROM
	EmployeeInfo
GROUP BY
	Department
ORDER BY
	COUNT(EmpFname) DESC;

--  Q-8 Create indexing for any particular field and show the difference in data fetching before and after indexing.

CREATE INDEX idx_EmpLname ON EmployeeInfo(EmpLname);
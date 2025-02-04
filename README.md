## SQL Database Assignment
This Task involves creating and applying queries on an EMPLOYEE database with two tables: `EmployeeInfo` and `EmployeePosition`.

### DataBase Structure

### Tables:

1. **EmployeeInfo**
   - EmpID (Primary Key)
   - EmpFname
   - EmpLname
   - Department
   - Project
   - Address
   - DOB
   - Gender

2. **EmployeePosition**
   - EmpID (Foreign Key ref to EmployeeInfo(EmpID))
   - EmpPosition
   - DateOfJoining
   - Salary

## Setting up Database with Tables & dummy data

1. **Create DataBase**

```sql 
    CREATE DATABASE EMPLOYEE; 
```

2. **Create Table**

```sql
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

CREATE TABLE EmployeePosition(
	EmpID INT PRIMARY KEY,
	EmpPosition VARCHAR(10) NOT NULL,
	DateOfJoining DATE DEFAULT CURRENT_TIMESTAMP,
	Salary INT NOT NULL,
	FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);
```

3. **Insert Data**
```sql
INSERT INTO 
	EmployeeInfo (EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
VALUES
	('Sanjay','Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
	('Ananya','Mishra','Admin','P2','Delhi(DEL)','02/05/1968','F'),
	('Rohan','Diwan','Account','P3','Mumbai(BOM)','01/01/1980','M'),
	('Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','02/05/1992','F'),
	('Ankit','Kapoor','Admin','P2','Delhi(DEL)','03/07/1994','M');

INSERT INTO
	EmployeePosition (EmpID, EmpPosition, DateOfJoining, Salary)
VALUES
	(1, 'Manager', '01/05/2022', 500000),
	(2, 'Executive', '02/05/2022', 75000),
	(3, 'Manager', '01/05/2022', 90000),
	(4, 'Lead', '02/05/2022', 85000),
	(5, 'Executive', '01/05/2022', 300000);
```

## SQL Queries

**Q-1 Write a query to fetch the number of employees working in the department ‘Admin’.**

Query:
```sql
SELECT COUNT(EmpID) AS "Admin-Count"
FROM EmployeeInfo
WHERE Department = 'Admin';
```
Result:

![Image](https://github.com/user-attachments/assets/b3dc0095-02fb-4445-8ecf-92fa711a5048)

**Q-2 Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.**

Query:
```sql
SELECT SUBSTR(EmpLname,1,4) AS "First-4-empL"
FROM EmployeeInfo;
```
Result:

![Image](https://github.com/user-attachments/assets/5b3c2e66-a22e-4add-b996-4bc6567fd8c5)

**Q-3 Write a query to find all the employees whose salary is between 50000 to 100000.**

Query:
```sql
SELECT EmployeeInfo.EmpFname
FROM EmployeeInfo JOIN EmployeePosition 
ON EmployeeInfo.EmpID = EmployeePosition.EmpID
WHERE EmployeePosition.Salary BETWEEN 50000 AND 100000;
```
Result:

![Image](https://github.com/user-attachments/assets/876ebd45-c7f8-480c-924f-3334b00bb8af)

**Q-4 Write a query to find the names of employees that begin with ‘S’.**

Query:
```sql
SELECT EmpFname
FROM EmployeeInfo
WHERE EmpFname LIKE ('S%');
```
Result:

![Image](https://github.com/user-attachments/assets/af8d5088-e221-49fb-b511-ec743ea13d35)

**Q-5 Write a query to fetch top N records order by salary. (ex. top 5 records)**

Query:
```sql
SELECT *
FROM EmployeeInfo JOIN EmployeePosition 
ON EmployeeInfo.EmpID = EmployeePosition.EmpID
ORDER BY SALARY DESC
LIMIT 2;
```
Result:

![Image](https://github.com/user-attachments/assets/c54be1a6-10c6-4eaa-86d2-0ed815d2c2aa)

**Q-6 Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.**

Query:
```sql
SELECT *
FROM EmployeeInfo
WHERE EmpFname NOT IN ('Sanjay', 'Sonia');
```
Result:

![Image](https://github.com/user-attachments/assets/4f2b6b79-b730-4f80-898a-11eb19ea7bb4)

**Q-7 Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.**

Query:
```sql
SELECT Department, COUNT(EmpFname) AS "Count"
FROM EmployeeInfo
GROUP BY Department
ORDER BY COUNT(EmpFname) DESC;
```
Result:

![Image](https://github.com/user-attachments/assets/ff3fee0d-e328-4b6a-8b13-a3ea4dfa82d9)

**Q-8 Create indexing for any particular field and show the difference in data fetching before and after indexing.**

Query:
```sql
CREATE INDEX idx_EmpLname ON EmployeeInfo(EmpLname);
```
Improvement:

![Image](https://github.com/user-attachments/assets/d6a6a50e-93a6-4efa-9fa5-b263318672d3)

![Image](https://github.com/user-attachments/assets/b4191db7-e2f6-4c14-99d0-838162638559)

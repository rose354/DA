CREATE DATABASE MARKETCO;
USE MARKETCO;

CREATE TABLE Company(
company_id int AUTO_INCREMENT PRIMARY KEY,
company_name varchar(50),
city varchar (50),
state varchar (50),
zip varchar (50));



INSERT INTO Company (company_name, City, State, zip)
VALUES ('Urban Outfitters, Inc', 'Amreli', 'Gujarat', 'India');


-- (1) Statement to create the contact table.

create table contact(
contactID int auto_increment primary key,
companyID int,
firstname varchar(45),
lastname varchar(45),
street varchar(45),
city varchar(45),
state varchar(0),
zip varchar(10),
Ismain boolean,
email varchar(45),
phone varchar(12) );



-- (2) statement to create the employee table.

create table employee(
employeeID int,
firstname varchar(45),
lastname varchar(45),
salary decimal(10,2),
hiredate date,
jobtitle varchar(25),
email varchar(45),
phone int (12));

insert into employee
value

(1,'ROSHNI','VERMA',20000,'2023-04-23','DATA ANALYSIS',
'vermaroshni230@gmail.com',215-555-8800),
(2,'Megha','',45000,'2025-03-25','Data analysis','rabarimeghanagmail.com', 738-350-6274);


-- (3) statement to create the contactEmployee table
drop table contactemployee;
create table contactemployee(
contactEmployeeID int auto_increment primary key,
contactID int not null,
employeeID int not null,
contactDate date,
Description varchar(100)
);



-- (4) In the Employee table, the statement that changes Lesley Bland’s phone number 
-- to 215-555-8800.

use marketco;

UPDATE employee 
SET phone = '215-555-8800' 
WHERE firstname='lesley'and lastname='bland';

-- 5) In the company table the statement that changes the name of "urban outfitters,inc."to urban outfitters.
UPDATE Company
SET Company_Name = 'Urban Outfitters'
WHERE Company_Name = 'Urban Outfitters, Inc.';


-- (6)In contactEmployee table, table the statement that removes dianne connor's contact event with jack l

DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');

-- (7) Write the SQL SELECT query that displays the names of the employees that
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in
-- MySQL Workbench. Copy the results below as well.


SELECT DISTINCT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON ContactEmployee.ContactID = Contact.ContactID
JOIN Company ON Contact.CompanyID = Company.Company_id
WHERE Company.Company_Name = 'Toll Brothers';

-- (8) What is the significance of “%” and “_” operators in the LIKE statement?

 -- > % is a wildcard that matches any sequence of characters
-- > _is a wildcard that matches exactly one character.
-- like statement
SELECT * FROM Employee WHERE FirstName LIKE 'J%'; -- Matches names starting with 'J'
SELECT * FROM Employee WHERE FirstName LIKE '_a_'; -- Matches names with 'a' as the second letter and any third character.

-- (9) Explain normalization in the context of databases. 

--> Normalization is the process of structuring a database to reduce redundancy and improve data integrity
--> by dividing large tables into smaller related ones. It follows normal forms (1NF, 2NF, 3NF, etc.),
--> each addressing specific issues like atomicity, partial dependencies, and transitive dependencies. 
 --> This helps maintain consistency, optimize storage, and enhance query performance.
 
 -- (10) What does a join in MySQL mean?
--> In MySQL, a JOIN combines rows from two or more tables based on a related column.
Main Types of JOINs:
INNER JOIN – Returns matching rows from both tables.
LEFT JOIN – Returns all rows from the left table and matching rows from the right.
RIGHT JOIN – Returns all rows from the right table and matching rows from the left.
CROSS JOIN – Returns the Cartesian product of both tables.

-- (11) 19.What do you understand about DDL, DCL, and DML in MySQL?
DDL, DML, and DCL in MySQL

✅ DDL (Data Definition Language) → Defines database structure.
CREATE, ALTER, DROP, TRUNCATE
✅ DML (Data Manipulation Language) → Manages table data.

INSERT, UPDATE, DELETE, SELECT
✅ DCL (Data Control Language) → Controls access/permissions.


-- (12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins? 

MySQL JOIN Clause
Role: Combines rows from multiple tables based on a common column.
Common Types of JOINs:
1 INNER JOIN – Returns matching rows from both tables.
2 LEFT JOIN – Returns all rows from the left table + matching right table rows.
3 RIGHT JOIN – Returns all rows from the right table + matching left table rows.
4 CROSS JOIN – Returns the Cartesian product of both tables.
 




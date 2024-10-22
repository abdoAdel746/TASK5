--1.Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE DATABASE CINEMA
USE CINEMA
CREATE SCHEMA SCEHMA1
CREATE TABLE SCEHMA1.Employees(
 ID INTEGER,
 Name VARCHAR(50),
 Salary DECIMAL(10,3)
);

--2.Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE SCEHMA1.Employees
ADD Department VARCHAR(50);

--3.Remove the "Salary" column from the "Employees" table.
ALTER TABLE SCEHMA1.Employees
DROP COLUMN Salary;

--4.Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'SCEHMA1.Employees.Department', 'DeptName';

--5.Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE SCEHMA1.Projects(
 ProjectID INTEGER PRIMARY KEY,
 ProjectName VARCHAR(50),
);
--6.Add a primary key constraint to the "Employees" table for the "ID" column
ALTER TABLE SCEHMA1.Employees 
ADD CONSTRAINT Employees_ID_Key PRIMARY KEY (ID)

--7.Create a foreign key relationship between the "Employees" table (referencing "ID") 
--and the "Projects" table (referencing "ProjectID").
ALTER TABLE SCEHMA1.Employees
ADD CONSTRAINT Employees_FK FOREIGN KEY (ID) REFERENCES SCEHMA1.Projects(ProjectID)

--8.Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE SCEHMA1.Employees
DROP CONSTRAINT Employees_FK

--9.Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE SCEHMA1.Employees 
ADD CONSTRAINT unique_name UNIQUE (Name)

--10.Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), 
--and Email (varchar), and Status (varchar).
CREATE SCHEMA SCEHMA2
CREATE TABLE SCEHMA2.Customers(
 CustomerID INTEGER,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Email VARCHAR(50),
 Status VARCHAR(50),
);
--11.Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE SCEHMA2.Customers 
ADD CONSTRAINT unique_name UNIQUE (FirstName,LastName)
--12.Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should
--be applied when a new record is inserted.
ALTER TABLE SCEHMA2.Customers
ADD CONSTRAINT Default_status DEFAULT 'Active' FOR Status

--13.Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and 
--TotalAmount (decimal).
CREATE TABLE SCEHMA2.Orders(
 OrderID INTEGER,
 CustomerID integer,
 OrderDate datetime,
 TotalAmount decimal(10,2),
);

--14.Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE SCEHMA2.Orders 
ADD CONSTRAINT check_greater_zero 
CHECK ( TotalAmount> 0);

--15.Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales
ALTER SCHEMA Sales 
TRANSFER SCEHMA2.Orders;

--16.Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders';


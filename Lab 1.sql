use datamining;
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_name) VALUES ('Sales');
INSERT INTO Departments (department_name) VALUES ('Marketing');
INSERT INTO Departments (department_name) VALUES ('HR');

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('John', 'Doe', '2023-01-15', 1);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Jane', 'Smith', '2022-05-22', 2);

INSERT INTO Employees (first_name, last_name, hire_date, department_id)
VALUES ('Michael', 'Johnson', '2021-09-10', 3);

SELECT * FROM Departments;
SELECT * FROM Employees;

-- 1.	Retrieve the first_name and last_name of all customers from the customer table where the store_id is 1.

SELECT first_name, last_name 
FROM Employees 
WHERE department_id = 1;

-- 2.	Select the first_name, last_name, and email of customers whose last name starts with the letter 'S'.


SELECT first_name, last_name
FROM Employees
WHERE last_name LIKE 's%';

select first_name,last_name,hire_date
from employees
where hire_date>"2023-01-01"

-- find the Earliest Hire Date Across All Employees:
select MIN(hire_date) AS earliest_hire_date
FROM Employees;

-- count the number of employees in each department:
select department_id, COUNT(*) as num_employee
from employees
group by department_id;


-- Group customers into segments based on their purchase frequency, such as high, medium, and low frequency customers. 
use retailshop;
 
 WITH CustomerPurchaseFrequency AS (
    -- Step 1: Calculate the number of distinct purchases for each customer
    SELECT 
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS PurchaseFrequency
    FROM 
        retailshop
    GROUP BY 
        CustomerID
);
	



create database try;
use try;

create TABLE employees(
employee_id int auto_increment primary key,name varchar(100),
position varchar(100),salary decimal(10,2),hire_date DATE );

create table employee_audit(
audit_id int auto_increment  primary key,
employee_id int,
name varchar(100),
position varchar(100),
salary decimal(10,2),
hire_date DATE,
action_date timestamp DEFAULT current_timestamp );

INSERT INTO employees (name, position, salary, hire_date) 
VALUES 
    ('John Doe', 'Software Engineer', 80000.00, '2022-01-15'),
    ('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
    ('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01');
    
    
DELIMITER $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, name, position, salary, hire_date)
    VALUES (NEW.Employee_id, NEW.name, NEW.position, NEW.salary, NEW.hire_date);
END $$

DELIMITER ;

INSERT INTO employees (name, position, salary, hire_date) 
VALUES ('Meena rathod', 'soft engineer', 70000.00, '2024-02-10');


    
    

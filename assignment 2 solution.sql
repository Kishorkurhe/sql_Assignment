create database employees;
use  employees

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employee (employee_id, first_name, last_name, department, salary)
VALUES
    (1, 'John', 'Doe', 'HR', 50000),
    (2, 'Jane', 'Smith', 'IT', 60000),
    (3, 'Michael', 'Johnson', 'Finance', 55000),
    (4, 'Emily', 'Williams', 'Marketing', 48000),
    (5, 'Daniel', 'Brown', 'HR', 52000),
    (6, 'Sophia', 'Miller', 'IT', 70000),
    (7, 'Matthew', 'Davis', 'Finance', 60000),
    (8, 'Olivia', 'Jones', 'Marketing', 55000),
    (9, 'James', 'Garcia', 'IT', 65000),
    (10, 'Ava', 'Martinez', 'HR', 48000);
    
     select * from employee;
    
    SELECT * FROM employee
     WHERE salary > 30000;
     
CREATE TABLE students (
    student_id INT ,
    name VARCHAR(255),
    marks INT
);

insert into students
 (student_id, name, marks)
VALUES
    (1, 'John Doe', 45),
    (2, 'Jane Smith', 55),
    (3, 'Michael Johnson', 65),
    (4, 'Emily Williams', 85),
    (5, 'Daniel Brown', 75),
    (6, 'Sophia Miller', 95),
    (7, 'Matthew Davis', 50),
    (8, 'Olivia Jones', 78),
    (9, 'James Garcia', 88),
    (10, 'Ava Martinez', 60);
    
    select * from students;

SELECT COUNT(*) AS first_class_count
FROM students
WHERE marks >= 50 AND marks < 60
or
marks >= 60 and marks < 80;

select count(*) as distincation_count
from students
where marks >= 80 and marks < 100;

CREATE TABLE station (
    id INT ,
    city VARCHAR(255)
);

INSERT INTO station (id, city)
VALUES
    (1, 'pune'),
    (2, 'jalna'),
    (3, 'sambajinagar'),
    (4, 'mumbai'),
    (5, 'nashik'),
    (6, 'nagar'),
    (7, 'nanded'),
    (8, 'parbhani'),
    (9, 'beed'),
    (10, 'Aurangabad');
    
   UPDATE station
SET city = 'Pune'
WHERE id = 1;

UPDATE station
SET city = 'Jalna'
WHERE id = 2;

UPDATE station
SET city = 'Sambajinagar'
WHERE id = 3;

UPDATE station
SET city = 'Mumbai'
WHERE id = 4;

UPDATE station
SET city = 'Nashik'
WHERE id = 5;

UPDATE station
SET city = 'Nagar'
WHERE id = 6;

UPDATE station
SET city = 'Nanded'
WHERE id = 7;

UPDATE station
SET city = 'Parbhani'
WHERE id = 8;

UPDATE station
SET city = 'Beed'
WHERE id = 9;

UPDATE station
SET city = 'Aurangabad'
WHERE id = 10;

select * from station;

select * from station;
-- 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
select distinct city
from station
where id % 2 = 0;

-- 4
SELECT COUNT(city) - COUNT(DISTINCT city) AS difference
FROM station;

-- left
select distinct city
from station
where lower(left( city ,1) in ('a','e','i','o','u'));

-- right
select distinct city
from station
where lower(right( city ,1) in ('a','e','i','o','u'));

-- c
select distinct city
from station
where lower(right( city ,1) in ('a','e','i','o','u'))
and lower (left(city , 1) in ('a','e','i','o','u'));

-- d
select distinct city
from station
where lower(right( city ,1) not in ('a','e','i','o','u'))
 and lower (left(city , 1) not in ('a','e','i','o','u'));
 
 select distinct salary
 from employee
 where salary >2000;

-- 6
SELECT first_name
FROM employee
WHERE salary > 2000 
ORDER BY salary DESC;

select * from employee;
select * from station;


alter table station
add column population int;

SET SQL_SAFE_UPDATES = 0;

UPDATE station
SET population = CASE
    WHEN id = 1 THEN 12000
    WHEN id = 2 THEN 20000
    WHEN id = 3 THEN 8000
    WHEN id = 4 THEN 71000
    WHEN id = 5 THEN 5000
    WHEN id = 6 THEN 45000
    WHEN id = 7 THEN 12000
    WHEN id = 8 THEN 14000
    WHEN id = 9 THEN 1000
    ELSE NULL 
END;


-- 9
select sum(population) as Total_population
from station
where city ='pune';

select avg(population) as avg_population
from station ;







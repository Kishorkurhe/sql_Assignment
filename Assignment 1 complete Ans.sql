-- 1. create a database called 'assignment' (Note please do the assignment tasks in this database)
	create database assignment;
    
-- 2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it.
use assignment

-- 3. Create a table called countries with the following columns [name, population, capital ];

 create table countries
 
 -- a) Insert the following data into the table
 

create table countries
(
Country varchar(50),
Population int,
Capital varchar(50)
);

insert into countries
(country,population,capital)
values
('China' 		,	1382	, 	'Beijing'),
('India	'	,	1326	 ,	'Delhi'),
('United States' ,324	 ,	'Washington D.C.'),
('Indonesia	',	260	 ,	'Jakarta'),
('Brazil	'	,	209	 ,	'Brasilia'),
('Pakistan'	,	193	 ,	'Islamabad'),
('Nigeria	',	187,	' Abuja'),
('Bangladesh'	,	163	 	,'Dhaka'),
('Russia	'	,	143	 	,'Moscow'),
('Mexico	'	,	128	 	,'Mexico City'),
('Japan		',	126	 	,'Tokyo'),
('Philippines',	102	 ,	'Manila'),
('Ethiopia	',	101	 	,'Addis_Ababa'),
('Egypt		',	93	 ,	'Cairo'),
('Germany	',	81	 ,	'Berlin'),
('Iran	'	,	80	 ,	'Tehran'),
('Turkey'		,	79	 ,	'Ankara'),
('Congo	'	,	79	 ,	'Kinshasa'),
('France'		,	64	 ,	'Paris'),
('United_Kingdom',65   ,	' London'),
('Italy	',		60	 ,	'Rome'),
('South Africa'	,	55	 ,	'Pretoria'),
('Myanmar'	,	54	 ,	'Naypyidaw');

desc countries;
select * from countries;

-- b) Add a couple of countries of your choice
insert into countries
(country,population,capital)
values
('USA',100,'UK'),
('Delhi',504,' ');
select * from countries;

-- c) Change ‘Delhi' to ‘New Delhi'

SET SQL_SAFE_UPDATES = 0;

update countries
set capital = 'New Delhi'
where country = 'india';

UPDATE countries
SET capital = REPLACE(capital, 'Delhi', 'New Delhi')
WHERE country = 'India';

update countries set Capital='New Delhi' where country='India';
update countries set Capital='New Delhi' where Population=1326;
select * from countries;

-- 4. Rename the table countries to big_countries 

rename table countries to Big_countries;
select * from Big_countries;

-- 5. Create the following tables. Use auto increment wherever applicable

create table products
(
product_id int,
product_name varchar(50),
supplier_id int
);

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE Stock (
    id int ,
    product_id int(255),
    balance_stock int(255)
);

-- 6. Enter some records into the three tables.
insert into products
( product_id, product_name,supplier_id)
values
(101,'redmi note 7',9921),
(102,'samsung',9922);

insert into suppliers
( supplier_id, supplier_name,location)
values
(10,'kishor','pune'),
(11,'Royal','mumbai');

insert into stock
(id,product_id,balance_stock)
values
(1001,7276,34);

select * from stock;

-- 7. Modify the supplier table to make supplier name unique and not null.
 ALTER TABLE Suppliers
MODIFY COLUMN supplier_name VARCHAR(255) NOT NULL UNIQUE;

select * from suppliers;

-- 8
-- -- a. Add a column called deptno
ALTER TABLE suppliers
ADD COLUMN deptno INT;

select * from suppliers;

-- b. Set the value of deptno based on specified conditions
UPDATE suppliers
SET deptno = 
    IF(supplier_id % 2 = 0, 20,
       IF(supplier_id % 3 = 0, 30,
          IF(supplier_id % 4 = 0, 40,
             IF(supplier_id % 5 = 0, 50, 10)
          )
       )
    );
    
    select * from suppliers;
    
    -- 9. Create a unique index on the emp_id column.

CREATE UNIQUE INDEX idx_supplier_id ON suppliers (supplier_id);

-- 10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.

ALTER TABLE suppliers
ADD COLUMN salary INT;


insert into suppliers
(salary)
values
(5000);

select * from suppliers;

-- Update salary for existing records
UPDATE suppliers
SET salary = 50000
WHERE supplier_id = 10;

UPDATE suppliers
SET salary = 7000
WHERE supplier_id = 11;

select * from suppliers;


--  10 .Insert new record with salary
INSERT INTO suppliers (supplier_id, supplier_name, location, salary)
VALUES (1001, 'John', 'Doe', 60000);


select * from suppliers;

--drop  table xx_regions2595;
--drop  table xx_countries2595;
--drop  table xx_locations2595;
--drop  table xx_jobs2595;
--drop  table xx_departments2595;
--drop  table xx_employees2595;
--drop  table xx_dependents2595;


CREATE TABLE regions2595 (
	region_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	region_name VARCHAR2 (25) DEFAULT NULL
);

CREATE TABLE countries2595 (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR2 (40) DEFAULT NULL,
	region_id NUMBER NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions2595 (region_id) ON DELETE CASCADE
);

CREATE TABLE locations2595 (
	location_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	street_address VARCHAR2 (40) DEFAULT NULL,
	postal_code VARCHAR2 (12) DEFAULT NULL,
	city VARCHAR2 (30) NOT NULL,
	state_province VARCHAR2 (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries2595 (country_id) ON DELETE CASCADE
);

CREATE TABLE jobs2595 (
	job_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	job_title VARCHAR2 (35) NOT NULL,
	min_salary NUMBER (8, 2) DEFAULT NULL,
	max_salary NUMBER (8, 2) DEFAULT NULL
);

CREATE TABLE departments2595 (
	department_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	department_name VARCHAR2 (30) NOT NULL,
	location_id NUMBER DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations2595 (location_id) ON DELETE CASCADE
);

CREATE TABLE employees2595 (
	employee_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2 (20) DEFAULT NULL,
	last_name VARCHAR2 (25) NOT NULL,
	email VARCHAR2 (100) NOT NULL,
	phone_number VARCHAR2 (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id NUMBER NOT NULL,
	salary NUMBER (8, 2) NOT NULL,
	manager_id NUMBER DEFAULT NULL,
	department_id NUMBER DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs2595 (job_id) ON DELETE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments2595 (department_id) ON DELETE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees2595 (employee_id)
);

CREATE TABLE dependents2595 (
	dependent_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2 (50) NOT NULL,
	last_name VARCHAR2 (50) NOT NULL,
	relationship VARCHAR2 (25) NOT NULL,
	employee_id NUMBER NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees2595 (employee_id) ON DELETE CASCADE
);

--=====================================================================================================================================
--data insertion here
--=====================================================================================================================================

INSERT INTO regions2595(region_id,region_name) VALUES (1,'India');
INSERT INTO regions2595(region_id,region_name) VALUES (2,'America');
INSERT INTO regions2595(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions2595(region_id,region_name) VALUES (4,'Middle East and Africa');

INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries2595(country_id,country_name,region_id) VALUES ('IT','Italy',1);

INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations2595(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs2595(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);

 
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments2595(department_id,department_name,location_id) VALUES (11,'Accounting',1700);

INSERT INTO employees2595(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (100,'Saran','raj','raj.king@yopmail.com','5151234',DATE '1987-06-17',1,24000.00,NULL,1);

INSERT INTO employees2595(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (102,'Nithin','Ram','nithin@yopmail.com','8936878',DATE '2000-10-17',2,67000.00,NULL,2);

INSERT INTO employees2595(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (104,'Tharun','raja','raj.tharun@yopmail.com','4672087',DATE '1996-04-16',3,7900.00,NULL,3);

INSERT INTO dependents2595(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'raja','kumar','Child',206);
INSERT INTO dependents2595(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'saravanan','Ganesh','Child',205);
INSERT INTO dependents2595(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Eswar','Varun','Child',200);

select * from departments2595;
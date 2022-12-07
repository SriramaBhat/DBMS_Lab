CREATE DATABASE IF NOT EXISTS company_160;
USE company_160;

CREATE TABLE IF NOT EXISTS department (
    dno INTEGER NOT NULL,
    dname VARCHAR(50) NOT NULL,
    mgrssn VARCHAR(25) NOT NULL,
    mgrstartdate DATE NOT NULL,
    PRIMARY KEY(dno)
);

CREATE TABLE IF NOT EXISTS employee (
    ssn VARCHAR(20) NOT NULL,
    ename VARCHAR(50) NOT NULL,
    addrees TEXT NOT NULL,
    sex VARCHAR(10) NOT NULL,
    salary INTEGER NOT NULL,
    superssn VARCHAR(30) NOT NULL,
    dno INTEGER NOT NULL,
    PRIMARY KEY(ssn),
    FOREIGN KEY(dno) REFERENCES department(dno)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dlocation (
    dno INTEGER NOT NULL,
    dloc TEXT,
    FOREIGN KEY(dno) REFERENCES department(dno)
    ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS project (
    pno INTEGER NOT NULL,
    pname VARCHAR(50),
    ploc TEXT NOT NULL,
    dno INTEGER NOT NULL,
    PRIMARY KEY(pno)
);

CREATE TABLE IF NOT EXISTS works_on (
    ssn VARCHAR(25) NOT NULL,
    pno INTEGER,
    hour INTEGER NOT NULL,
    FOREIGN KEY(pno) REFERENCES project(pno)
    ON DELETE CASCADE
);

INSERT INTO department VALUES
(001, "Human Resources", "473DS322", "2020-10-21"),
(002, "Quality Assesment", "473DS584", "2020-10-19"),
(003, "Technical", "473DS635", "2020-10-20"),
(004, "Quality Control", "473DS684", "2020-10-18"),
(005, "R & D", "473DS475", "2020-10-17");

INSERT INTO employee VALUES
("01NB235", "Employee_1","Siddartha Nagar, Mysuru", "Male", 1500000, "2001BD05", 5),
("01NB354", "Employee_2", "Lakshmipuram, Mysuru", "Female", 1200000,"2001BD08", 2),
("02NB254", "Employee_3", "Pune, Maharashtra", "Male", 1000000,"2002BD04", 4),
("03NB653", "Employee_4", "Hyderabad, Telangana", "Male", 2500000, "2003BD10", 5),
("04NB234", "Employee_5", "JP Nagar, Bengaluru", "Female", 1700000, "2004BD01", 1);

INSERT INTO dlocation VALUES
(001, "Jaynagar, Bengaluru"),
(002, "Vijaynagar, Mysuru"),
(003, "Chennai, Tamil Nadu"),
(004, "Mumbai, Maharashtra"),
(005, "Kuvempunagar, Mysuru");

INSERT INTO project VALUES
(241563, "System Testing", "Mumbai, Maharashtra", 004),
(532678, "Cost Mangement", "JP Nagar, Bengaluru", 001),
(453723, "Product Optimization", "Hyderabad, Telangana", 005),
(278345, "Yeild Increase", "Kuvempunagar, Mysuru", 005),
(426784, "Product Refinement", "Saraswatipuram, Mysuru", 002);

INSERT INTO works_on VALUES
("01NB235", 278345, 5),
("01NB354", 426784, 6),
("04NB234", 532678, 3),
("02NB254", 241563, 3),
("03NB653", 453723, 6);

ALTER TABLE dlocation MODIFY dloc TEXT NOT NULL;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY(dno) REFERENCES department(dno) ON DELETE CASCADE;

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM dlocation;
SELECT * FROM project;
SELECT * FROM works_on;

UPDATE works_on SET hour = 6 WHERE ssn = "01NB235";
DELETE FROM department WHERE dno = 002;

SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM dlocation;
SELECT * FROM project;
SELECT * FROM works_on;

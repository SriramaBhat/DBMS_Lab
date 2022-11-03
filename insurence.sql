/* Creating an insurence database with five tables */
CREATE DATABASE IF NOT EXISTS insurence_160;
USE insurence_160;
CREATE TABLE IF NOT EXISTS person (
driver_id TEXT NOT NULL,
driver_name TEXT NOT NULL,
address TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car (
reg_no TEXT NOT NULL,
model TEXT NOT NULL,
c_year INTEGER
);

CREATE TABLE IF NOT EXISTS accident (
report_no INTEGER NOT NULL,
accident_date DATE,
location TEXT
);

CREATE TABLE IF NOT EXISTS owns (
driver_id TEXT NOT NULL,
reg_no TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS participated (
driver_id TEXT NOT NULL,
reg_no TEXT NOT NULL,
report_no INTEGER NOT NULL,
damage_amount INTEGER NOT NULL
);

INSERT INTO person VALUES
("D111", "Driver_1", "Kuvempunagar, Mysuru"),
("D222", "Driver_2", "JP Nagar, Mysuru"),
("D333", "Driver_3", "Udaygiri, Mysuru"),
("D444", "Driver_4", "Rajivnagar, Mysuru"),
("D555", "Driver_5", "Lakshmipuram, Mysuru");

INSERT INTO car VALUES
("KA-20-AB-4223", "Swift", 2020),
("KA-20-BC-5674", "WagonR", 2017),
("KA-21-AC-5473", "Alto", 2015),
("KA-21-BD-4728", "Triber", 2019),
("KA-19-CA-6374", "Tiago", 2018);

INSERT INTO accident VALUES
(43627, 2020-04-05, "Nazarbad, Mysuru"),
(56345, 2019-12-16, "Gokulam, Mysuru"),
(63744, 2020-05-14, "Vijaynagar Stage 2, Mysuru"),
(54634, 2019-08-30, "Kuvempunagar, Mysuru"),
(65738, 2021-01-21, "JSS Layout, Mysuru");

INSERT INTO owns VALUES
("D111", "KA-20-AB-4223"),
("D222", "KA-20-BC-5674"),
("D333", "KA-21-AC-5473"),
("D444", "KA-21-BD-4728"),
("D555", "KA-19-CA-6374");

INSERT INTO participated VALUES
("D111", "KA-20-AB-4223", 43627, 20000),
("D222", "KA-20-BC-5674", 56345, 10000),
("D333", "KA-21-AC-5473", 63744, 15000),
("D444", "KA-21-BD-4728", 54634, 5000),
("D333", "KA-21-AC-5473", 65738, 25000);

ALTER TABLE participated MODIFY damage_amount INTEGER;
ALTER TABLE accident MODIFY location TEXT NOT NULL;
ALTER TABLE accident MODIFY accident_date DATE NOT NULL;

SELECT * FROM person;
SELECT * FROM car;
SELECT * FROM accident;
SELECT * FROM owns;
SELECT * FROM participated;

UPDATE participated SET damage_amount = 21500 WHERE driver_id = "D444";

DELETE FROM person WHERE driver_id = "D555";
DELETE FROM car WHERE reg_no = "KA-19-CA-6374";
DELETE FROM owns WHERE driver_id = "D555";

SELECT * FROM person;
SELECT * FROM car;
SELECT * FROM accident;
SELECT * FROM owns;
SELECT * FROM participated;

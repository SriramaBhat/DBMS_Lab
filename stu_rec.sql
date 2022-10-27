-- Create a table for the structure Student with attributes as SID, NAME, 
-- BRANCH, SEMESTER, ADDRESS, PHONE, EMAIL, Insert atleast 10 
-- tuples and performthe following operationsusing SQL.
-- a. Insert a new student
-- b. Modify the address of the student based on SID
-- c. Delete a student
-- d. List all the students
-- e. List all the students of CSE branch.
-- f. List all the students of CSE branch and reside in Kuvempunagar

/* Create a database to store student records */
CREATE DATABASE IF NOT EXISTS students;

/* Changing database */
USE students;

/* Create table to store records with required fields */
CREATE TABLE IF NOT EXISTS student_rec (
    Student_ID TEXT NOT NULL,
    Student_name TEXT NOT NULL,
    Branch TEXT NOT NULL,
    SEMESTER INTEGER NOT NULL,
    Student_Address TEXT NOT NULL,
    Phone_Number TEXT,
    Email TEXT
);

/* Add 5 students */
INSERT INTO student_rec VALUES
("01JST20CS160", "Srirama", "CSE", 5, "Shaktinagar, Mysuru", "9148466270", "sriramarbhat@gmail.com"),
("01JST20EC154", "Test_1", "ECE", 3, "Siddarthanagar, Mysuru", "8743587342", "test_1@gmail.com"),
("01JST20EE144", "Test_2", "EEE", 1, "Lakshmipuram, Mysuru", "4878466270", "test_2@gmail.com"),
("01JST20CS163", "Test_3", "CSE", 5, "Kuvempunagar, Mysuru", "5648746583", "test_3@gmail.com"),
("01JST20IS134", "Test_4", "ISE", 3, "Kuvempunagar, Mysuru", "4738924456", "test_4@gmail.com");

/* List all students */
SELECT * FROM student_rec;

/* Add single student */
INSERT INTO student_rec VALUES
("01JST20CS263", "Test_5", "CSE", 3, "Kuvempunagar, Mysuru", "5475674536", "test_5@gmail.com");

SELECT * FROM student_rec;

UPDATE student_rec SET Student_Address = "Saraswatipuram, Mysuru" WHERE Student_ID = "01JST20EE144";

SELECT * FROM student_rec;

/* Delete a student */
DELETE FROM student_rec WHERE Student_ID = "01JST20EC154";

SELECT * FROM student_rec;

COMMIT;

SELECT * FROM student_rec WHERE Branch = "CSE";

SELECT * FROM student_rec WHERE Branch = "CSE" AND Student_Address LIKE "%Kuvempunagar%";

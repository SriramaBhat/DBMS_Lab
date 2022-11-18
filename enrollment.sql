CREATE DATABASE IF NOT EXISTS enrollment_160;
USE enrollment_160;
CREATE TABLE IF NOT EXISTS student (
    regno VARCHAR(20) NOT NULL,
    sname VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    bdate DATE,
    PRIMARY KEY(regno)
);

CREATE TABLE IF NOT EXISTS course (
    course INTEGER NOT NULL,
    cname VARCHAR(50) NOT NULL,
    dept VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS enroll (
    regno VARCHAR(20),
    course INTEGER NOT NULL,
    sem INTEGER,
    marks INTEGER,
    FOREIGN KEY(regno) REFERENCES student(regno)
    ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS book_adoption (
    course INTEGER,
    sem INTEGER,
    bookISBN INTEGER NOT NULL,
    FOREIGN KEY(bookISBN) REFERENCES text_book(bookISBN)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS text_book (
    bookISBN INTEGER NOT NULL,
    book_title VARCHAR(50),
    publisher VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    PRIMARY KEY(bookISBN)
);

INSERT INTO student VALUES
("01HF235", "Student_1", "Computer Engineering", "2001-05-15"),
("01HF354", "Student_2", "Literature", "2002-06-10"),
("01HF254", "Student_3", "Philosophy", "2000-04-04"),
("01HF653", "Student_4", "History", "2003-10-12"),
("01HF234", "Student_5", "Economics", "2001-10-10");

INSERT INTO course VALUES
(001, "Computer Engineering", "CS"),
(002, "Literature", "English"),
(003, "Philosophy", "Philosphy"),
(004, "History", "Social Science"),
(005, "Economics", "Social Science");

INSERT INTO enroll VALUES
("01HF235", 001, 5, 85),
("01HF354", 002, 6, 87),
("01HF254", 003, 3, 95),
("01HF653", 004, 3, 80),
("01HF234", 005, 5, 75);

INSERT INTO book_adoption VALUES
(001, 5, 241563),
(002, 6, 532678),
(003, 3, 453723),
(004, 3, 278345),
(001, 6, 426784);

INSERT INTO text_book VALUES
(241563, "Operating Systems", "McGraw Hill", "Silberschatz"),
(532678, "Complete Works of Shakesphere", "Oxford", "Shakesphere"),
(453723, "Immanuel Kant", "Delphi Classics", "Immanuel Kant"),
(278345, "History of the world", "The Times", "Richard Overy"),
(426784, "Behavioural Economics", "Hot Science", "David Orrel");

ALTER TABLE enroll MODIFY regno VARCHAR(20) NOT NULL;
ALTER TABLE text_book MODIFY book_title VARCHAR(50) NOT NULL;
ALTER TABLE student MODIFY bdate DATE NOT NULL;
ALTER TABLE course ADD CONSTRAINT PRIMARY KEY(course);
ALTER TABLE enroll ADD CONSTRAINT FOREIGN KEY(course) REFERNCES course(course);
ALTER TABLE book_adoption ADD CONSTRAINT FOREIGN KEY(course) REFERNCES course(course);

INSERT INTO text_book VALUES (567385, "Principles of Cryptography", "McGraw Hill", "Silberschatz");
UPDATE book_adoption SET bookISBN = 567385 WHERE course = 5;
DELETE FROM text_book WHERE bookISBN = 241563;

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM enroll;
SELECT * FROM book_adoption;
SELECT * FROM text_book;

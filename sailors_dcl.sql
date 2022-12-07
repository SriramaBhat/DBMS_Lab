USE sailors_160;

INSERT INTO sailors VALUES
("S777", "Sailor_7", 2, 25),
("S888", "Sailor_8", 4, 26);

INSERT INTO boat VALUES
("B777", "The Small Boat", "Blue"),
("B888", "The Large Boat", "Pink");

INSERT INTO rservers VALUES
("S777", "B888", "2021-10-05"),
("S888", "B777", "2021-05-09");

SELECT * FROM boat WHERE bname LIKE "%Boat%";
SELECT * FROM sailors WHERE age BETWEEN 26 AND 30;

SELECT sailors.sname, boat.bname, rservers.s_date FROM sailors
INNER JOIN rservers ON sailors.sid = rservers.sid
INNER JOIN boat ON rservers.bid = boat.bid
WHERE rating = (SELECT MIN(rating) FROM sailors);

SELECT color, COUNT(bid) FROM boat GROUP BY color HAVING COUNT(bid) >= 1 ORDER BY COUNT(bid) DESC;

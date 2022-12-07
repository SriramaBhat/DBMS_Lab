USE insurence_160;

SELECT person.driver_name, car.model FROM person
INNER JOIN owns ON person.driver_id = owns.driver_id
INNER JOIN car ON owns.reg_no = car.reg_no;

SELECT accident.report_no, accident.accident_rate, accident.location,
person.driver_name, car.model, participated.damage_amount FROM participated
INNER JOIN person ON participated.driver_id = person.driver_id
INNER JOIN car ON participated.reg_no =  car.reg_no
INNER JOIN accident ON participated.report_no = accident.report_no
ORDER BY participated.damage_amount;

SELECT accident.report_no, accident.accident_rate, accident.location,
person.driver_name, car.model, participated.damage_amount FROM participated
INNER JOIN person ON participated.driver_id = person.driver_id
INNER JOIN car ON participated.reg_no =  car.reg_no
INNER JOIN accident ON participated.report_no = accident.report_no
WHERE accident.accident_date BETWEEN "2020-01-01" AND "2021-12-12"
ORDER BY participated.damage_amount;

SELECT accident.report_no, accident.accident_rate, accident.location,
person.driver_name, car.model, participated.damage_amount FROM participated
INNER JOIN person ON participated.driver_id = person.driver_id
INNER JOIN car ON participated.reg_no =  car.reg_no
INNER JOIN accident ON participated.report_no = accident.report_no
WHERE car.model LIKE "%Swift%"
ORDER BY participated.damage_amount;

SELECT car.model, COUNT(participated.report_no) FROM participated
INNER JOIN car ON participated.reg_no =  car.reg_no
GROUP BY car.model HAVING COUNT(participated.report_no) >= 2
ORDER BY participated.damage_amount;

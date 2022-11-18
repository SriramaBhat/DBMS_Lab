CREATE DATABASE IF NOT EXISTS customer_160;
USE customer_160;
CREATE TABLE IF NOT EXISTS customer (
    cust INTEGER NOT NULL,
    cname VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    PRIMARY KEY(cust)
);

CREATE TABLE IF NOT EXISTS orders (
    oid INTEGER NOT NULL,
    odate DATE NOT NULL,
    cust INTEGER,
    order_amt INTEGER,
    PRIMARY KEY(oid),
    FOREIGN KEY(cust) REFERENCES customer(cust) 
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS order_item (
    orders INTEGER NOT NULL,
    item INTEGER,
    qty INTEGER,
    FOREIGN KEY(orders) REFERENCES orders(oid)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS item (
    itemid INTEGER NOT NULL,
    unitprice INTEGER NOT NULL,
    PRIMARY KEY(itemid)
);

CREATE TABLE IF NOT EXISTS shipment (
    orders INTEGER NOT NULL,
    warehouse INTEGER,
    ship_date DATE NOT NULL,
    FOREIGN KEY(orders) REFERENCES orders(oid)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS warehouse (
    warehouseid INTEGER NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customer VALUES
(0001, "Customer_1", "Mysuru"),
(0002, "Customer_2", "Bengaluru"),
(0003, "Customer_3", "Mumbai"),
(0004, "Customer_4", "Dehli"),
(0005, "Customer_5", "Bengaluru");

INSERT INTO orders VALUES
(001, "2020-01-14", 0001, 2000),
(002, "2021-04-13", 0002, 500),
(003, "2019-10-02", 0005, 2500),
(004, "2019-05-12", 0003, 1000),
(005, "2020-12-23", 0004, 1200);

INSERT INTO item VALUES
(0001, 400),
(0002, 200),
(0003, 1000),
(0004, 100),
(0005, 500);

INSERT INTO warehouse VALUES
(0001, "Mysuru"),
(0002, "Bengaluru"),
(0003, "Mumbai"),
(0004, "Dehli"),
(0005, "Chennai");

INSERT INTO order_item VALUES 
(001, 0001, 5),
(002, 0005, 1),
(003, 0005, 5),
(004, 0003, 1),
(005, 0004, 12);

INSERT INTO shipment VALUES
(001, 0002, "2020-01-16"),
(002, 0001, "2021-04-14"),
(003, 0004, "2019-10-07"),
(004, 0003, "2019-05-16"),
(005, 0005, "2020-12-23");

ALTER TABLE orders MODIFY cust INTEGER NOT NULL;
ALTER TABLE order_item MODIFY item INTEGER NOT NULL;
ALTER TABLE shipment MODIFY warehouse INTEGER NOT NULL;
ALTER TABLE order_item ADD CONSTRAINT FOREIGN KEY(item) REFERENCES item(itemid);
ALTER TABLE warehouse ADD CONSTRAINT PRIMARY KEY(warehouseid);
ALTER TABLE shipment ADD CONSTRAINT FOREIGN KEY(warehouse) REFERENCES warehouse(warehouseid);

UPDATE orders SET order_amt = 600 WHERE orderid = 002;
UPDATE order_item SET item = 0002 WHERE orders = 002;
UPDATE order_item SET qty = 3 WHERE orders = 002;
DELETE FROM warehouse WHERE warehouseid = 0004;

SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM order_item;
SELECT * FROM item;
SELECT * FROM shipment;
SELECT * FROM warehouse;

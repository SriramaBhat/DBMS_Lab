USE customer_160;

SELECT item, COUNT(orders) FROM order_item
GROUP BY item HAVING COUNT(orders) >= 1;

SELECT * FROM item ORDER BY unitprice;

SELECT * FROM customer WHERE city LIKE "%Mysuru%";

SELECT customer.cname, orders.order_amt, orders.odate FROM orders
INNER JOIN customer ON orders.cust = customer.cust
WHERE orders.order_amt BETWEEN 500 AND 2000
ORDER BY orders.odate;

SELECT customer.cname, orders.order_amt, orders.odate FROM orders
INNER JOIN customer ON orders.cust = customer.cust
WHERE orders.order_amt = (SELECT MIN(order_amt) FROM orders);

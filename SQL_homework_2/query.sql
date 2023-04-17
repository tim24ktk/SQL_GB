USE seminar_1;

CREATE TABLE sales (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  count_product INT
);

INSERT INTO sales (`order_date`, `count_product`)
VALUES 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341)


SELECT id,
	   order_date,
       CASE
		   WHEN count_product < 100 THEN 'Маленький заказ'
           WHEN count_product >= 100 AND count_product <= 300 THEN 'Средний заказ'
           ELSE 'Большой заказ'
	   END AS order_type
 FROM sales


CREATE TABLE orders (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  employee_id VARCHAR (11) NOT NULL,
  amount FLOAT NOT NULL,
  order_status VARCHAR (20) NOT NULL
);

INSERT INTO orders (`employee_id`, `amount`, `order_status`)
VALUES 
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

SELECT id,
	   employee_id,
       amount,
       CASE
			WHEN order_status = 'OPEN' THEN 'Order is in open state'
            WHEN order_status = 'CLOSED' THEN 'Order is closed'
            WHEN order_status = 'CANCELLED' THEN 'Order is canselled'
	   END AS full_order_status
FROM orders;
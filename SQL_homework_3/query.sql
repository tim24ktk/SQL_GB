# Создаем БД
CREATE DATABASE seminar_3;

# указывам какую БД использовать при запросах
USE seminar_3;

# Создаем необходимые таблицы
CREATE TABLE salespeople (
	snum INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sname VARCHAR (30) NOT NULL,
    city VARCHAR (20) NOT NULL
);

CREATE TABLE customers (
	cnum INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cname VARCHAR (30) NOT NULL,
    city VARCHAR (20) NOT NULL,
    rating INT,
    snum INT
);

CREATE TABLE orders (
	onum INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    amt FLOAT NOT NULL,
    odate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cnum INT,
    snum INT
);

# Заполняем таблицы данными
INSERT INTO salespeople (snum, sname, city)
VALUES 
		(1001, 'Peel', 'London'),
    (1002, 'Serres', 'San Jose'),
    (1004, 'Motika', 'London'),
    (1007, 'Rifkin', 'Barcelona'),
    (1003, 'Axelrod', 'New York');
    
INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES 
		(2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJose', 200, 1003),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
		(2008, 'Cisneros', 'SanJose', 300, 1007),
		(2007, 'Pereira', 'Rome', 100, 1004);
        
INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES 
		(3001, 18.69, '1990-03-10', 2008, 1007),
    (3003, 769.19, '1990-03-10', 2001, 1001),
    (3002, 1900.10, '1990-03-10', 2007, 1004),
    (3005, 5160.45, '1990-03-10', 2003, 1002),
    (3006, 1098.16, '1990-03-10', 2008, 1007),
		(3009, 1713.23, '1990-04-10', 2002, 1003),
		(3007, 75.75, '1990-04-10', 2004, 1002),
		(3008, 4723.00, '1990-05-10', 2006, 1001),
		(3010, 1309.95, '1990-06-10', 2004, 1002),
		(3011, 9891.88, '1990-06-10', 2006, 1001);


# Запросы

# 1. 
SELECT city,
    cname,
      snum,
      rating
FROM customers;

# 2.
SELECT 
	   cname,
       rating
FROM customers
WHERE city = 'SanJose';

# 3.
SELECT 
	   DISTINCT snum
FROM orders;

# 4.
SELECT 
	   *
FROM customers
WHERE cname LIKE 'G%';

# 5.
SELECT 
	   *
FROM orders
WHERE amt > 1000;

# 6.
SELECT 
	   amt
FROM orders
ORDER BY amt ASC
LIMIT 1;

# 7.
SELECT 
	   *
FROM customers
WHERE rating > 100 AND
	  city NOT IN ('Rome');

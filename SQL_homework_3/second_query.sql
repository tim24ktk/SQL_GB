# используем ту же БД

USE seminar_3;

# создаем таблицу users

CREATE TABLE users (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR (30) NOT NULL,
  surname VARCHAR (20) NOT NULL,
  speciality VARCHAR (20) NOT NULL,
  seniority INT,
  salary INT,
  age INT
);

# заполняем таблицу данными
INSERT INTO users (name, surname, speciality, seniority, salary, age)
VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
	('Петя', 'Петькин', 'начальник', 8, 70000, 30),
	('Катя', 'Каткина', 'инженер', 2, 70000, 25),
	('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
	('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'рабочий', 20, 25000, 40),
	('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
	('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
	('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
	('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

# Запросы
# 1.
# по убыванию
SELECT *
FROM users
ORDER BY salary DESC;

# по возрастанию
SELECT *
FROM users
ORDER BY salary ASC;

# 2.
SELECT *
FROM (
		SELECT *
		FROM users
		ORDER BY salary DESC
		LIMIT 5) AS t1
ORDER BY salary ASC;

# 3.
SELECT speciality,
	     SUM(salary) AS salary
FROM users
GROUP BY speciality
HAVING SUM(salary) > 100000;
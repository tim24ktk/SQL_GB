# сначала создаем БД
CREATE DATABASE seminar_4;

# Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
SELECT mark,
       COUNT(color) AS color_count
FROM auto
WHERE mark IN ('BMW', 'LADA')
GROUP BY mark,
         color;

# Вывести на экран марку авто(количество) и количество авто не этой марки.​
# 100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки

SELECT mc.mark,
	   mc.mark_count,
       (au.count_auto - mc.mark_count) AS others_count
FROM (SELECT mark,
			 COUNT(*) AS mark_count
	  FROM auto
      GROUP BY mark
) AS mc
JOIN (SELECT COUNT(*) AS count_auto
			FROM auto) AS au;

# Задание №3
# сначала создаем таблицы из задания и заполняем их данными
CREATE TABLE test_a (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  test VARCHAR (10) NOT NULL
);​

CREATE TABLE test_b (
	id INT
);

INSERT INTO test_a (id, test)
VALUES
		  (10, 'A'),
      (20, 'A'),
      (30, 'F'),
      (40, 'D'),
      (50, 'C');

INSERT INTO test_b (id)
VALUES
		  (10),
      (30),
      (50);

# Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT
SELECT *
FROM test_a
NATURAL LEFT JOIN test_b
WHERE test_b.id IS NULL;
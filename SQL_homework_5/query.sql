# сначала создаем БД
CREATE DATABASE seminar_5;

# указывам какую БД использовать при запросах
USE seminar_5;

# создаем таблицу cars
CREATE TABLE cars (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost INT NULL
);


# заполняем ее данными

INSERT INTO cars (name, cost) VALUES ('Audi', 52642);
INSERT INTO cars (name, cost) VALUES ('Mercedes', 57127);
INSERT INTO cars (name, cost) VALUES ('Skoda', 9000);
INSERT INTO cars (name, cost) VALUES ('Volvo', 29000);
INSERT INTO cars (name, cost) VALUES ('Bentley', 350000);
INSERT INTO cars (name, cost) VALUES ('Citroen', 21000);
INSERT INTO cars (name, cost) VALUES ('Hummer', 41400);
INSERT INTO cars (name, cost) VALUES ('Volkswagen', 21600);

# создаем представление, в которое попадут автомобили стоимостью до 25 000 долл

CREATE VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 25000;

# изменяем в существующем представлении порог для стоимости: пусть цена будет до 30 000 дол (используя оператор ALTER VIEW)

ALTER VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 30000;

# создаем представление, в котором будут только автомобили Шкода и Ауди

CREATE VIEW cars_1_3 AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

# SQL запрос для вывода название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю

SELECT an_name,
       an_price,
       ord_datetime
FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_id AND
               Orders.ord_datetime >= '2020-02-05' AND
               Orders.ord_datetime <= '2020-02-12';

# SQL запрос для добавления нового столбца под названием "время до следующей станции"

SELECT train_id, 
       station,
       station_time,
       SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;
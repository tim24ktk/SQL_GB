USE seminar_1;

# Выведите название, производителя и цену для товаров, количество которых превышает 2​

SELECT product_name​,
	     manufacturer​,
       price​
FROM mobile_phones
WHERE product_count > 2;

# Выведите весь ассортимент товаров марки “Samsung”​

SELECT *
FROM mobile_phones
WHERE manufacturer​ = 'Samsung';

# Найти товары, в которых есть упоминание "Iphone"

SELECT *
FROM mobile_phones
WHERE product_name​ LIKE '%Samsung%';

# Найти товары в которых есть цифры

SELECT *
FROM mobile_phones
WHERE product_name​ RLIKE "[0-9]";


# Найти товары в которых есть цифра 8

SELECT *
FROM mobile_phones
WHERE product_name​ LIKE '%8%';
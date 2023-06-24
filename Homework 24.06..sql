-- 1) найдите имя и фамилию пользователей, у которых нет заказов
SELECT 
	name, 
    lastname
FROM customers
WHERE id NOT IN (
    SELECT 
    customerid FROM orders);

    
-- 2) найдите название товаров, которые ни разу не заказывали

SELECT
	title
FROM products
WHERE id NOT IN (
	SELECT 
		productid 
	FROM orders
);

-- 3) найдите название товаров, которые ни разу не заказывали онлайн

SELECT 
      title
FROM products
WHERE id NOT IN (
	SELECT 
         productid
	FROM orders
    WHERE ordertype IN ("online")
);


-- 4) найдите имя и фамилию покупателя, который сделал самый дорогой заказ

SELECT 
	t1.name, 
    t1.lastname
FROM customers t1
INNER JOIN orders t2
ON t1.id = t2.customerid
WHERE t2.id =
		(SELECT 
		    t2.id
		FROM orders t2
        ORDER BY productcount*(
								SELECT t3.price 
                                FROM products t3 
                                WHERE t3.id = t2.productid)
                                DESC LIMIT 1);


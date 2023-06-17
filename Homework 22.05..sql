-- 1. Найти департаменты в которых есть работники, зарабатывающие больше 10 000. В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать оператор max)
USE hr;
SELECT *FROM employees;

SELECT
	department_id,
    MAX(
    CASE
		WHEN salary > 10000
        THEN 1 
        ELSE 0
        END
) as Max_Salary
FROM employees
GROUP BY department_id;


-- 2. Найти департаменты в которых все работники зарабатывают больше 10 000. В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать оператор min)
SELECT
	department_id,
    MIN(
    CASE
		WHEN salary < 10000
        THEN 1 
        ELSE 0
        END
) as MIN_Salary
FROM employees
GROUP BY department_id;


-- 3. Своими словами написать за что отвечают два эти оператора

-- MAX возвращает максимальное значение в столбце.
-- MIN возвращает минимальное значение в столбце.
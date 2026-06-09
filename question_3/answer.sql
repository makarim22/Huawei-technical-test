## 3a
 INSERT INTO employees (name, position, join_date, release_date, year_of_experience, salary) 
VALUES ('Albert', 'Engineer', '2024-01-24', NULL, 2.5, 50.00);

## 3b

b. update employees set salary=85 where position='Engineer'

## 3c
c. SELECT 
    SUM(
        (DATEDIFF(
            LEAST(COALESCE(release_date, '2021-12-31'), '2021-12-31'), 
            GREATEST(join_date, '2021-01-01')
        ) + 1) / 30.0 * salary
    ) AS total_pengeluaran_2021
FROM 
    employees
WHERE 
    join_date <= '2021-12-31' 
    AND (release_date >= '2021-01-01' OR release_date IS NULL);

## 3d
 select * from employees order by years_of_experience desc
 limit 3;

## 3e
e. SELECT 
    name, 
    position, 
    year_of_experience
FROM (
    SELECT 
        name, 
        position, 
        year_of_experience 
    FROM 
        employees 
    WHERE 
        position = 'Engineer'
) AS engineer_list
WHERE 
    year_of_experience <= 3;
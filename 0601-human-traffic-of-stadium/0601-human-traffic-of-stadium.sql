# Write your MySQL query statement below
WITH CheckedRows AS (
    SELECT 
        id, 
        visit_date, 
        people,
        LAG(people, 2) OVER (ORDER BY id) as prev_2,
        LAG(people, 1) OVER (ORDER BY id) as prev_1,
        LEAD(people, 1) OVER (ORDER BY id) as next_1,
        LEAD(people, 2) OVER (ORDER BY id) as next_2
    FROM 
        Stadium
)
SELECT 
    id, 
    visit_date, 
    people
FROM 
    CheckedRows
WHERE 
    people >= 100 AND (
        (prev_2 >= 100 AND prev_1 >= 100) OR
        (prev_1 >= 100 AND next_1 >= 100) OR 
        (next_1 >= 100 AND next_2 >= 100)    
    )
ORDER BY 
    visit_date ASC;

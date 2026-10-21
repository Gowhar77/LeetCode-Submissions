# Write your MySQL query statement below
(SELECT u.name AS results
FROM Users u
LEFT JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP BY u.user_id
ORDER BY count(mr.user_id) desc , u.name limit 1)
UNION ALL
(
    SELECT m.title AS results
    FROM Movies m
    LEFT JOIN MovieRating mr
    ON m.movie_id = mr.movie_id
    WHERE extract(year_month from created_at) = 202002
    group by m.movie_id
    order by avg(mr.rating) desc , m.title limit 1
)

;
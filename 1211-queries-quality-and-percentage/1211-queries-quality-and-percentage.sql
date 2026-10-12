# Write your MySQL query statement below
SELECT query_name, round(avg(rating/position),2) AS quality, round(count(If(rating<3,1,Null)) / count(rating) *100 ,2) AS poor_query_percentage
FROM  Queries
GROUP BY query_name

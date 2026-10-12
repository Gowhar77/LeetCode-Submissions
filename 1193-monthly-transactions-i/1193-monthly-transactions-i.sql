# Write your MySQL query statement below
SELECT DATE_FORMAT(trans_date,'%Y-%m')AS month, country, count(state) AS trans_count, count(CASE WHEN state = 'approved' THEN 1 END)  AS approved_count, sum(amount) AS trans_total_amount, sum(if(state= 'approved', amount,0)) AS approved_total_amount
from Transactions
group by month, country
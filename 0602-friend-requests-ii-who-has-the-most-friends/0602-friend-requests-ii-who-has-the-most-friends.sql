# Write your MySQL query statement below
Select id, count(id) as num from
(
    select requester_id as id from RequestAccepted
    Union all
    select accepter_id as id from RequestAccepted
) temp
group by id
order by num desc limit 1
;
# Write your MySQL query statement below
select Products.product_name, sum(Orders.unit) as unit
from Products
left join Orders
on Products.product_id = Orders.product_id
Where orders.order_date between '2020-02-01' and '2020-02-29'

group by Products.product_name
having sum(Orders.unit) >= 100
;
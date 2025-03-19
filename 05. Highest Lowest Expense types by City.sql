--write a query to print 3 columns: city, highest_expense_type, lowest_expense_type (example format: Delhi, bills, Fuel)

with cte as (
select city, exp_type, sum(amount) as total_expense from credit_card_transactions
group by city, exp_type),
rank as(
select *, 
rank () over (partition by city order by total_expense desc) as high_rnk,
rank () over (partition by city order by total_expense asc) as low_rnk
from cte)
select city,
max(case when high_rnk = 1 then exp_type end) as highest_expense_type,
max(case when low_rnk = 1 then exp_type end) as lowest_expense_type
from rank
where high_rnk=1 or low_rnk=1
group by city;






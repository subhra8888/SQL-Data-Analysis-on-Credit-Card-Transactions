--which city took least number of days to reach its 500th transaction after the first transaction in that city

with cte as (
select *, row_number () over (partition by city order by transaction_date, transaction_id) as rnk
from credit_card_transactions)
select city, min(transaction_date) as first_transaction, max(transaction_date) as last_transaction,
datediff(day, min(transaction_date), max(transaction_date)) as number_of_days
from cte
where rnk in (1,500)
group by city
having count(*) = 2
order by number_of_days asc;
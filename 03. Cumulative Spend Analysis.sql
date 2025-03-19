--write a query to print the transaction details(all columns from the table) for each card type when
it reaches a cumulative of 1000000 total spends(We should have 4 rows in the o/p one for each card type)

with cumulative_cte as(
select *, sum(amount) over (partition by card_type order by  transaction_date, transaction_id) as cumulative_total
from credit_card_transactions),
rank as(
select *, rank() over (partition by card_type order by cumulative_total) as rnk
from cumulative_cte
where cumulative_total >= 1000000)
select * from rank
where rnk = 1;


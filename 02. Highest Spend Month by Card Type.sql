--write a query to print highest spend month and amount spent in that month for each card type

with cte as(
select card_type, datepart(year,transaction_date) as year,datename(month,transaction_date) as month,
sum(amount) as monthly_expense
from credit_card_transactions
group by card_type, datepart(year,transaction_date), datename(month,transaction_date)),
rank as (
select *, rank() over (partition by card_type order by monthly_expense desc) as rnk
from cte)
select * from rank
where rnk = 1;



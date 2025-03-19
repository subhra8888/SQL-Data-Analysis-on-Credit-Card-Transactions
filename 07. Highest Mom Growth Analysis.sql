--which card and expense type combination saw highest month over month growth in Jan-2014

with monthly_expenses_current as(
select card_type, exp_type, format(transaction_date, 'yyyyMM') as month_year,
sum(amount) as current_month_expense
from credit_card_transactions
group by card_type, exp_type,format(transaction_date, 'yyyyMM')),

monthly_expenses_previous as(
select *, lead(current_month_expense) over (partition by card_type, exp_type order by month_year desc) as prev_month_expense
from monthly_expenses_current)

select top 1 *,  cast((current_month_expense*1.0- prev_month_expense)/prev_month_expense as decimal (5,2)) as mom_growth
from monthly_expenses_previous
where prev_month_expense is not null and month_year = '201401'
order by mom_growth desc;

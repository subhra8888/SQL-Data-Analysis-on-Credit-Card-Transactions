--1. write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends

with cte as(
select sum(amount) as total_sales from credit_card_transactions),
cte2 as(
select city, sum(amount) as city_wise_sales
from credit_card_transactions
group by city)
select top 5 *, cast(city_wise_sales*1.0/ total_sales * 100 as decimal (10,2)) as percentage
from cte2, cte
order by percentage desc;


--2. write a query to print highest spend month and amount spent in that month for each card type

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


--3. write a query to print the transaction details(all columns from the table) for each card type when
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


--4. write a query to find city which had lowest percentage spend for gold card type

select city, sum(amount) as total_spend,
sum(case when card_type = 'Gold' then amount else 0 end) as gold_spend,
cast(sum(case when card_type = 'Gold' then amount else 0 end)*1.0/sum(amount)*100 as decimal (5,2)) as percentage_spend
from credit_card_transactions
group by city
having sum(case when card_type = 'Gold' then amount else 0 end) > 0
order by percentage_spend asc;


--5. write a query to print 3 columns: city, highest_expense_type, lowest_expense_type (example format: Delhi, bills, Fuel)

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

--6. write a query to find percentage contribution of spends by females for each expense type

select exp_type,
sum(case when gender = 'F' then amount else 0 end) as female_spends,
sum(amount) as total_spends,
cast(sum(case when gender = 'F' then amount else 0 end)*1.0/sum(amount)*100 as decimal (5,2)) as percentage_contribution
from credit_card_transactions
group by exp_type
order by percentage_contribution desc;


--7. which card and expense type combination saw highest month over month growth in Jan-2014

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


--8. during weekends which city has highest total spend to total no of transcations ratio 

select city, sum(amount)/count(*) as weekend_spending_ratio
from credit_card_transactions
where datepart(weekday,transaction_date) in (1,7)
group by city
order by weekend_spending_ratio desc;

--9. which city took least number of days to reach its 500th transaction after the first transaction in that city

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

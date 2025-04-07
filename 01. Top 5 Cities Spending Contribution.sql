--write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends

with cte as(
select sum(amount) as total_sales from credit_card_transactions),
cte2 as(
select city, sum(amount) as city_wise_sales
from credit_card_transactions
group by city)
select top 5 *, cast(city_wise_sales*1.0/ total_sales * 100 as decimal (10,2)) as percentage
from cte2, cte
order by city_wise_sales desc;

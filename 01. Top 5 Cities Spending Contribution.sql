--write a query to print top 5 cities with highest spends and their percentage contribution of total credit card spends

with ctes as(
select sum(amount) as total_spends from credit_card_transactions)
select top 5 city, sum(amount) as city_wise_spends, total_spends,
cast(sum(amount)*1.0/total_spends*100 as decimal (5,2)) as percentage_contribution
from credit_card_transactions, ctes
group by city, total_spends
order by percentage_contribution desc;




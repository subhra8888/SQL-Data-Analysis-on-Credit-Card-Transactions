--write a query to find city which had lowest percentage spend for gold card type


select city, sum(amount) as total_spend,
sum(case when card_type = 'Gold' then amount else 0 end) as gold_spend,
cast(sum(case when card_type = 'Gold' then amount else 0 end)*1.0/sum(amount)*100 as decimal (5,2)) as percentage_spend
from credit_card_transactions
group by city
having sum(case when card_type = 'Gold' then amount else 0 end) > 0
order by percentage_spend asc;
--write a query to find percentage contribution of spends by females for each expense type

select exp_type,
sum(case when gender = 'F' then amount else 0 end) as female_spends,
sum(amount) as total_spends,
cast(sum(case when gender = 'F' then amount else 0 end)*1.0/sum(amount)*100 as decimal (5,2)) as percentage_contribution
from credit_card_transactions
group by exp_type
order by percentage_contribution desc;

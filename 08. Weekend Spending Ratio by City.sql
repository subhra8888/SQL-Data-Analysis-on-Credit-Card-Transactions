--during weekends which city has highest total spend to total no of transcations ratio 

select city, sum(amount)/count(*) as weekend_spending_ratio
from credit_card_transactions
where datepart(weekday,transaction_date) in (1,7)
group by city
order by weekend_spending_ratio desc;
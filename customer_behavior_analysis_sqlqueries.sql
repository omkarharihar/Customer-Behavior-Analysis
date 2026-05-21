with item_counts as (
select category,
item_purchased,
COUNT(customer_id) as total_orders,
ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
from customer
group by category, item_purchased
)

select item_rank, category, item_purchased, total_orders
from item_counts
where item_rank <= 3;


--Q9. Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
select subscription_status,
count(customer_id) as repeat_buyers
from customer
where previous_purchases > 5
group by subscription_status


--Q10. What is the revenue contribution of each age group?
select age_group,
SUM(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;
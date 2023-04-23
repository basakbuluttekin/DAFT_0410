-- 1) From the order_items table, find the price of the highest priced order and lowest price order.

select * from order_items;

select order_id, max(price) as "max_price",
	   min(price) as "min_price"
       from order_items
       group by order_id;

  -- 2) From the order_items table, what is range of the shipping_limit_date of the orders
  
  select 
		min(shipping_limit_date) as "min date",
        max(shipping_limit_date) as "max date"
        from order_items;
  
    -- 3)  From the customers table, find the states with the greatest number of customers.
    
    select * from customers;
    
    select customer_state, count(customer_state)
    from customers
    group by customer_state
    order by count(customer_state) desc;
    
     -- 4)  From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
    
    select customer_city, count(customer_city)
    from customers
    where customer_state = "SP"
    group by customer_city
    order by count(customer_city) desc;
    
    -- 5) From the closed_deals table, how many distinct business segments are there (not including null)?
    
    select * from closed_deals;
    
    select distinct (business_segment) from closed_deals where business_segment is not null;
    
    -- 6) From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment 
    --    and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
    
    select business_segment, sum(declared_monthly_revenue)
    from closed_deals
    group by business_segment
    order by sum(declared_monthly_revenue) desc;
    
    
    -- 7) From the order_reviews table, find the total number of distinct review score values.
    
    select * from order_reviews;
    
    select distinct(review_score), count(review_score)
    from order_reviews
    group by review_score
    order by count(review_score) desc;
    
    -- 8) In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, 
    --    then find the review score and category occurring most frequently in the table.
    
	select review_score, count(review_score),
				case when review_score = 1 then "Very poor"
					 when review_score = 2 then "Poor"
					 when review_score = 3 then "Medium"
					 when review_score = 4 then "Good"
					 else "Very Good"
				end as review_category
	from order_reviews
	group by review_score
	order by count(review_score) desc;   
    -- 9) From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
     
     select * from order_reviews;
    
    select review_comment_title, count(review_comment_title)
    from order_reviews
    group by review_comment_title
    order by count(review_comment_title) desc limit 1;
    
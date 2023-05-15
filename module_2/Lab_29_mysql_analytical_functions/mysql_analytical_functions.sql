use sakila;

select *
from payment;

# Q1
select customer_id, payment_date, amount,
sum(amount) over (order by customer_id)
from payment;

# Q2
select date_format(payment_date, '%Y-%m-%d' ) as date, amount
, rank() over (partition by date_format(payment_date, '%Y-%m-%d' ) order by amount desc ) as rank1
, dense_rank() over (partition by date_format(payment_date, '%Y-%m-%d' ) order by amount desc) as dense_rk
from payment
order by payment_date, amount desc;

# Q3
select c.name, f.title, f.rental_rate,
rank() over (partition by f.rental_rate) as rank1,
dense_rank() over (partition by f.rental_rate) as dns_rank1
from category c
inner join film_category fc on c.category_id = fc.category_id
inner join film f on fc.film_id = f.film_id;

# Q5
select payment_date, payment_id, customer_id, amount
, lag(amount) over (partition by customer_id order by payment_date) as previous_movie_price
, lead(amount) over (partition by customer_id order by payment_date) as next_movie_price
from payment
order by payment_date;





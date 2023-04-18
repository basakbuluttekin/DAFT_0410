-- 1) What are the different genres? there are 22 types
select distinct prime_genre from new_database.applestore2;

-- 2)  Which is the genre with the most apps rated? Facebook 
select track_name, rating_count_tot
 from new_database.applestore2
 order by rating_count_tot desc;
 
 -- 3)  Which is the genre with most apps? Games
select  count(prime_genre), prime_genre from new_database.applestore2
group by prime_genre
order by count(prime_genre) desc limit 1;

  -- 4)  Which is the one with least?? Medical
select  count(prime_genre), prime_genre from new_database.applestore2
group by prime_genre
order by count(prime_genre) asc limit 1;

  -- 5)  Find the top 10 apps most rated.
select  track_name, rating_count_tot
 from new_database.applestore2 
 order by rating_count_tot desc limit 10;
  
  -- 6) Find the top 10 apps best rated by users.
    select * from new_database.applestore2;
select track_name, user_rating
 from new_database.applestore2
 order by user_rating desc limit 10;
    
  -- 7) Take a look at the data you retrieved in question 5. Give some insights..    
select  track_name, rating_count_tot, price, user_rating, prime_genre, ver
 from new_database.applestore2 
 order by rating_count_tot desc limit 10;
    
-- 8) Take a look at the data you retrieved in question 6. Give some insights.
select track_name, user_rating, rating_count_tot, price, prime_genre, ver
 from new_database.applestore2
 order by user_rating desc limit 10;
 
 -- 9) Now compare the data from questions 5 and 6. What do you see?
 -- best rated by users (top 10) applications aren't free (mostly) but most rated apps(top10) are mainly free.
 -- best rated by users apps have lower rating.alter
 -- there is no social networking app in best rated by users top 10 list.
 
 -- 10) How could you take the top 3 regarding both user ratings and number of votes?
 select track_name, user_rating, rating_count_tot
 from new_database.applestore2
 where user_rating = 5
 order by rating_count_tot desc limit 3;
 
 -- 11) Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. 
select track_name, price, user_rating, rating_count_tot,
			case when price =  0 then "Free"
				 when price <= 0.99 then "Cheap"
				 else "expensive"
			end as classification
from new_database.applestore2
where user_rating >3
order by rating_count_tot desc limit 10;

-- People care about the price of app because the most rated apps are free ones. 
-- Also non-free apps are rated less than free apps.




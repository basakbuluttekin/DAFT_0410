use publications;

select * from titles;
select * from sales;
select * from titleauthor;

-- CHALLENGE#1

select TP.Author_ID,
       round(sum(TP.advance) + sum(TP.sales_royalty),0) AS "Total_Profit"

from (
 select titleauthor.title_id as "Title_ID",
	    titleauthor.au_id as "Author_ID",
       round(sum(titles.advance * titleauthor.royaltyper / 100),0) as "Advance",
       round(sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) as "Sales_Royalty"
from titleauthor
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by titleauthor.title_id, titleauthor.au_id
) TP
group by TP.Author_ID
order by Total_Profit desc limit 3;

-- CHALLENGE #2

create temporary table if not exists profits as (

select titleauthor.title_id as "Title_ID",
	    titleauthor.au_id as "Author_ID",
       round(sum(titles.advance * titleauthor.royaltyper / 100),0) as "Advance",
       round(sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) as "Sales_Royalty"
from titleauthor
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by titleauthor.title_id, titleauthor.au_id
order by advance);

select * from profits;

select profits.Author_ID,
	   (profits.Advance + profits.Sales_Royalty) as Total_Profit
from profits
group by profits.Author_ID, profits.Advance, profits.Sales_Royalty
order by Total_Profit desc limit 3;

-- CHALLENGE #3

create table most_profiting_authors as (

select TP.Author_ID,
       round(sum(TP.advance) + sum(TP.sales_royalty),0) AS "Total_Profit"

from (
 select titleauthor.title_id as "Title_ID",
	    titleauthor.au_id as "Author_ID",
       round(sum(titles.advance * titleauthor.royaltyper / 100),0) as "Advance",
       round(sum(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) as "Sales_Royalty"
from titleauthor
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by titleauthor.title_id, titleauthor.au_id
) TP
group by TP.Author_ID
order by Total_Profit desc);
    
select*from most_profiting_authors;




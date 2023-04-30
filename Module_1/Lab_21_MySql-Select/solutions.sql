
use publications; 
-- CHALLLENGE#1 

SELECT authors.au_id AS `AUTHOR ID`, 
       authors.au_lname AS `LAST NAME`, 
       authors.au_fname AS `FIRST NAME`, 
       titles.title AS `TITLE`, 
       publishers.pub_name AS `PUBLISHER`
FROM publishers
INNER JOIN titles
ON  publishers.pub_id = titles.pub_id
INNER JOIN titleauthor
ON  titles.title_id = titleauthor.title_id
INNER JOIN authors
ON  titleauthor.au_id = authors.au_id
order by publishers.pub_name desc;


-- CHALLENGE#2


SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       publishers.pub_name AS "PUBLISHER",
       count(*) AS "NUMBER OF TITLES"
FROM publishers
INNER JOIN titles
ON  publishers.pub_id = titles.pub_id
INNER JOIN titleauthor
ON  titles.title_id = titleauthor.title_id
INNER JOIN authors
ON  titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY publishers.pub_name DESC;

-- CHALLENGE#3

SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       SUM(sales.qty) AS "TOTAL"
FROM sales
INNER JOIN titles
ON  sales.title_id = titles.title_id
INNER JOIN titleauthor
ON  titles.title_id = titleauthor.title_id
INNER JOIN authors
ON  titleauthor.au_id = authors.au_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC LIMIT 3;


-- CHALLENGE#4

SELECT authors.au_id AS "AUTHOR ID", 
       authors.au_lname AS "LAST NAME", 
       authors.au_fname AS "FIRST NAME", 
       COALESCE(SUM(sales.qty), 0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor
ON  authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON  titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON  titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC;



select * from publishers;
select * from authors;
select * from pub_info;
select * from titles;
select * from sales;


use movie_db;
# 1. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.
SELECT title, votes, year
FROM movies
WHERE votes > 500000 and year < 200 AND
movie_id in
 (SELECT movie_id FROM movie_directors JOIN directors d ON movie_directors.director_id = d.director_id
WHERE director_name LIKE "Quentin%");

# 2. TOM HANKS, MORE THAN 3 OSCAR. prb
SELECT m.title, m.oscars
FROM movies m
JOIN movie_stars ms ON m.movie_id = ms.movie_id
JOIN stars s ON ms.star_id = s.star_id
where s.star_name = "Tom Hanks" AND m.oscars > 3;

# 3. Show the history produced in USA, 100- 200 MİN
SELECT m.title, m.duration , g.genre_name, c.countRy_name
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
JOIN producer_countries pc on m.movie_id = pc.movie_id
JOIN countries c on c.country_id = pc.country_id
WHERE g.genre_name = "History" AND c.country_name = "USA" AND m.duration BETWEEN 100 and 200;

# 4. Average budget of the films directed by Peter Jackson.
SELECT avg(m.budget) as avg_budget
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON d.director_id = md.director_id
WHERE d.director_name = "Peter Jackson";


# 5. Francis Ford Copolla film that has max budget
SELECT m.title, m.budget
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON d.director_id = md.director_id
WHERE d.director_name like "Francis Ford%"
ORDER BY m.budget desc
LIMIT 3;	 



# 6. Show the film that has the most vote and produced in USA.
select m.title , m.votes 
FROM movies m
JOIN producer_countries pc ON pc.movie_id = m.movie_id
JOIN countries c ON pc.country_id = c.country_id
WHERE c.country_name = "USA"
ORDER BY m.votes desc
limit 1;  

# 7. List all stars who have acted in more than 1 movie.

SELECT s.star_name, count(ms.movie_id) AS film_count
FROM stars s 
JOIN movie_stars ms on s.star_id = ms.star_id
GROUP by s.star_name
HAVING film_count > 1;

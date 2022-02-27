# [INNER] JOIN
select t.genere, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h join topgenres t on h.genre = t.genere
order by t.genere asc;

# LEFT [OUTER] JOIN
select t.genere, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h left join topgenres t on h.genre = t.genere
order by t.genere asc;

# RIGHT [OUTER] JOIN
select t.genere, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h right join topgenres t on h.genre = t.genere
order by t.genere asc;

# FULL JOIN/ FULL OUTER JOIN = INNER JOIN + LEFT JOIN + RIGHT JOIN - It is not present in MySQL
select t.generes, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h full join topgenres t on h.genre = t.generes
order by t.generes asc;

# CROSS JOIN
select t.genere, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h cross join topgenres t
order by t.genere asc;

# NATURAL JOIN - It is same as CROSS JOIN in MySQL
select t.genere, t.`rank` , t.market_share, h.`year` , h.movie
from highestgrossers h natural join topgenres t
order by t.genere asc;

# SELF JOIN
select t1.genere, t1.`rank` , t1.market_share
from topgenres t1 join topgenres t2
order by t1.genere asc;
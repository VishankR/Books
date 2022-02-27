
#window_functions - row_number(), rank(), dense_rank(),
#using partition for aggregate functions
SELECT
  *,
  MAX(hg.tickets_sold) OVER(PARTITION BY hg.genre) AS MAX_TICKETS
FROM
  highestgrossers hg;
  
#row_number(), ranks(), dense_ranks()
SELECT
  *
FROM
	(SELECT * , 
	ROW_NUMBER() OVER(PARTITION BY hg.genre ORDER BY hg.tickets_sold) AS row_num,
	rank() over(partition by hg.genre order by hg.tickets_sold) as ranks,
	dense_rank() over(partition by hg.genre
	order by hg.tickets_sold) as dense_ranks
	from highestgrossers hg) x ;

#lead(), lag()/ write a query to display if the salary of an employee is higher, lower or equal to the previous employee
select *,
	lag(h.tickets_sold, 2, 0) over(partition by genre order by h.tickets_sold) as previous_movie_tickets,
	lead(h.tickets_sold, 2, 0) over(partition by genre order by h.tickets_sold) as next_movie_tickets,
	case 
		when h.total_for_year > lag(h.total_for_year, 1, 0) over(partition by genre order by h.tickets_sold) then 'Higher than previous movie tickets'
		when h.total_for_year < lag(h.total_for_year, 1, 0) over(partition by genre order by h.tickets_sold) then 'Lower than previous movie tickets'
		when h.total_for_year = lag(h.total_for_year, 2, 0) over(partition by genre order by h.tickets_sold) then 'Same as previous movie tickets'
	end total_year_range
from
	highestgrossers h ;
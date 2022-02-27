# Common Table Expression (CTE) / With Clause

with avg_movies(avg_mov) as (select avg(movies) from topproductionmethods)
select *
from topproductionmethods tpm, avg_movies am
where tpm.movies < am.avg_mov;
-- 1
create table worker (
    id int constraint pk_worker primary key,
    name varchar(100)
)

-- 2
bulk insert worker
from 'D:\Personal\CSPortfolio\MAAB\homeworks\SQL_homeworks\lesson-2\homework\workers.csv'
with (
    firstrow = 2,
    fieldterminator = ',',
    rowterminator = '\n'
)

-- 3
select * from worker
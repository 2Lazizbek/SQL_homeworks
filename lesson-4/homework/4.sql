select letter
from letters
order by case when letter = 'b' then 0 else 1 end, letter;

-- 4
select letter
from letters
order by case when letter = 'b' then 'z' else letter end;

-- 5
with ranked_letters as (
    select letter, row_number() over (order by letter) as rn
    from letters
)
select letter
from ranked_letters
order by case when letter = 'b' then 3
else rn end
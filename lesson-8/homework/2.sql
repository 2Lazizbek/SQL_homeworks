with allyears as (
    select 1975 as year
    union all
    select year + 1
    from allyears
    where year < 2025
),
hireyears as (
    select distinct year(hire_date) as hire_year
    from employees_n
),
nonhireyears as (
    select y.year
    from allyears y
    left join hireyears h 
        on y.year = h.hire_year
    where h.hire_year is null
),
gaps as (
    select 
        year,
        year - row_number() over (order by year) as groupid
    from nonhireyears
)
select 
    concat(min(year), ' - ', max(year)) as years
from gaps
group by groupid
order by min(year)
declare @year int = 2025
declare @month int = 4

;with dates as (
    select 
        cast(datefromparts(@year, @month, 1) as date) as calendar_date
    union all
    select 
        dateadd(day, 1, calendar_date)
    from dates
    where month(dateadd(day, 1, calendar_date)) = @month
),
weeks as (
    select 
        calendar_date,
        datepart(week, calendar_date) as week_number,
        case 
            when datepart(weekday, calendar_date) = 1 then calendar_date
        end as sunday,
        case 
            when datepart(weekday, calendar_date) = 2 then calendar_date
        end as monday,
        case 
            when datepart(weekday, calendar_date) = 3 then calendar_date
        end as tuesday,
        case 
            when datepart(weekday, calendar_date) = 4 then calendar_date
        end as wednesday,
        case 
            when datepart(weekday, calendar_date) = 5 then calendar_date
        end as thursday,
        case 
            when datepart(weekday, calendar_date) = 6 then calendar_date
        end as friday,
        case 
            when datepart(weekday, calendar_date) = 7 then calendar_date
        end as saturday
    from dates
)
select 
    week_number,
    max(sunday) as sunday,
    max(monday) as monday,
    max(tuesday) as tuesday,
    max(wednesday) as wednesday,
    max(thursday) as thursday,
    max(friday) as friday,
    max(saturday) as saturday
from weeks
group by week_number
order by week_number
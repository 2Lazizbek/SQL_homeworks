-- 1
create table student (
    id int constraint pk_student primary key,
    classes int,
    tuition_per_class decimal(10,2),
    total_tuition as (classes * tuition_per_class)
)

-- 2
insert into student (id, classes, tuition_per_class) 
values 
    (1, 5, 100.50),
    (2, 3, 150.75),
    (3, 10, 80.00)

-- 3
select * from student
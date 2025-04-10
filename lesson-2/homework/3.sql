-- 1
create table photos (
    id int constraint pk_photos primary key,
    image_data varbinary(max)
)

-- 2
insert into photos (id, image_data)
select 1, bulkcolumn from openrowset(
    bulk 'C:\Users\lazer_007\Downloads\apple.jpg', single_blob
) as img

-- 3
select * from photos
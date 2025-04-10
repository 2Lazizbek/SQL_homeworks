-- 1
create table data_types_demo (
    id int constraint pk_data_types_demo primary key,
    tiny_number tinyint,
    small_number smallint,
    big_number bigint,
    decimal_number decimal(10,2),
    float_number float,
    text_data varchar(max),
    date_value date,
    time_value time,
    datetime_value datetime,
    guid_value uniqueidentifier,
    binary_data varbinary(max)
)
insert into data_types_demo (id, tiny_number, small_number, big_number, decimal_number, float_number, text_data, date_value, time_value, datetime_value, guid_value, binary_data) 
values (1, 255, 32000, 123456789012345, 12345.67, 50.256, 'hello world', '2025-04-10', '14:30:00', '2025-04-10 14:30:00', '4fe476e9-4db8-4b0a-9e7d-8c9a1b2c3d4e', 0x48656c6c6f)

-- 2
select * from data_types_demo
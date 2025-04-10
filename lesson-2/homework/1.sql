-- 1
create table test_identity (
    id int identity(1,1) constraint pk_test_identity primary key,
    name varchar(50)
)
insert into test_identity (name) values ('row   row1'), ('row2'), ('row3'), ('row4'), ('row5')

-- 2.1
delete from test_identity
insert into test_identity (name) values ('row6')
select * from test_identity
drop table test_identity

-- 2.2
create table test_identity (
    id int identity(1,1) constraint pk_test_identity primary key,
    name varchar(50)
)
insert into test_identity (name) values ('row1'), ('row2'), ('row3'), ('row4'), ('row5')
truncate table test_identity
insert into test_identity (name) values ('row6')
select * from test_identity
drop table test_identity

-- 2.3
create table test_identity (
    id int identity(1,1) constraint pk_test_identity primary key,
    name varchar(50)
)
insert into test_identity (name) values ('row1'), ('row2'), ('row3'), ('row4'), ('row5')
drop table test_identity
create table test_identity (
    id int identity(1,1) constraint pk_test_identity primary key,
    name varchar(50)
)
insert into test_identity (name) values ('row6')
select * from test_identity

/*
answers to questions:
- what happens to the identity column when you use delete?
  the identity column retains its last value, and the next insert continues from the next number (e.g., 6 after deleting 1-5).
- what happens to the identity column when you use truncate?
  the identity column resets to its seed value (e.g., 1), and the next insert starts from 1 again.
- what happens to the table when you use drop?
  the table is completely removed, including its structure and data. recreating it starts the identity fresh from 1.
*/
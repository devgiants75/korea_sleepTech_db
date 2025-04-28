create database jdbc_db;

use jdbc_db;

create table member (
	id int auto_increment primary key,
    name varchar(50),
    email varchar(100)
);

insert into member
values
	(null, '이승아', 'qwe123'),
	(null, '이도경', 'asd456'),
	(null, '이지희', 'zxc789');
    
select * from member;
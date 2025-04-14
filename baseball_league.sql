### 야구 데이터베이스 ###
create database if not exists baseball_league;

use baseball_league;

create table teams (
	team_id int primary key,
    name varchar(100) unique,
    city varchar(100),
    founded_year year
);

create table players (
	player_id int primary key,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수'),
    birth_date date not null,
    team_id int, -- 참조값
    foreign key (team_id) references teams(team_id)
);

insert into teams
values
	(1, 'LOTTE', 'Busan', 1982),
	(2, 'DOSAN', 'Seoul', 1999),
	(3, 'SSG', 'Incheon', 2000);
    
insert into players
values
	(101, 'Kim min', '타자', '1992-05-20', 1),
	(102, 'Lee Joon', '투수', '1990-08-15', 2),
	(103, 'Choi Hyeon', '내야수', '1988-03-05', 3),
	(104, 'Park seo', '외야수', '1994-11-22', 1),
	(105, 'Jung Tae', '타자', '1993-07-30', 2);

describe teams;
desc players;

drop table if exists teams;
drop table if exists players;

drop database baseball_league;
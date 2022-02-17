
drop table album CASCADE;
drop table album_singer CASCADE;
drop table collection CASCADE;
drop table genre CASCADE;
drop table singer CASCADE;
drop table singer_genre CASCADE; 
drop table track CASCADE;
drop table track_collection CASCADE;

-- create запросы 

create table if not exists genre (
	id serial primary key,
	genre_name varchar(40) unique not null
);


create table if not exists singer (
	id serial primary key,
	full_name text unique not null,
	nickname varchar(40) unique not null
);


create table if not exists singer_genre (
	singer_id int references singer(id),
	genre_id int references genre(id),
	constraint singer_genre_pk primary key (singer_id, genre_id)
);


create table if not exists album (
	id serial primary key,
	album_name text unique not null,
	release_year int not null
);

create table if not exists album_singer (
	singer_id int references singer(id),
	album_id int references album(id), 
	constraint album_singer_pk primary key (singer_id, album_id)
);


create table if not exists track (
	id serial primary key,
	track_name text unique not null,
	duration int not null,
	album_id int references album(id) 
);


create table if not exists collection (
	id serial primary key,
	collection_name text unique not null,
	release_year int not null
);

create table if not exists track_collection (
	track_id int references track(id),
	collection_id int references collection(id), 
	constraint track_collection_pk primary key (track_id, collection_id)
);


-- insert запросы 


INSERT INTO genre (id, genre_name) VALUES
	(1, 'Rap'),
	(2, 'Hip-Hop'),
	(3, 'R&B'),
	(4, 'Rock'),
	(5, 'Pop');

INSERT INTO singer (id, full_name, nickname) VALUES
	(1, 'Алексей Узенюк', 'allJ'),
	(2, 'Егор Булаткин', 'Egor Krid'),
	(3, 'Артем Готлиб', 'Slawa Marlow'),
	(4, 'Екатерина Иванчикова', 'Iowa'),
	(5, 'Роман Билык', 'Рома зверь'),
	(6, 'Федор Инсаров', 'Feduk'),
	(7, 'Данил Прытков', 'Niletto'),
	(8, 'Александр Ревва', 'Артур Пирожков');

INSERT INTO singer_genre (singer_id, genre_id) VALUES
	(1,1),
	(1,2),
	(2,1),
	(2,2),
	(3,3),
	(3,5),
	(4,5),
	(5,4),
	(6,1),
	(6,2),
	(6,3),
	(7,5),
	(8,5);

INSERT INTO album (id, album_name, release_year) VALUES
	(1, 'More Love', 2018),
	(2, 'Sayonara boy 143', 2018),
	(3, 'Артем', 2020),
	(4, 'Холосятк', 2015),
	(5, 'Export', 2014),
	(6, 'Ляля', 2018),
	(7, 'Хентай', 2018),
	(8, 'Районы Кварталы', 2006),
	(9, 'Все о любви', 2020);

INSERT INTO album_singer (singer_id, album_id) VALUES
	(6, 1),
	(1, 1),
	(1, 2),
	(6, 2),
	(3, 3),
	(2, 4),
	(4, 5),
	(7, 6),
	(7, 7),
	(5, 8),
	(8, 9);

INSERT INTO track (id, track_name, duration, album_id) VALUES
	(1, 'Розовое вино', 241, 1),
	(2, 'Море', 147, 1),
	(3, 'Мой - 143', 191, 2),
	(4, 'Снова', 241, 3),
	(5, 'Только мой', 337, 4),
	(6, 'Улыбайся', 299, 5),
	(7, 'Под крылом', 241, 6),
	(8, 'Сентиенты', 233, 7),
	(9, 'Мой квартал', 201, 8),
	(10, 'Фит с зиверт', 241, 7),
	(11, 'Кипарис', 241, 6),
	(12, 'Москит', 241, 5),
	(13, 'Борода', 241, 4),
	(14, 'Камри 3,5', 241, 3),
	(15, '1-love', 241, 2);

INSERT INTO collection (id, collection_name, release_year) VALUES
	(1, 'Pink Water', 2017),
	(2, 'Without Love', 2019),
	(3, 'Car songs', 2018),
	(4, 'Nitght Radio', 2018),
	(5, 'LP #1', 2021),
	(6, 'LP #2', 2020),
	(7, 'LP #3', 2022),
	(8, 'LP #4', 2015);

INSERT INTO track_collection (track_id, collection_id) VALUES
	(1, 1),
	(3, 2),
	(13, 3),
	(14, 3),
	(10, 4),
	(15, 4),
	(15, 5),
	(13, 6),
	(13, 7),
	(6, 8);

-- Select запросы 

SELECT album_name, release_year FROM album WHERE release_year = 2018;
SELECT track_name, duration FROM track order by duration desc LIMIT 1;
SELECT track_name FROM track WHERE duration >= 3.5*60;
SELECT collection_name FROM collection WHERE release_year BETWEEN 2018 and 2020;
SELECT full_name, nickname FROM singer WHERE nickname not like '% %'; 
SELECT track_name FROM track WHERE track_name ilike '%мой%'; 
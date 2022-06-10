show databases;
drop database if exists imdb;
create database imdb;
use imdb;

drop table if exists users;
create table users
(
	id SERIAL PRIMARY KEY, -- bigint usigned not null auto_increment unique
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULl,
    email varchar(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    birth DATE,
    
    index users_fio_idx (firstname, lastname)
);

drop table if exists profiles;
create table profiles
(
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    photo_id BIGINT UNSIGNED NULL,
    hometown VARCHAR(100),
    created_ad DATETIME DEFAULT now()
);

ALTER TABLE profiles
ADD CONSTRAINT fk_user_id
FOREIGN KEY(user_id) REFERENCES users(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;

drop table if exists movies;
create table movies
(
	id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100) NOT NULL,
    release_date DATE,
    
    index movies_title_idx (title),
    index genre_title_idx (genre)
);

drop table if exists images;
create table images
(
	id SERIAL PRIMARY KEY,
    image_title VARCHAR(255) NOT NULL,
    
    index image_imgtitle_idx (image_title)
);

drop table if exists trailers;
create table trailers
(
	id SERIAL PRIMARY KEY,
    trailer_name VARCHAR(255) NOT NULL,
    
    index trailers_name_idx (trailer_name)
);

drop table if exists ratings;
create table ratings
(
	id SERIAL PRIMARY KEY,
	rating INT UNSIGNED NOT NULL,
    
    index ratings_rate_idx (rating)
);

drop table if exists actors;
create table actors
(
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    birth DATE NOT NULL, 
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    
    index acters_fio (firstname, lastname)
);

drop table if exists actors_photos;
create table actors_photos
(
	id SERIAL PRIMARY KEY,
    photo_id BIGINT UNSIGNED NULL
)

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
    email varchar(100) NOT NULL UNIQUE
);

drop table if exists movies;
create table movies
(
	id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

drop table if exists images;
create table images
(
	id SERIAL PRIMARY KEY,
    image_title VARCHAR(255) NOT NULL
);

drop table if exists trailers;
create table trailers
(
	id SERIAL PRIMARY KEY,
    trailer_name VARCHAR(255) NOT NULL
);

drop table if exists ratings;
create table ratings
(
	id SERIAL PRIMARY KEY,
	rating INT UNSIGNED NOT NULL
);

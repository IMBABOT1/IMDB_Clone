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
    
    INDEX users_fio_idx (firstname, lastname)
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
    
    INDEX movies_title_idx (title),
    INDEX genre_title_idx (genre)
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
    
    INDEX acters_fio (firstname, lastname)
);

drop table if exists movies_actors;
create table movies_actors
(
	movies_id BIGINT UNSIGNED NOT NULL,
    actors_id BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY (movies_id, actors_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id),
    FOREIGN KEY (actors_id) REFERENCES actors(id)
);

drop table if exists images;
create table images
(
	id SERIAL PRIMARY KEY,
    image_title VARCHAR(255) NOT NULL,
    filename VARCHAR(255),
    size INT,
    
    created_at DATETIME default now(),
    updated_at DATETIME ON UPDATE current_timestamp,
    
    INDEX image_imgtitle_idx (image_title)
);

drop table if exists trailers;
create table trailers
(
	id SERIAL PRIMARY KEY,
    trailer_name VARCHAR(255) NOT NULL,
    
	created_at DATETIME default now(),
    updated_at DATETIME ON UPDATE current_timestamp,
    
    INDEX trailers_name_idx (trailer_name)
);

drop table if exists ratings;
create table ratings
(
	id SERIAL PRIMARY KEY,
	rating INT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    movies_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (movies_id) REFERENCES movies(id),
    
    INDEX ratings_rate_idx (rating)
);

drop table if exists actors_photos;
create table actors_photos
(
	id SERIAL PRIMARY KEY,
    photo_id BIGINT UNSIGNED NULL
);

drop table if exists reviews;
create table reviews
(
	id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    body text,
    created_at DATETIME default now(),
    
    INDEX (from_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id)
);



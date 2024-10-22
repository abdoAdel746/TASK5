CREATE DATABASE MOVIE
USE MOVIE
CREATE TABLE actor (
    act_id INTEGER,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);

CREATE TABLE director (
    dir_id INTEGER,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

CREATE TABLE movie (
    mov_id INTEGER,
    mov_title CHAR(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

CREATE TABLE reviewer (
    rev_id INTEGER,
    rev_name CHAR(30)
);

CREATE TABLE rating (
    rev_id INTEGER,
    mov_id INTEGER,
    rev_stars INTEGER,
    num_o_ratings INTEGER
);

CREATE TABLE genres (
    gen_id INTEGER,
    gen_title CHAR(20)
);

CREATE TABLE movie_cast (
    act_id INTEGER,
    mov_id INTEGER,
    role CHAR(30)
);

CREATE TABLE movie_genres (
    mov_id INTEGER,
    gen_id INTEGER
);

CREATE TABLE movie_direction (
    dir_id INTEGER,
    mov_id INTEGER
);

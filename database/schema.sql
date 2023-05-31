CREATE DATABASE catalog;

CREATE TABLE book(
  id INT SERIAL PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(50),
  publish_date DATE,
  archived BOOLEAN DEFAULT FALSE,
  label_id INT REFERENCES label(id),
);

CREATE TABLE label(
  id INT SERIAL PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE music_album(
  id INT SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  archive BOOLEAN,
  genre_id INT REFERENCES genre(id)
);

CREATE TABLE genre(
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- from the terminal run:
-- psql < music.sql

-- Drop existing database if exists
DROP DATABASE IF EXISTS music;

-- Create new database
CREATE DATABASE music;

-- Connect to the newly created database
\c music

-- Table for songs
CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL CHECK (duration_in_seconds > 0),
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

-- Table for artists
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Table for producers
CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Table for song_artists (many-to-many relationship)
CREATE TABLE song_artists (
  song_id INTEGER REFERENCES songs(id),
  artist_id INTEGER REFERENCES artists(id),
  PRIMARY KEY (song_id, artist_id)
);

-- Table for song_producers (many-to-many relationship)
CREATE TABLE song_producers (
  song_id INTEGER REFERENCES songs(id),
  producer_id INTEGER REFERENCES producers(id),
  PRIMARY KEY (song_id, producer_id)
);

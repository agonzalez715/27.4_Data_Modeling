-- from the terminal run:
-- psql < outer_space.sql

-- Table for celestial bodies (e.g., stars)
CREATE TABLE celestial_bodies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL -- e.g., star, planet, moon
);

-- Table for moons
CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planets(id)
);

-- Table for planets
CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years NUMERIC(10, 2) NOT NULL CHECK (orbital_period_in_years > 0),
  celestial_body_id INT NOT NULL,
  galaxy TEXT NOT NULL,
  FOREIGN KEY (celestial_body_id) REFERENCES celestial_bodies(id)
);

-- Insert data into celestial_bodies table
INSERT INTO celestial_bodies (name, type) VALUES
('The Sun', 'star'),
('Proxima Centauri', 'star'),
('Gliese 876', 'star');

-- Insert data into planets table
INSERT INTO planets (name, orbital_period_in_years, celestial_body_id, galaxy) VALUES
('Earth', 1.00, 1, 'Milky Way'),
('Mars', 1.88, 1, 'Milky Way'),
('Venus', 0.62, 1, 'Milky Way'),
('Neptune', 164.8, 1, 'Milky Way'),
('Proxima Centauri b', 0.03, 2, 'Milky Way'),
('Gliese 876 b', 0.23, 3, 'Milky Way');

-- Insert data into moons table
INSERT INTO moons (name, planet_id) VALUES
('The Moon', 1),
('Phobos', 2),
('Deimos', 2),
('Naiad', 4),
('Thalassa', 4),
('Despina', 4),
('Galatea', 4),
('Larissa', 4),
('S/2004 N 1', 4),
('Proteus', 4),
('Triton', 4),
('Nereid', 4),
('Halimede', 4),
('Sao', 4),
('Laomedeia', 4),
('Psamathe', 4),
('Neso', 4);

-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
id SERIAL PRIMARY KEY,
moon_name TEXT NOT NULL,
planet_id INTEGER REFERENCES planets (id)
);

INSERT INTO planets
  (planet_name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way'),
  ('Mars', 1.88, 'The Sun', 'Milky Way'),
  ('Venus', 0.62, 'The Sun', 'Milky Way'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Alpha Centauri'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way');

  INSERT INTO moons
  (moon_name, planet_id)
  VALUES
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
  ('Neireid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laumedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);

  -- very bizarre (not in a good way) error claiming my relations don't exist computer has lost its mind
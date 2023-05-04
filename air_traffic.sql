-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  ticket_id INTEGER REFERENCES tickets
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
  id_ticket INTEGER REFERENCES tickets
);

INSERT INTO tickets
  (seat, departure, arrival, from_city, from_country, to_city, to_country)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'New York', 'United States', 'Charlotte', 'United States'),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

  INSERT INTO passengers
  (first_name, last_name, ticket_id)
  VALUES
  ('Jennifer', 'Finch', 1),
  ('Thadeus', 'Gathercoal', 2),
  ('Sonja', 'Pauley', 3),
  ('Jennifer', 'Finch', 4),
  ('Waneta', 'Skeleton', 5),
  ('Thadeus', 'Gathercoal', 6),
  ('Berkie', 'Wycliff', 7),
  ('Alvin', 'Leathes', 8),
  ('Berkie', 'Wycliff', 9),
  ('Cory', 'Squibbes', 10);

  INSERT INTO airlines
  (airline_name, id_ticket)
  VALUES
  ('United', 1),
  ('British Airways', 2),
  ('Delta', 3),
  ('Delta', 4),
  ('TUI Fly Belgium', 5),
  ('Air China', 6),
  ('United', 7),
  ('American Airlines', 8),
  ('American Airlines', 9),
  ('Avianca Brazil', 10);

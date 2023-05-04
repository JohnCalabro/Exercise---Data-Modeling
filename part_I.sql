CREATE table diseases (
  id SERIAL PRIMARY KEY,
  disease_name TEXT
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  pat_name TEXT,
  disease_id INTEGER REFERENCES diseases (id)
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY, 
  name TEXT,
  patient_id INTEGER REFERENCES patients (id)
);





CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT
);

CREATE TABLE users 
(
  id SERIAL PRIMARY KEY,
  username TEXT,
  pref_reg_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  post_name TEXT,
  category TEXT,
  user_id INTEGER REFERENCES users (id)
);





CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  team_name TEXT,
  ranking INTEGER,
  league_start TEXT,
  league_end TEXT
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  player_name TEXT,
  team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  team_1_id REFERENCES teams (id),
  team_2_id REFERENCES teams (id),
  referee_name TEXT
);

CREATE TABLE goals (
  id SERIAL PRIMARY Keys,
  match_id INTEGER REFERENCES matches (id),
  player_id INTEGER REFERENCES players (id),
  num_of_goals INTEGER
);
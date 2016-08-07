DROP TABLE match;
DROP TABLE team;

CREATE TABLE team (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE match (
  id SERIAL4 PRIMARY KEY,
  home_team_id SERIAL4 REFERENCES team(id) ON DELETE CASCADE,
  away_team_id SERIAL4 REFERENCES team(id) ON DELETE CASCADE,
  home_team_score INT2,
  away_team_score INT2
);

require('pry-byebug')
require_relative('models/matches.rb')
require_relative('models/teams.rb')
require_relative('models/league.rb')

team1 = Team.new( { 'name' => 'The Dazzling Dodgers'})
team2 = Team.new( { 'name' => 'The Belligerent Ball-Duckers'})
team3 = Team.new( { 'name' => 'The Thorough Thrower-of-Balls'})
team4 = Team.new( { 'name' => 'The Unbeatable Underdogs'})

team1.save
team2.save
team3.save
team4.save

match1 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => 19, 'away_team_score' => 26})
match2 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_team_score' => 21, 'away_team_score' => 18})
match3 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team3.id, 'home_team_score' => 23, 'away_team_score' => 14} )
match4 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_team_score' => 2, 'away_team_score' => 27})
match5 = Match.new( { 'home_team_id' => team3.id, 'away_team_id' => team4.id, 'home_team_score' => 8, 'away_team_score' => 14})
match6 = Match.new( { 'home_team_id' => team1.id, 'away_team_id' => team4.id, 'home_team_score' => 21, 'away_team_score' => 20})
match7 = Match.new( { 'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_team_score' => 1, 'away_team_score' => 2})

match1.save
match2.save
match3.save
match4.save
match4.save
match5.save
match6.save
match7.save


binding.pry
nil
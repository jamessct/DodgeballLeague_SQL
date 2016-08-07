require('pg')
require_relative('../db/sql_runner.rb')

class Match

  attr_accessor :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score

  def initialize (options)
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
  end

  def save
    sql = "INSERT INTO match (home_team_id, away_team_id, home_team_score, away_team_score) VALUES (#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, #{@away_team_score}) RETURNING *;"
    match = SqlRunner.run( sql ).first
    @id = match['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM match;"
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new(match)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM match;"
    SqlRunner.run(sql)
  end

  def teams()
    sql = "SELECT * FROM team WHERE id = (#{@home_team_id}) OR id = (#{away_team_id});"
    teams = SqlRunner.run( sql )
    return teams
  end

  def home_team()
    sql = "SELECT * FROM team WHERE (#{@home_team_id}) = id;"
    home_team = SqlRunner.run(sql).first
    return home_team['name']
  end

  def away_team()
    sql = "SELECT * FROM team WHERE (#{@away_team_id}) = id;"
    away_team = SqlRunner.run(sql).first
    return away_team['name']
  end
end
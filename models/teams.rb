require('pg')
require_relative('../db/sql_runner.rb')

class Team
  attr_reader( :id, :name ) 

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO team (name) VALUES ('#{@name}') RETURNING *;"
    team = SqlRunner.run(sql).first
    @id = team['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM team;"
    team = SqlRunner.run(sql)
    result = team.map { |team| Team.new( team ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM team;"
    SqlRunner.run(sql)
  end

  def match
    sql = "SELECT * FROM match WHERE home_team_id OR away_team_id = #{id};"
    match = SqlRunner.run( sql )
    result = match.map { |match| Match.new( match ) }
    return result
  end
end
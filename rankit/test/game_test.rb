require 'game'

class GameTest < Test::Unit::TestCase
  def test_exercise_instance_methods
    team1 = Team.new("Team 1")
    team2 = Team.new("Team 2")
    game = Game.new(team1, 2, team2, 3)
    game.assign_points_to_teams
    assert_equal 0, team1.points
    assert_equal 3, team2.points
    assert_equal game.first_team, team1
    assert_equal game.second_team, team2
  end

end

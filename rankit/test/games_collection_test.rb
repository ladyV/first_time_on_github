require 'games_collection'

class TestGamesCollection < Test::Unit::TestCase

  def test_imporing_data_from_sample_file
    games = GamesCollection.new
    games.import_from_file('test/text_files/input.txt')
    game = games.first

    assert_equal games.length, 5
    assert_instance_of Game, games.first
    assert_equal "Lions", game.first_team.name
    assert_equal "Snakes", game.second_team.name
    assert_equal "3", game.first_team_goals
    assert_equal "3", game.second_team_goals
  end

end

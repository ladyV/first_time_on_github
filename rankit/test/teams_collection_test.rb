require 'test/unit'
require 'teams_collection'
require 'team'

class TestTeamsCollection < Test::Unit::TestCase


  def test_adding_team_to_collection
    team = Team.new("Buh", 3)
    teams = TeamsCollection.new
    teams << team
    teams << team

    assert_equal teams.length, 1
    assert_instance_of Team, teams.first
    assert_equal "Buh", teams.first.name
    assert_equal 6, teams.first.points
  end

  def test_sorting_and_raking_teams
    teams = TeamsCollection.new
    teams << Team.new("Buh", 1) << Team.new("Nuh", 3) << Team.new("Muh", 3) << Team.new("Yuh", 5)

    teams.sort_and_rank

    assert_equal teams.map{ |team| team.name }.join(", ") , "Yuh, Muh, Nuh, Buh"
    assert_equal teams.map{ |team| team.rank }.join(", ") , "1, 2, 2, 4"
  end

  def test_export_into_file
    @filename = 'test/text_files/output.txt'

    delete_output_file

    teams = TeamsCollection.new
    teams << Team.new("Buh", 1) << Team.new("Nuh", 3)

    teams.sort_and_rank
    teams.export_into_file(@filename)

    output_from_file = ""

    File.open(@filename).each{ |f| output_from_file += f }
    expected_output = "1. Nuh, 3 pts\n2. Buh, 1 pt\n\n"

    assert_equal output_from_file, expected_output
  end

   def delete_output_file
     File.delete(@filename) unless !File.exists?(@filename)
   end
end

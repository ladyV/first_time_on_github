require 'test/unit'
require 'team'

class TestTeam < Test::Unit::TestCase

  def test_exercise_instance_methods
    team = Team.new("new team")
    team.points=2
    team.points=3
    assert_not_nil team, "team should not be nil"
    assert_equal team.name, "new team"
    assert_equal team.points, 5
  end

end

class Game
  attr_accessor :first_team, :second_team, :first_team_goals, :second_team_goals

  POINTS_FOR_THE_GAME = { "win" => 3, "loss" => 0, "draw" => 1 }

  def initialize(first_team, first_team_goals, second_team, second_team_goals)
    @first_team  = first_team
    @second_team = second_team
    @first_team_goals  = first_team_goals
    @second_team_goals = second_team_goals
  end

  def assign_points_to_teams
    # compare performance of two teams during the game
    if first_team_goals == second_team_goals
      first_team.points  = POINTS_FOR_THE_GAME["draw"]
      second_team.points = POINTS_FOR_THE_GAME["draw"]
    elsif first_team_goals > second_team_goals
      first_team.points  = POINTS_FOR_THE_GAME["win"]
      second_team.points = POINTS_FOR_THE_GAME["loss"]
    else first_team_goals < second_team_goals
      first_team.points  = POINTS_FOR_THE_GAME["loss"]
      second_team.points = POINTS_FOR_THE_GAME["win"]
    end
  end
end

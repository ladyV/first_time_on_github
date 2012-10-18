class Team
  attr_accessor :name, :points, :rank

  def initialize(name, points=0)
    @name = name
    @points = points
  end

  def points=(points)
    @points += points
  end

end
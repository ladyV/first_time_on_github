class TeamsCollection < Array

  def <<(add_team)
    if self.any? { |team| team.name == add_team.name }
      self.find { |team| team.name == add_team.name }.points = add_team.points
    else
      super(add_team)
    end
  end

  def sort_and_rank
    # sort decsending by number of points
    # teams whith the same number of point are sorted alphabetically
    sort_table
    calculate_ranks
  end

  def export_into_file(filename)
    #print formated output into the file
    begin
      File.open(filename, "a") { |f| f.write formated_output }
    rescue
      puts "Cannot find specified destination file\n Try ./rankit.rb -h for more information"
      exit 0
    end
  end


protected

  def sort_table
    # sort decsending by number of points
    # teams whith the same number of point are sorted alphabetically
    self.sort! do |a,b|
      b.points == a.points ? a.name <=> b.name : b.points <=> a.points
    end
  end

  def calculate_ranks
    # first item in th table should have rank 1
    self.first.rank = 1
    self.length.times do |i|
      # for all team having the same number of points rank should be the same
      if self[i].points == self[i-1].points
        self[i].rank = self[i-1].rank
      else
        self[i].rank = i+1
      end
    end
  end

  def formated_output
    # line of the output should look like: '1. Tarantulas, 6 pts'
    text = ""
    self.each { |team| text += "#{team.rank}. #{team.name}, #{team.points} #{team.points == 1 ? 'pt' : 'pts'}\n" }
    text += "\n"
  end

end

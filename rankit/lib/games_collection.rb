class GamesCollection < Array

  def import_from_file(filename)
    # read the file
    begin
      input_file = File.open(filename)
    rescue
      puts "Cannot find specified source file\n Try ./rankit.rb -h for more information"
      exit 0
    end
    # parse each line from the input file and retrieve data related to each team
    input_file.each { |line| parse_text(line) }
    input_file.close
  end


protected

  def parse_text(game_record)
    # takes one line of test and creates game  with two teams and goals for each team
    game = Game.new(Team.new(game_record.scan(/\s*([^,]+)\s(\d+)/)[0][0]),
                    game_record.scan(/\s*([^,]+)\s(\d+)/)[0][1],
                    Team.new(game_record.scan(/\s*([^,]+)\s(\d+)/)[1][0]),
                    game_record.scan(/\s*([^,]+)\s(\d+)/)[1][1])
    self << game
  end

end

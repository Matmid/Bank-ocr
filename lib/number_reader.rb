require_relative 'file_handler'

class NumberReader

  ## Define all possible combination of underscores and pipes and point them to the relating digit
  DIGITS = {
          " _ " +
          "| |" +
          "|_|" +
          "   "   => 0,
          "   " +
          "  |" +
          "  |" +
          "   "   => 1,
          " _ " +
          " _|" +
          "|_ " +
          "   "   => 2,
          " _ " +
          " _|" +
          " _|" +
          "   "   => 3,
          "   " +
          "|_|" +
          "  |" +
          "   "   => 4,
          " _ " +
          "|_ " +
          " _|" +
          "   "   => 5,
          " _ " +
          "|_ " +
          "|_|" +
          "   "   => 6,
          " _ " +
          "  |" +
          "  |" +
          "   "   => 7,
          " _ " +
          "|_|" +
          "|_|" +
          "   "   => 8,
          " _ " +
          "|_|" +
          " _|" +
          "   "   => 9,
  }

  ## Look at lines array and convert into a string containing digits that relate to the pipes and underscores
  def digit_convert
    begin
      account_number = ''
      pos_count = 0
      digit_pos = [0..2, 3..5, 6..8, 9..11, 12..14, 15..17, 18..20, 21..23, 24..26]
      #return nil if @filehandler.lines[@entry_count] == nil

      while pos_count < 9
        digit = ''
        @filehandler.lines[@entry_count].each do |line|
          digit.concat("#{line[digit_pos[pos_count]]}")
        end
        account_number << "#{DIGITS.fetch(digit)}"
        pos_count += 1
      end
    rescue
      puts "End of File"
      @end_of_file = true
    end

    @entry_count += 1
    return account_number
  end

  def display
    until @end_of_file == true
      puts @filehandler.lines[@entry_count]
      puts digit_convert
    end
  end

  def initialize(path)
    @entry_count = 0
    @end_of_file = false
    @filehandler = FileHandler::FileReader.new(path)
  end

end

numberreader = NumberReader.new('machineresults.txt')

numberreader.display




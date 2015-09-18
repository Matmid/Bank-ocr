require_relative 'file_handler'

class NumberReader

  ## Define all possible combination of underscores and pipes and point them to the relating digit
  DIGITS = {
          " _ " +
          "| |" +
          "|_|" => 0,
          "   " +
          "  |" +
          "  |" => 1,
          " _ " +
          " _|" +
          "|_ " => 2,
          " _ " +
          " _|" +
          " _|" => 3,
          "   " +
          "|_|" +
          "  |" => 4,
          " _ " +
          "|_ " +
          " _|" => 5,
          " _ " +
          "|_ " +
          "|_|" => 6,
          " _ " +
          "  |" +
          "  |" => 7,
          " _ " +
          "|_|" +
          "|_|" => 8,
          " _ " +
          "|_|" +
          " _|" => 9,
  }

  ## displays all account number entries until end of file is reached
  def display
    until @end_of_file == true
      ## displays unconverted pipes and underscores
      puts @filehandler.lines[@entry_count]
      puts "\n"
      ## displays account number as actual integers
      puts "=> " + digit_convert
    end
    puts "\nEnd of File"
  end

  def initialize(path)
    @entry_count = 0
    @end_of_file = false
    ## creates file reader obj taking filename as argument
    ## must be in dir 'machine_result_files'
    @filehandler = FileHandler::FileReader.new(path)
  end

  ## Look at lines array and convert into a string containing digits that relate to the pipes and underscores
  ## returns value of the account number
  def digit_convert
    begin
      account_number = ''
      pos_count = 0
      ## Defines digit positions within the string
      digit_pos = [0..2, 3..5, 6..8, 9..11, 12..14, 15..17, 18..20, 21..23, 24..26]

      ## Loops through each digit
      ## digit saved in format of pipes and underscores
      while pos_count < 9
        digit = ''
        @filehandler.lines[@entry_count].each do |line|
          digit.concat("#{line[digit_pos[pos_count]]}")
        end
        ## checks for the formatted digit in the DIGITS hash
        account_number << "#{DIGITS.fetch(digit)}"
        ## moves on to next digit
        pos_count += 1
      end
    rescue
      @end_of_file = true
    end
    ## Moves on to next account number entry
    @entry_count += 1
    return account_number
  end

end

numberreader = NumberReader.new('machineresults.txt')

numberreader.display




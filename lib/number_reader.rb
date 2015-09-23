require_relative 'file_handler'
require_relative 'account_number'
require_relative 'digits'
require_relative 'input_check'

class NumberReader

  include Digits

  ## displays all account number entries until end of file is reached
  def display
    until @end_of_file == true
      ## displays unconverted pipes and underscores
      puts @filereader.lines[@entry_count]
      puts "\n"
      @account_numbers << digit_convert
      ## Prevents extra '=>' from being shown when end of file is reached
      break if @end_of_file == true
      ## displays account number as actual integers
      puts "=> " + "#{@account_numbers[@entry_count].number}"
      @entry_count += 1
    end
    @filewriter.save(@account_numbers)
    puts "End of File"

    puts "\nValid: \n"
    @account_numbers.each do |account_number|
      if account_number.status == nil
        puts account_number.number
      end
    end


    puts "\nInvalid\n"
    @account_numbers.each do |account_number|
      if account_number.status == "ERR" || account_number.status == "ILL"
        puts account_number.number
      end
    end



  end


  def initialize(path)
    @entry_count = 0
    @end_of_file = false
    @account_numbers = []
    ## creates file reader and writer obj taking filename as argument
    ## must be in dir 'text_files'
    @filereader = FileHandler::FileReader.new(path)
    @filewriter = FileHandler::FileWriter.new(path)
  end

  ## Look at lines array and convert into a string containing digits that relate to the pipes and underscores
  ## returns the account number as an object
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
        @filereader.lines[@entry_count].each do |line|
          digit.concat("#{line[digit_pos[pos_count]]}")
        end
        ## checks for the formatted digit in the DIGITS hash
        begin
          account_number << "#{DIGITS.fetch(digit)}"
        rescue
          ## if digit not found replace it with a '?'
          account_number << '?'
        end
        ## moves on to next digit
        pos_count += 1
      end
    rescue
      @end_of_file = true
    end
    ## Moves on to next account number entry
    account_num = AccountNumber.new(account_number)
    return account_num
  end

end

numberreader = NumberReader.new('machineresults.txt')

numberreader.display





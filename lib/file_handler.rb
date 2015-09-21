require_relative 'validator'

module FileHandler

  APP_ROOT = File.dirname(__FILE__)

  class FileReader
    def initialize(path)
      @filepath = File.join(APP_ROOT, '/../', 'text_files', path)
    end

    ## Read from file and put an array of every 3 lines into the lines array
    def lines
      lines = []
      file = File.new(@filepath, 'r')
      file.each_line.each_slice(4) do |line|
        ## removes 4th line which is always blank
        line.pop
        lines << line

      end
      return lines
    end
  end

  class FileWriter
    def initialize(path)
      @lines = []
      @filepath_write = File.join(APP_ROOT, '/../', 'text_files', File.basename(path,File.extname(path)) + '_output.txt')
    end


    ## Write account number to the file, and status if necessary
    def save(account_numbers)
      ## \t
      file = File.new(@filepath_write, 'w')
      account_numbers.each do |account_number|
        if Validator.checksum(account_number)
          file.puts "#{account_number}"
        elsif account_number.include?('?')
          file.puts "#{account_number}\t" + "ILL"
        else
          file.puts "#{account_number}\t" + "ERR"
        end
      end
      file.close
    end

  end
end

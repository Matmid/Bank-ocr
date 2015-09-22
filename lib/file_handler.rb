require_relative 'account_number'

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
        ## normalises length of line before adding it to array
        lines << line.map {|subline| '%-27.27s' % subline.chomp }
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
      file = File.new(@filepath_write, 'w')
      ## If account number valid then display it without message
      account_numbers.each do |account_number|
        if account_number.status == nil
          file.puts "#{account_number.number}"
          ## if account number contains a illicit value represented by a '?' add message
        elsif account_number.status.include?('?')
          file.puts "#{account_number.number}\t" + "#{account_number.status}"
          ## else account number must not be valid and save error status
        else
          file.puts "#{account_number.number}\t" + "#{account_number.status}"
        end
      end
      file.close
    end


  end
end

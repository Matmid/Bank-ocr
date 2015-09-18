module FileHandler

  APP_ROOT = File.dirname(__FILE__)

  class FileReader
    def initialize(path)
      @filepath = File.join(APP_ROOT, '/../', 'machine_result_files', path)
    end

    ## Read from file and put an array of every 4 lines into the lines array
    def lines
      lines = []
      file = File.new(@filepath, 'r')
      file.each_line.each_slice(4) do |line|
        lines << line
      end

      return lines
    end
  end

end

class NumberReader

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


  APP_ROOT = File.dirname(__FILE__)

  def initialize(path)
    @filepath = File.join(APP_ROOT, '/../', 'machine_result_files', path)
    @entry_count = 0
  end

  def self.filepath=(path=nil)
    @filepath = File.join(APP_ROOT, path)
  end

  def lines
    lines = []
    file = File.new(@filepath, 'r')
    file.each_line.each_slice(4) do |line|
      lines << line
    end
    return lines
  end

  def digit_convert
    account_number = ''
    offset_count = 0
    digit_pos = [0..2, 3..5, 6..8, 9..11, 12..14, 15..17, 18..20, 21..23, 24..26]

    while offset_count < 9
      digit = ''
      lines[@entry_count].each do |line|
        digit.concat("#{line[digit_pos[offset_count]]}")
      end
      account_number << "#{DIGITS.fetch(digit)}"
      offset_count += 1
    end
    @entry_count += 1
    return account_number
  end

  def display
    puts lines[@entry_count]
    puts digit_convert
  end

end



numberreader = NumberReader.new('machineresults.txt')
6.times {
numberreader.display
}
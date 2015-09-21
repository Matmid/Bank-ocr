require 'spec_helper'
require 'file_handler'

describe FileHandler::FileReader do
  let(:filereader) {FileHandler::FileReader.new('machineresults.txt')}

  context 'lines' do
    let(:expected_result) { ["    _  _     _  _  _  _  _ ",
                             "  | _| _||_||_ |_   ||_||_|",
                             "  ||_  _|  | _||_|  ||_| _|"]}

    it "stores account number from file in an array" do
      expect(filereader.lines).to include(expected_result)
    end

    it 'removes blank fourth line before adding the string to the array' do
      filereader.lines.each do |line|
          expect(line.length).to eq(expected_result.length)
      end
    end

    it "returns a value that is 27 characters long at all indices" do
      filereader.lines.each do |line|
        line.each do |subline|
          expect(subline.length).to eq(27)
        end
      end
    end

  end
end

describe FileHandler::FileWriter do
  let(:filewriter) {FileWriter::FileReader.new('machineresults.txt')}

  file = File.join(File.dirname(__FILE__), '/../', 'text_files', File.basename('machineresults.txt',File.extname('machineresults.txt')) + '_output.txt')

  context 'save' do
    let(:expected_result) {"123456789"}
    let(:expected_result1) {"ILL"}
    let(:expected_result2) {"ERR"}
    result = []

    it "writes account number to file" do
      File.open(file).readlines.each do |line|
        result << line.chomp
      end
      expect(result).to include(expected_result)
    end

    it "writes status to file were necessary" do
    result = []

      File.open(file).readlines.each do |line|
        result << line.chomp.split("\t")
      end
    expect(result.to_s).to include(expected_result1 || expected_result2)




    end

  end
end
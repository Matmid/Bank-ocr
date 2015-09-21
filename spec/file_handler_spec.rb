require 'spec_helper'
require 'file_handler'

describe FileHandler::FileReader do
  filereader = FileHandler::FileReader.new('machineresults.txt')

  context 'lines' do
    let(:expected_result) { ["    _  _     _  _  _  _  _ \n",
                             "  | _| _||_||_ |_   ||_||_|\n",
                             "  ||_  _|  | _||_|  ||_| _|\n"]}

    it "stores account number from file in an array" do
      expect(filereader.lines).to include(expected_result)
    end

    it 'removes blank fourth line before adding the string to the array' do
      filereader.lines.each do |line|
          expect(line.length).to eq(expected_result.length)
      end
    end

    it "returns a value with 9 digits at all indices" do
      filereader.lines.each do |line|
        expect(line.to_s.length).to eq(expected_result.to_s.length)
      end

    end

  end
end
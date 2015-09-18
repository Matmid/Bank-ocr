require 'spec_helper'
require 'file_handler'

describe FileHandler::FileReader do
  filereader = FileHandler::FileReader.new('machineresults.txt')

  context 'lines' do
    let(:expected_result) { ["    _  _     _  _  _  _  _ \n",
                             "  | _| _||_||_ |_   ||_||_|\n",
                             "  ||_  _|  | _||_|  ||_| _|\n",
                             "                           \n"]}

    it "should store account number from file in an array" do
      expect(filereader.lines).to include(expected_result)
    end

  end
end
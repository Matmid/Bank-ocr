require 'spec_helper'
require 'number_reader'

describe NumberReader do
  numberreader = NumberReader.new('machineresults.txt')

  context 'lines' do
    let(:expected_result) { ["    _  _     _  _  _  _  _ \n",
                             "  | _| _||_||_ |_   ||_||_|\n",
                             "  ||_  _|  | _||_|  ||_| _|\n",
                             "                           \n"]}

    it "should store account number from file in an array" do
      expect(numberreader.lines).to include(expected_result)
    end

  end

  context 'convert_format' do
    let(:expected_result) { 123456789 }

    it "should convert pipes and underscores to integer" do

    end
  end
end
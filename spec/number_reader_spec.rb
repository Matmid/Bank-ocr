require 'spec_helper'
require 'number_reader'

describe NumberReader do
  numberreader = NumberReader.new('machineresults.txt')


  context 'convert_format' do
    let(:expected_result) { 123456789 }

    it "should convert pipes and underscores to integer" do
      expect(numberreader.digit_convert.to_i).to eq(expected_result)
    end

    it "should return a value with 9 digits" do
      expect(numberreader.digit_convert.to_s.length).to eq(expected_result.to_s.length)
    end

  end
end
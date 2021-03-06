require 'spec_helper'
require 'number_reader'

describe NumberReader do
  numberreader = NumberReader.new('machineresults.txt')


  context 'convert_format' do
    let(:expected_result) { 123456789 }

    it "converts pipes and underscores to number" do
      expect(numberreader.digit_convert.number.to_i).to eq(expected_result)
    end

  end
end
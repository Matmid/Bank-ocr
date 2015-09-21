require 'spec_helper'
require 'validator'

describe Validator do

  context 'checksum' do
  let(:valid) {"123456789"}
  let(:invalid) {"888888888"}

    it 'returns true if account number is valid' do
      expect(Validator.checksum(valid)).to eq(true)
    end

    it 'returns false if account number is invalid' do
      expect(Validator.checksum(invalid)).to eq(false)
    end

  end
end
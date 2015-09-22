require 'spec_helper'
require 'account_number'

describe AccountNumber do
let(:account_number_valid) {AccountNumber.new("123456789")}
let(:account_number_ill) {AccountNumber.new("3333?3333")}
let(:account_number_err) {AccountNumber.new("111111111")}

  it "stores a number for a valid account number" do
    expect(account_number_valid.number).to eq("123456789")
    expect(account_number_valid.status).to eq(nil)
  end

  it "stores a number and 'ILL' for an illicit account number" do
    expect(account_number_ill.number).to eq("3333?3333")
    expect(account_number_ill.status).to eq("ILL")
  end

  it "stores a number and 'ERR' for an invalid account number" do
    expect(account_number_err.number).to eq("111111111")
    expect(account_number_err.status).to eq("ERR")
  end

end
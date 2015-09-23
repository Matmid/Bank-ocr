require 'spec_helper'
require 'input_check'
require 'account_number'

describe do InputCheck
let(:input_check) {InputCheck.new(" _ |_|| |")}

  context 'find_alternatives' do
    let(:expected_result) {['8', '9']}

    it "adds all possible digits to possible_digits array" do
      input_check.find_alternatives
      expect(input_check.instance_variable_get(:@possible_digits)).to eq(expected_result)
    end
  end

  context 'best_alternative' do
    let(:account_number_ill) {AccountNumber.new("3333?3333")}
    let(:account_number_err) {AccountNumber.new("333333333")}
    let(:expected_result) {["333393333"]}

    it "returns a valid account number when status == ILL" do
      input_check.instance_variable_set(:@possible_digits, ['3','9'])
      expect(input_check.best_alternative(account_number_ill)).to eq(expected_result)
    end

    it "returns a valid account number when status == ERR" do
      expect(input_check.best_alternative(account_number_err)).to eq(expected_result)
    end
  end
end
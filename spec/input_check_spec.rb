require 'spec_helper'
require 'input_check'

describe do InputCheck
let(:input_check) {InputCheck.new(" _ |_|| |")}

  context 'find_alternatives' do
    let(:expected_result) {['8', '9']}

    it "adds all possible digits to possible_digits array" do
      input_check.find_alternatives
      expect(input_check.possible_digits).to eq(expected_result)
    end
  end

  context 'best_alternative' do
    let(:account_number) {"333333333"}
    let(:expected_result) {["333393333"]}


    it "returns a valid account number" do
      expect(input_check.best_alternative(account_number)).to eq(expected_result)
    end

  end
end
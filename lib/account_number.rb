require_relative 'validator'

class AccountNumber

  attr_reader :number
  attr_reader :status

  def initialize(number)
    @number = number
    @status = nil
    @status = "ERR" unless Validator.valid?(number)
    @status = "ILL" if number.include?('?')
  end


end
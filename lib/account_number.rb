require_relative 'validator'

class AccountNumber

  attr_accessor :number
  attr_accessor :status

  def initialize(number)
    @number = number
    @status = nil
    @status = "ERR" unless Validator.checksum(number)
    @status = "ILL" if number.include?('?')
  end


end
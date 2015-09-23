require_relative 'validator'
require_relative 'digits'

class InputCheck

  include Digits

  attr_reader :possible_digits

  def initialize(digit)
    @top = digit[0..2]
    @mid = digit[3..5]
    @bot = digit[6..8]
    @possible_digits = []
    @valid_account_numbers = []
  end


  def find_alternatives
    #i = 0
    #i += 1 if @top == "   "
    #i += 1 if @mid == "  |"
    #i += 1 if @bot == "  |"
    #digit = "1" if i >= 2
    #return digit

    x = 0
    while x <= 9
      i = 0
      i += 1 if @top == DIGITS.key(x)[0..2]
      i += 1 if @mid == DIGITS.key(x)[3..5]
      i += 1 if @bot == DIGITS.key(x)[6..8]
      if i >= 2
        @possible_digits << x.to_s
      end
      x += 1
    end

    return '?'
  end

  def best_alternative(account_number)

    #i = account_number.number.split('').index('?') if account_number.status == "ILL"
    @possible_digits = ['9']



    x = 0
    @possible_digits.each do |digit|

      while x < 9
        temp_acc_num = "#{account_number}"
        puts digit
        temp_acc_num[x] = digit
        if Validator.valid?(temp_acc_num)
          puts digit
          @valid_account_numbers << temp_acc_num
        end
        puts temp_acc_num
        x += 1
      end

    return @valid_account_numbers
  end

  end

end




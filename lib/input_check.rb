require_relative 'validator'
require_relative 'digits'

class InputCheck

  include Digits

  ALT_DIGITS = {
      '0' => ['0','8'],
      '1' => ['1','7'],
      '2' => ['2'],
      '3' => ['3','9'],
      '4' => ['4'],
      '5' => ['5','6','9'],
      '6' => ['6','5','8'],
      '7' => ['7','1'],
      '8' => ['8','0','6','9'],
      '9' => ['9','3','5','8']
  }


  def initialize(digit)
    @top = digit[0..2]
    @mid = digit[3..5]
    @bot = digit[6..8]
    @possible_digits = []
    @valid_account_numbers = []
  end


  def find_alternatives
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


    if account_number.status == "ERR"

      ## Determines possible digits for acc_num with ERR
      account_num_array = account_number.number.split('')
      account_num_array.each do |num|
        ALT_DIGITS.fetch(num).each do |dig|
        @possible_digits << dig
        end
      end
      @possible_digits.uniq!

      @possible_digits.each do |digit|
        x = 0
        while x < 9
          temp_acc_num = "#{account_number.number}"
          temp_acc_num[x] = digit
          if Validator.valid?(temp_acc_num)
            @valid_account_numbers << temp_acc_num
          end
          x += 1
        end
        @valid_account_numbers << account_number.number if @valid_account_numbers.empty?
      end

    elsif account_number.status == "ILL"

      @possible_digits.each do |digit|
        x = account_number.number.index('?')
        temp_acc_num = "#{account_number.number}"
        temp_acc_num[x] = digit
        if Validator.valid?(temp_acc_num)
          @valid_account_numbers << temp_acc_num
        end
        @valid_account_numbers << temp_acc_num if @valid_account_numbers.empty?
      end

    else
      @valid_account_numbers << account_number.number
    end


    return @valid_account_numbers
  end
end




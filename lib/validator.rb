class Validator
  ## Returns true if account number is valid
  ## Returns false if account number invalid
  def self.valid?(account_no)
    ## Format account number
    i_array = account_no.reverse.split('')
    ## Perform checksum calulation on formatted account number
    i = 1; val = 0
    i_array.each do |num|
      val += num.to_i * i
      i += 1
    end


    if val % 11 == 0
      return true
    else
      return false
    end



  end
end


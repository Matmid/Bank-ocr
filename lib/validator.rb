class Validator
  ## Returns true if account number is valid
  ## Returns false if account number invalid
  def checksum(account_no)
    ## Format account number
    i_array = account_no.reverse.split('')
    x = 1; val = 0
    while x <= 9
      val += (i_array[(x - 1)].to_i * x)
      x += 1
    end

    if val % 11 == 0
      return true
    else
      return false
    end

  end
end

class DifferentCurrencyCodeError < StandardError

end

class Currency
  attr_reader :amount, :code
  def initialize(amount, code)
    @amount = amount
    @code = code
  end

  def ==(currency_object)
    if currency_object.amount == @amount &&
      currency_object.code == @code
      return true
    else
      return false
    end
  end

  def +(currency_object)
    if currency_object.code == @code
      currency_object.amount + @amount
    else
      raise DifferentCurrencyCodeError, "The currency codes between these do not match."
      return nil
    end
  end

  def -(currency_object)
    if currency_object.code == @code
      @amount - currency_object.amount
    else
      raise DifferentCurrencyCodeError, "The currency codes between these do not match."
      return nil
    end
  end

  def *(number)
    @amount * number
  end

end

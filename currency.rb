class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_reader :amount, :code
  def initialize(amount, code = nil)
    if amount.class == Fixnum || amount.class == Float
      @amount = amount
      @code = code
    elsif amount.class == String
      @amount = amount[1..-1].to_f
      @code = symbol_code(amount[0])
    else
      raise UnknownCurrencyCodeError, "Unrecognized currency."
    end
  end

  def symbol_code(symbol)
    code_lookup = { "$" => "USD",
      "€" => "EUR",
      "¥" => "JPY",
      "£" => "GBP",
      "₹" => "INR",
      "R" => "ZAR"}
      
    if code_lookup.has_key?(symbol)
      return code_lookup[symbol]
    else raise UnknownCurrencyCodeError, "Unrecognized currency symbol."
    end
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
      raise DifferentCurrencyCodeError, "The currency codes between these items does not match."
      return nil
    end
  end

  def *(number)
    @amount * number
  end

end

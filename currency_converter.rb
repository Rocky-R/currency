class UnknownCurrencyCodeError < StandardError
end

class CurrencyConverter
  def initialize(rates)
    @conversion_rates = rates
  end

  def convert(currency, conv_code)
    if @conversion_rates.include?(conv_code)
      @conversion_rates[conv_code] / currency.amount
    else
      raise UnknownCurrencyCodeError, "Unknown currency #{conv_code}"
    end
  end
end

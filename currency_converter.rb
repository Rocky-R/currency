class CurrencyConverter
  def initialize(rates)
    @conversion_rates = rates
  end

  def convert(currency, conv_code)
    @conversion_rates[conv_code] / currency.amount
  end
end

class CurrencyConverter
  def initialize(rates)
    @conversion_rates = rates
  end

  def convert(currency, conv_code)
    currency.amount * @conversion_rates[conv_code]
  end
end

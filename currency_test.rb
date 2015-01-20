require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
  def test_if_currency_class_exists
    assert Currency
  end

  def test_currency_has_creation_arguments
    assert Currency.new(100, "usd")
  end


end

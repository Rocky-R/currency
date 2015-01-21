require 'minitest/autorun'
require 'minitest/pride'
require './currency'
require './currency_converter'

class CurrencyTest < Minitest::Test
  def test_00_if_currency_class_exists
      assert Currency
  end

  def test_01_currency_has_creation_arguments
      assert Currency.new("", "")
  end

  def test_02_different_currecy_object_equality
    us_dollars = Currency.new(100, :USD)
    ca_dollars = Currency.new(100, :USD)
    abu_dhabi = Currency.new(100, :AED)
    assert_equal true, us_dollars == ca_dollars
    refute us_dollars == abu_dhabi
  end

  def test_03_if_like_currencies_can_be_added
    us_dollars = Currency.new(100, :USD)
    ca_dollars = Currency.new(50, :USD)
    assert_equal 150, us_dollars + ca_dollars
  end

  def test_04_if_like_currencies_can_be_subtracted
    us_dollars = Currency.new(100, :USD)
    ca_dollars = Currency.new(50, :USD)
    assert_equal 50, us_dollars - ca_dollars
  end

  def test_05_error_raised_for_mismatched_codes
    us_dollars = Currency.new(100, :USD)
    abu_dhabi = Currency.new(75, :AED)

    assert_raises(DifferentCurrencyCodeError) do
      us_dollars + abu_dhabi
    end

    assert_raises(DifferentCurrencyCodeError) do
      us_dollars - abu_dhabi
    end
  end

  def test_06_multiplying_currency_by_fixnum_or_float
    us_dollars = Currency.new(100, :USD)
    assert_equal 1000, us_dollars * 10
    assert_equal 50, us_dollars * 0.5
  end

  def test_07_if_currency_converter_class_exists
    assert CurrencyConverter
  end

  def test_08_test_if_currency_can_be_converted
    converter = CurrencyConverter.new({ USD: 1.00, EUR: 0.86, AED: 3.67 })
    us_dollars = Currency.new(1, :USD)
    assert_equal 0.86, converter.convert(us_dollars, :EUR)
  end


end

require 'minitest/autorun'
require 'minitest/pride'
require './currency'

class CurrencyTest < Minitest::Test
    def test_if_currency_class_exists
      assert Currency
    end

    def test_currency_has_creation_arguments
      assert Currency.new("", "")
    end

  def test_different_currecy_object_equality
    us_dollars = Currency.new(100, "USD")
    ca_dollars = Currency.new(100, "USD")
    assert_equal true, us_dollars == ca_dollars
  end

  def test_if_like_currencies_can_be_added
    us_dollars = Currency.new(100, "USD")
    ca_dollars = Currency.new(50, "USD")
    assert_equal 150, us_dollars + ca_dollars
  end

  def test_if_like_currencies_can_be_subtracted
    us_dollars = Currency.new(100, "USD")
    ca_dollars = Currency.new(50, "USD")
    assert_equal 50, us_dollars - ca_dollars
  end

  def test_error_raised_for_mismatched_codes
    us_dollars = Currency.new(100, "USD")
    abu_dhabi = Currency.new(75, "AED")

    assert_raises(DifferentCurrencyCodeError) do
      us_dollars + abu_dhabi
    end

    assert_raises(DifferentCurrencyCodeError) do
      us_dollars - abu_dhabi
    end
  end

  def test_multiplying_currency_by_fixnum_or_float
    us_dollars = Currency.new(100, "USD")
    assert_equal 1000, us_dollars * 10
  end
end

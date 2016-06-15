require "test-unit"
require_relative "../src/Calc"

class TestCalc < Test::Unit::TestCase

  def test_return_zero
    assert_equal(0, Calc.add(""))
  end

  def test_return_same_number
    assert_equal(1, Calc.add("1"))
    assert_equal(0, Calc.add("0"))
    assert_equal(100, Calc.add("100"))
  end

  def test_return_number_summation
    assert_equal(120, Calc.add("100, 20"))
    assert_equal(121, Calc.add("100, 20, 1"))
  end

end

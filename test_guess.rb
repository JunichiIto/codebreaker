require 'test/unit'
require './guess.rb'

class TestCase_CodeBreakerGuess < Test::Unit::TestCase
  def test_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: no matches
    assert_equal("",      guess.confirm("5555"))
  end

  def test1_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: 1 number correct
    assert_equal("+",     guess.confirm("1555"))
    assert_equal("-",     guess.confirm("2555"))
  end

  def test2_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: 2 numbers correct
    assert_equal("++",    guess.confirm("5254"))
    assert_equal("+-",    guess.confirm("5154"))
    assert_equal("--",    guess.confirm("2545"))
  end

  def test3_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: 3 numbers correct
    assert_equal("+++",    guess.confirm("5234"))
    assert_equal("++-",    guess.confirm("5134"))
    assert_equal("+--",    guess.confirm("5124"))
    assert_equal("---",    guess.confirm("5123"))
  end

  def test4_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: all numbers correct
    assert_equal("++++",    guess.confirm("1234"))
    assert_equal("++--",    guess.confirm("1243"))
    assert_equal("+---",    guess.confirm("1423"))
    assert_equal("----",    guess.confirm("4321"))
  end

  def test_other_confirm
    guess = CodeBreaker::Guess.new("1234")
    # Scenarios: matches with duplicates
    assert_equal("+",       guess.confirm("1155"))
  end
end

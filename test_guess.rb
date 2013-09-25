require 'test/unit'
require './guess.rb'

class TestCase_CodeBreakerGuess < Test::Unit::TestCase
  def test_1234_confirm
    guess = CodeBreaker::Guess.new("1234")

    # Scenarios: no matches
    assert_equal("",      guess.confirm("5555"))

    # Scenarios: 1 number correct
    assert_equal("+",     guess.confirm("1555"))
    assert_equal("-",     guess.confirm("2555"))

    # Scenarios: 2 numbers correct
    assert_equal("++",    guess.confirm("5254"))
    assert_equal("+-",    guess.confirm("5154"))
    assert_equal("--",    guess.confirm("2545"))

    # Scenarios: 3 numbers correct
    assert_equal("+++",    guess.confirm("5234"))
    assert_equal("++-",    guess.confirm("5134"))
    assert_equal("+--",    guess.confirm("5124"))
    assert_equal("---",    guess.confirm("5123"))

    # Scenarios: all numbers correct
    assert_equal("++++",    guess.confirm("1234"))
    assert_equal("++--",    guess.confirm("1243"))
    assert_equal("+---",    guess.confirm("1423"))
    assert_equal("----",    guess.confirm("4321"))

    # Scenarios: matches with duplicates
    assert_equal("+",       guess.confirm("1155"))
    assert_equal("-",       guess.confirm("5115"))
    assert_equal("-",       guess.confirm("5115"))
  end
  def test_1134_confirm
    guess = CodeBreaker::Guess.new("1134")
    assert_equal("++",       guess.confirm("1155"))
    assert_equal("+-",       guess.confirm("5115"))
    assert_equal("--",       guess.confirm("5511"))
    assert_equal("++",       guess.confirm("1115"))
    assert_equal("+-",       guess.confirm("5111"))
  end
  def test_1155_confirm
    guess = CodeBreaker::Guess.new("1155")
    assert_equal("+",        guess.confirm("1234"))
  end
  def test_1111_confirm
    guess = CodeBreaker::Guess.new("1111")
    assert_equal("+++",      guess.confirm("1112"))
  end
  def test_1113_confirm
    guess = CodeBreaker::Guess.new("1113")
    assert_equal("++-",      guess.confirm("1121"))
  end
  def test_3111_confirm
    guess = CodeBreaker::Guess.new("3111")
    assert_equal("++--",     guess.confirm("1311"))
  end
  def test_3114_confirm
    guess = CodeBreaker::Guess.new("3114")
    assert_equal("--",       guess.confirm("1251"))
  end
  def test_1511_confirm
    guess = CodeBreaker::Guess.new("1511")
    assert_equal("-",        guess.confirm("2134"))
  end
end

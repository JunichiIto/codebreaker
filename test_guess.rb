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
    assert_equal("-",       guess.confirm("5115"))
    assert_equal("-",       guess.confirm("5115"))
  end
  def test_other1_confirm
    guess = CodeBreaker::Guess.new("1134")
    # Scenarios: matches with duplicates
    assert_equal("++",       guess.confirm("1155"))
    assert_equal("+-",       guess.confirm("5115"))
    assert_equal("--",       guess.confirm("5511"))
    assert_equal("++",       guess.confirm("1115"))
    assert_equal("+-",       guess.confirm("5111"))
  end
  def test_other2_confirm
    guess = CodeBreaker::Guess.new("1155")
    # Scenarios: matches with duplicates
    assert_equal("+",        guess.confirm("1234"))
  end
  def test_other3_confirm
    guess = CodeBreaker::Guess.new("1111")
    # Scenarios: matches with duplicates
    assert_equal("+++",      guess.confirm("1112"))
  end
  def test_other4_confirm
    guess = CodeBreaker::Guess.new("1113")
    # Scenarios: matches with duplicates
    assert_equal("++-",      guess.confirm("1121"))
  end
  def test_other5_confirm
    guess = CodeBreaker::Guess.new("3111")
    # Scenarios: matches with duplicates
    assert_equal("++--",     guess.confirm("1311"))
  end
  def test_other6_confirm
    guess = CodeBreaker::Guess.new("3114")
    # Scenarios: matches with duplicates
    assert_equal("--",       guess.confirm("1251"))
  end
  def test_other7_confirm
    guess = CodeBreaker::Guess.new("1511")
    # Scenarios: matches with duplicates
    assert_equal("-",        guess.confirm("2134"))
  end
end

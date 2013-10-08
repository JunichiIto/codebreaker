# coding: utf-8
class Guess
  def initialize(answer)
    @answer = answer
  end

  def confirm(guess)
    guess_chars, answer_chars = [guess, @answer].map(&:chars).map(&:to_a)

    plus_mark_search(guess_chars, answer_chars).tap do |plus_mark|
      # Delete exactly matched numbers
      [answer_chars, guess_chars].map(&:compact!)

      plus_mark << minus_mark_search(answer_chars, guess_chars)
    end
  end

  private

  # このメソッドを呼ぶと引数の中身が変わるので、あまり良いメソッドではない
  def plus_mark_search(answer_chars, guess_chars)
    # Exact match number search.
    answer_chars.each_with_index.each_with_object('') do |(answer_char, i), mark|
      if answer_char == guess_chars[i]
        mark << '+'
        answer_chars[i] = guess_chars[i] = nil
      end
    end
  end

  def minus_mark_search(answer_chars, guess_chars)
    answer_chars.each_with_object('') do |answer_char, mark|
      guess_chars.each_with_index do |guess_char, i|
        if answer_char == guess_char
          mark << '-'
          guess_chars.delete_at(i)
        end
      end
    end
  end
end

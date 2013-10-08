# coding: utf-8
class Guess
  def initialize(answer)
    @answer = answer
  end

  def confirm(guess)
    guess_chars, answer_chars = [guess, @answer].map(&:chars).map(&:to_a)

    plus_mark = search_plus_mark(guess_chars, answer_chars)

    # Delete exactly matched numbers
    [answer_chars, guess_chars].map(&:compact!)

    plus_mark + search_minus_mark(answer_chars, guess_chars)
  end

  private

  # このメソッドを呼ぶと引数の中身が変わるので、あまり良いメソッドではない
  def search_plus_mark(answer_chars, guess_chars)
    # Exact match number search.
    answer_chars.each_with_index.each_with_object('') do |(answer_char, i), mark|
      if answer_char == guess_chars[i]
        mark << '+'
        answer_chars[i] = guess_chars[i] = nil
      end
    end
  end

  def search_minus_mark(answer_chars, guess_chars)
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

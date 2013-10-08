# coding: utf-8
class Guess
  def initialize(answer)
    @answer = answer
  end

  def confirm(guess)
    answer_chars, guess_chars = [@answer, guess].map(&:chars).map(&:to_a)

    plus_mark_search(answer_chars, guess_chars).tap do |plus_mark|
      plus_mark << minus_mark_search(*[answer_chars, guess_chars].map(&:compact))
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

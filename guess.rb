class Guess
  def initialize(answer)
    @answer = answer
  end

  def confirm(guess)
    guess_chars = guess.split('')
    answer_chars = @answer.split('')
    ret = []

    # Exact match number search.
    answer_chars.each_with_index do |answer_char, i|
      if answer_char == guess_chars[i]
        ret << '+'
        answer_chars[i] = guess_chars[i] = nil
      end
    end

    # Delete exactly matched numbers
    [answer_chars, guess_chars].map(&:compact!)

    answer_chars.each do |answer_char|
      guess_chars.each_with_index do |guess_char, i|
        if answer_char == guess_char
          ret << '-'
          guess_chars.delete_at(i)
        end
      end
    end

    ret.join
  end
end

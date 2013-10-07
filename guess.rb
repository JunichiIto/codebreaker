class Guess
  def initialize(answer)
    @answer = answer
  end
  def confirm(number)
    guess_chars = number.split('')
    answer_chars = @answer.split('')
    ret = []
    # Exact match number search.
    answer_chars.each_with_index do |ans,i|
      if ans == guess_chars[i]
        ret << '+'
        answer_chars[i] = guess_chars[i] = nil
      end
    end
    # Exact match number is delete.
    [answer_chars, guess_chars].map(&:compact!)
    answer_chars.each do |ans|
      guess_chars.each_with_index do |gue,i|
        if ans == gue
          ret << '-'
          guess_chars.delete_at(i)
        end
      end
    end
    ret.join
  end
end

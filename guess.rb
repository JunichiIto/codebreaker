class Guess
  def initialize(answer)
    @answer_chars = answer.split('')
  end
  def confirm(num)
    guess = [] ; ret = []
    num.each_char{|c| guess << c}
    answer = @answer_chars.clone
    # Exact match number search.
    @answer_chars.each_with_index do |ans,i|
      if ans == guess[i]
        ret << '+'
        answer[i] = guess[i] = nil
      end
    end
    # Exact match number is delete.
    answer.compact! ; guess.compact!
    answer.each do |ans|
      guess.each_with_index do |gue,i|
        if ans == gue
          ret << '-'
          guess.delete_at(i)
        end
      end
    end
    ret.join
  end
end

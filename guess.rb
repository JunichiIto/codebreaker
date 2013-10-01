module CodeBreaker
  class Guess
    def initialize(answer)
      @ans = []
      answer.each_char{|c| @ans << c}
    end
    def confirm(guess)
      gue = [] ; ret = []
      guess.each_char{|c| gue << c}
      ans = @ans.clone
      # Exact match number search.
      @ans.each_with_index do |answer,i|
        if answer == gue[i]
          ret << '+'
          ans[i] = gue[i] = nil
        end
      end
      # Exact match number is delete.
      ans.compact! ; gue.compact!
      ans.each do |answer|
        gue.each_with_index do |guess,i|
          if answer == guess
            ret << '-'
            gue.delete_at(i)
          end
        end
      end
      ret.join
    end
  end
end

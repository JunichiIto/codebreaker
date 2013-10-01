module CodeBreaker
  class Guess
    def initialize(answer)
      @ans = []
      answer.each_char{|c| @ans << c}
    end
    def confirm(guess)
      gue = []
      ret = []
      guess.each_char{|c| gue << c}
      ans = @ans.clone
      @ans.each_with_index do |answer,i|
        if answer == gue[i]
          ret << '+'
          ans[i] = nil
          gue[i] = nil
        end
      end
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

$match = []
module CodeBreaker
  class Guess
    def initialize(answer)
      /(.)(.)(.)(.)/ =~ answer
      @a1, @a2, @a3, @a4 = $1, $2, $3, $4
    end
    def confirm(guess)
      /(.)(.)(.)(.)/ =~ guess
      @g1, @g2, @g3, @g4 = $1, $2, $3, $4
      $match.clear
    
      case @g1
      when @a1
        $match << "+"
      end
      case @g2
      when @a2
        $match << "+"
      end
      case @g3
      when @a3
        $match << "+"
      end
      case @g4
      when @a4
        $match << "+"
      end
      case @g1
      when @a2, @a3, @a4
        $match << "-"
      end
      case @g2
      when @a1, @a3, @a4
        $match << "-"
      end
      case @g3
      when @a1, @a2, @a4
        $match << "-"
      end
      case @g4
      when @a1, @a2, @a3
        $match << "-"
      end
      return $match.join
    end
  end
end


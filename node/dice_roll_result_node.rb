require_relative 'parenthesizer'

module Node
  class DiceRollResultNode
    include Parenthesizer

    attr_reader :dice_roll
    attr_reader :result
    attr_reader :n
    attr_reader :faces

    def initialize(dice_roll, result)
      @dice_roll = dice_roll
      @result = result

      @evaled_n = @dice_roll.n.evaluate
      @evaled_faces = @dice_roll.faces.evaluate
      @sum = result.inject(0, &:+)
    end

    def number?
      false
    end

    def primary?
      true
    end

    def evaluate
      @sum
    end
    alias sum evaluate

    def determine!
      self
    end

    def to_s_exp
      result_s_exp = "(list #{result.join(' ')})"
      "(dice-roll-result #{@dice_roll.to_s_exp} #{result_s_exp})"
    end

    def to_infix_notation
      infix =
        if @dice_roll.n.number? && @dice_roll.faces.number?
          @dice_roll.to_infix_notation
        else
          "#{@dice_roll.to_infix_notation} = #{@evaled_n}d#{@evaled_faces}"
        end

       "{#{infix} => #{@result} = #{@sum}}"
    end

    def inspect
      "#<#{self.class} n=#{@dice_roll.n} faces=#{@dice_roll.faces} = " \
        "#{@evaled_n}d#{@evaled_faces} => #{@result} = #{@sum}>"
    end
    alias to_s inspect
  end
end

require_relative 'parenthesizer'

module Node
  class DiceRollResultNode
    include Parenthesizer

    attr_reader :result
    attr_reader :n
    attr_reader :faces

    def initialize(result, n, faces)
      @result = result

      @n = n
      @evaled_n = n.evaluate
      if @evaled_n < 1
        raise ArgumentError, 'number of dice must be equal or larger than 1'
      end

      @faces = faces
      @evaled_faces = faces.evaluate
      if @evaled_faces < 1
        raise ArgumentError, 'number of faces must be equal or larger than 1'
      end

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

    def to_infix_notation
      before_eval =
        "#{parenthesize_for_infix(@n)}d#{parenthesize_for_infix(@faces)}"
      infix =
        if @n.number? && @faces.number?
          before_eval
        else
          "#{before_eval} = #{@evaled_n}d#{@evaled_faces}"
        end

       "{#{infix} => #{@result} = #{@sum}}"
    end

    def inspect
      "#<#{self.class} n=#{@n} faces=#{@faces} = " \
        "#{@evaled_n}d#{@evaled_faces} => #{@result} = #{@sum}"
    end
    alias to_s inspect
  end
end

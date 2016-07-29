require_relative 'dice_roll_result_node'
require_relative 'parenthesizer'

module Node
  class DiceRollNode
    include Parenthesizer

    attr_reader :n
    attr_reader :faces

    def initialize(n, faces)
      @n = n
      @faces = faces
    end

    def number?
      false
    end

    def primary?
      true
    end

    def determine!
      @n = @n.determine!
      @faces = @faces.determine!

      evaluated_n = @n.evaluate
      if evaluated_n < 1
        raise RangeError, 'number of dice must be equal or larger than 1'
      end

      evaluated_faces = @faces.evaluate
      if evaluated_faces < 1
        raise RangeError, 'number of faces must be equal or larger than 1'
      end

      result = Array.new(evaluated_n) { rand(1..evaluated_faces) }
      DiceRollResultNode.new(self, result)
    end

    def to_s_exp
      "(dice-roll #{@n.to_s_exp} #{@faces.to_s_exp})"
    end

    def to_infix_notation
      "#{parenthesize_for_infix(@n)}d#{parenthesize_for_infix(@faces)}"
    end

    def inspect
      "#<#{self.class} n=#{@n} faces=#{@faces}>"
    end
    alias to_s inspect
  end
end

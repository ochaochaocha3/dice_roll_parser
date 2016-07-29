require_relative 'parenthesizer'

module Node
  class BinaryOpNode
    include Parenthesizer

    attr_reader :op
    attr_reader :lhs
    attr_reader :rhs

    def initialize(op, lhs, rhs, op_for_display: op)
      @op = op
      @op_for_display = op_for_display
      @lhs = lhs
      @rhs = rhs
    end

    def number?
      false
    end

    def primary?
      false
    end

    def evaluate
      @lhs.
        evaluate.
        send(@op, @rhs.evaluate)
    end

    def determine!
      @lhs = @lhs.determine!
      @rhs = @rhs.determine!

      self
    end

    def to_s_exp
      "(#{@op} #{@lhs.to_s_exp} #{@rhs.to_s_exp})"
    end

    def to_infix_notation
      "#{parenthesize_for_infix(@lhs)} #{@op_for_display} #{parenthesize_for_infix(@rhs)}"
    end

    def inspect
      "#<#{self.class} op=#{@op.inspect} op_for_display=#{@op_for_display.inspect} lhs=#{@lhs} rhs=#{@rhs}>"
    end
    alias to_s inspect
  end
end

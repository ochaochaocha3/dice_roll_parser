require_relative 'parenthesizer'

module Node
  class BinaryOpNode
    include Parenthesizer

    attr_reader :op
    attr_reader :lhs
    attr_reader :rhs

    def initialize(op, lhs, rhs)
      @op = op
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

    def to_infix_notation
      "#{parenthesize_for_infix(@lhs)} #{@op} #{parenthesize_for_infix(@rhs)}"
    end

    def inspect
      "#<#{self.class} op=#{@op} lhs=#{@lhs} rhs=#{@rhs}>"
    end
    alias to_s inspect
  end
end

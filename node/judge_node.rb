require_relative 'binary_op_node'

module Node
  class JudgeNode < BinaryOpNode
    def initialize(op, lhs, rhs)
      super(op, lhs, rhs)
    end

    def evaluate
      @lhs.evaluate.send(@op, @rhs.evaluate) ? :success : :failure
    end
  end
end

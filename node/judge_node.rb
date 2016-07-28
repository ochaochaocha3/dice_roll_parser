require_relative 'binary_op_node'

module Node
  class JudgeNode < BinaryOpNode
    def initialize(op, lhs, rhs, op_for_display: op)
      super(op, lhs, rhs, op_for_display: op_for_display)
    end

    def evaluate
      @lhs.evaluate.send(@op, @rhs.evaluate) ? :success : :failure
    end
  end
end

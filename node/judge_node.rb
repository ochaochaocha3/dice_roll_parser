require_relative 'binary_op_node'

module Node
  class JudgeNode < BinaryOpNode
    OP_FOR_JUDGE = {
      :'<>' => :!=,
      :'=' => :==
    }

    def initialize(op, lhs, rhs)
      super(OP_FOR_JUDGE[op] || op, lhs, rhs, op_for_display: op)
    end

    def evaluate
      @lhs.evaluate.send(@op, @rhs.evaluate) ? :success : :failure
    end
  end
end

require_relative 'binary_op_node'

module Node
  class InclusionJudgeNode
    include Parenthesizer

    def initialize(value, min, max, include_min: true, include_max: true)
      @value = value
      @min = min
      @max = max
      @include_min = include_min
      @include_max = include_max
    end

    def number?
      false
    end

    def primary?
      false
    end

    def evaluate
      value = @value.evaluate

      op_min = less_than_sign(@include_min)
      return :failure unless @min.evaluate.send(op_min, value)

      op_max = less_than_sign(@include_max)
      return :failure unless value.send(op_max, @max.evaluate)

      :success
    end

    def determine!
      @value = @value.determine!
      @min = @min.determine!
      @max = @max.determine!

      self
    end

    def to_infix_notation
      value = parenthesize_for_infix(@value)
      left_paren = @include_min ? '[' : '('
      min = parenthesize_for_infix(@min)
      max = parenthesize_for_infix(@max)
      right_paren = @include_max ? ']' : ')'

      "#{value} E #{left_paren}#{min}, #{max}#{right_paren}"
    end

    def inspect
      "#<#{self.class} value=#{@value} min=#{@min} max=#{@max} include_min=#{@include_min} include_max=#{@include_max}>"
    end
    alias to_s inspect

    private

    def less_than_sign(equality)
      equality ? :<= : :<
    end
  end
end

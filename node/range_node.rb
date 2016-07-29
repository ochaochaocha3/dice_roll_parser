require_relative 'range_result_node'
require_relative 'parenthesizer'

module Node
  class RangeNode
    include Parenthesizer

    attr_reader :min
    attr_reader :max

    def initialize(min, max)
      @min = min
      @max = max
    end

    def number?
      false
    end

    def primary?
      true
    end

    def determine!
      @min = @min.determine!
      @max = @max.determine!

      result = rand((@min.evaluate)..(@max.evaluate))

      RangeResultNode.new(self, result)
    end

    def to_s_exp
      "(range #{@min.to_s_exp} #{@max.to_s_exp})"
    end

    def to_infix_notation
      "[#{parenthesize_for_infix(@min)}..#{parenthesize_for_infix(@max)}]"
    end

    def inspect
      "#<#{self.class} min=#{@min} max=#{@max}>"
    end
    alias to_s inspect
  end
end

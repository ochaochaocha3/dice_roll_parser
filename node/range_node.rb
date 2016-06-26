require_relative 'range_result_node'

module Node
  class RangeNode
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

      RangeResultNode.new(result, @min, @max)
    end

    def inspect
      "#<#{self.class} min=#{@min} max=#{@max}>"
    end
    alias to_s inspect
  end
end

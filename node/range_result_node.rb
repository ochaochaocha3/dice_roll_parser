require_relative 'parenthesizer'

module Node
  class RangeResultNode
    include Parenthesizer

    attr_reader :value
    attr_reader :min
    attr_reader :max

    def initialize(value, min, max)
      @value = value

      @min = min
      @evaled_min = min.evaluate

      @max = max
      @evaled_max = max.evaluate
    end

    def number?
      false
    end

    def primary?
      true
    end

    def evaluate
      @value
    end

    def determine!
      self
    end

    def to_infix_notation
      before_eval = "[#{parenthesize_for_infix(@min)}..#{parenthesize_for_infix(@max)}]"
      infix =
        if @min.number? && @max.number?
          before_eval
        else
          "#{before_eval} = [#{@evaled_min}..#{@evaled_max}]"
        end

      "{#{infix} => #{@value}}"
    end

    def inspect
      "#<#{self.class} min=#{@min} max=#{@max} " \
        "= [#{@evaled_min}..#{@evaled_max}] => #{@value}>"
    end
    alias to_s inspect
  end
end

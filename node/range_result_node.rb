require_relative 'parenthesizer'

module Node
  class RangeResultNode
    include Parenthesizer

    attr_reader :value
    attr_reader :min
    attr_reader :max

    def initialize(range, value)
      @range = range
      @value = value

      @evaled_min = range.min.evaluate
      @evaled_max = range.max.evaluate
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

    def to_s_exp
      "(range-result #{@range.to_s_exp} #{@value})"
    end

    def to_infix_notation
      infix =
        if @range.min.number? && @range.max.number?
          @range.to_infix_notation
        else
          "#{@range.to_infix_notation} = [#{@evaled_min}..#{@evaled_max}]"
        end

      "{#{infix} => #{@value}}"
    end

    def inspect
      "#<#{self.class} min=#{@range.min} max=#{@range.max} " \
        "= [#{@evaled_min}..#{@evaled_max}] => #{@value}>"
    end
    alias to_s inspect
  end
end

module Node
  class UnaryMinusNode
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def number?
      false
    end

    def primary?
      true
    end

    def evaluate
      -(@value.evaluate)
    end

    def determine!
      @value = @value.determine!
      self
    end

    def to_infix_notation
      "-(#{@value.to_infix_notation})"
    end

    def inspect
      "#<#{self.class} value=#{@value}>"
    end
    alias to_s inspect
  end
end

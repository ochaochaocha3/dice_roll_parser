module Node
  class NumNode
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def number?
      true
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
      @value.to_s
    end

    def inspect
      "#<#{self.class} #{@value}>"
    end
    alias to_s inspect
  end
end

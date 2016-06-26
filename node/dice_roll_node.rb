require_relative 'dice_roll_result_node'

module Node
  class DiceRollNode
    def initialize(n, faces)
      @n = n
      @faces = faces
    end

    def number?
      false
    end

    def primary?
      true
    end

    def determine!
      @n = @n.determine!
      @faces = @faces.determine!

      result = Array.new(@n.evaluate) { rand(1..(@faces.evaluate)) }

      DiceRollResultNode.new(result, @n, @faces)
    end

    def inspect
      "#<#{self.class} n=#{@n} faces=#{@faces}>"
    end
    alias to_s inspect
  end
end

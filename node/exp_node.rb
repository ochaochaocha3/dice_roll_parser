require 'forwardable'

module Node
  class ExpNode
    extend Forwardable

    attr_reader :content

    def initialize(content)
      @content = content
    end

    def_delegators :@content,
      :number?, :primary?, :evaluate, :to_infix_notation

    def determine!
      @content = @content.determine!

      self
    end

    def inspect
      "#<#{self.class} #{@content}>"
    end
    alias to_s inspect
  end
end

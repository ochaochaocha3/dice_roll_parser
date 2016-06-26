module Node
  module Parenthesizer
    module_function
    def parenthesize_for_infix(x)
      infix = x.to_infix_notation
      x.primary? ? infix : "(#{infix})"
    end
  end
end

class DiceRollParser
prechigh
  nonassoc RANGE
  nonassoc DICE_ROLL
  nonassoc SHORT_DICE_ROLL
  nonassoc UMINUS
  left '*' '/'
  left '+' '-'
preclow

rule
  target: exp {
            unless val[0].kind_of?(ExpNode)
              result = ExpNode.new(val[0])
            end
          }
        | /* none */ {
            result = ExpNode.new(NumNode.new(0))
          }

  exp: exp '+' exp {
         result = BinaryOpNode.new(:+, val[0], val[2])
       }
     | exp '-' exp {
         result = BinaryOpNode.new(:-, val[0], val[2])
       }
     | exp '*' exp {
         result = BinaryOpNode.new(:*, val[0], val[2])
       }
     | exp '/' exp {
         # Racc の問題により :/ の後に空白が必要
         result = BinaryOpNode.new(:/ , val[0], val[2])
       }
     | primary

  primary: '(' exp ')' {
             result = ExpNode.new(val[1])
           }
         | NUMBER {
             result = NumNode.new(val[0])
           }
         | dice_roll
         | range

  dice_roll: primary SYM_D primary =DICE_ROLL {
               result = DiceRollNode.new(val[0], val[2])
             }
           | SYM_D primary =SHORT_DICE_ROLL {
               result = DiceRollNode.new(NumNode.new(1), val[1])
             }

  range: '[' primary RANGE primary ']' {
           result = RangeNode.new(val[1], val[3])
         }
end

---- header

require 'strscan'
require_relative 'node/all'

---- inner

  include Node

  RESERVED = {
    'd' => :SYM_D,
    'D' => :SYM_D
  }

  def parse(str)
    @q = []

    s = StringScanner.new(str)
    until s.eos?
      s.skip(/\s*/)
      case
      when s.scan(/\.\.\.?/)
        @q << [:RANGE, nil]
      when s.scan(/\d+/)
        @q << [:NUMBER, s[0].to_i]
      else
        ch = s.getch
        @q << [RESERVED[ch] || ch, ch]
      end
    end

    @q << [false, '$end']
    do_parse
  end

  def next_token
    @q.shift
  end

---- footer


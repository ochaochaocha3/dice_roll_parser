class DiceRollParser
prechigh
  nonassoc RANGE
  left DICE_ROLL
  left SHORT_DICE_ROLL
  nonassoc UNARY_MINUS
  left '*' '/'
  left '+' '-'
  nonassoc '<' LEQ '>' GEQ '=' NEQ
preclow

rule
  target: judge
        | exp
        | /* none */ {
            result = ExpNode.new(NumNode.new(0))
          }

  judge: exp '<' exp {
           result = JudgeNode.new(:<, val[0], val[2])
         }
       | exp LEQ exp {
           result = JudgeNode.new(:<=, val[0], val[2])
         }
       | exp '>' exp {
           result = JudgeNode.new(:>, val[0], val[2])
         }
       | exp GEQ exp {
           result = JudgeNode.new(:>=, val[0], val[2])
         }
       | exp '=' exp {
           result = JudgeNode.new(:==, val[0], val[2], op_for_display: :'=')
         }
       | exp NEQ exp {
           result = JudgeNode.new(:!=, val[0], val[2], op_for_display: :'<>')
         }
       | inclusion_judge

  inclusion_judge: exp 'E' inclusion_judge_left_paren primary ',' primary inclusion_judge_right_paren {
                     include_min = (val[2] == '[')
                     include_max = (val[6] == ']')

                     result = InclusionJudgeNode.new(val[0], val[3], val[5],
                                                     include_min: include_min,
                                                     include_max: include_max)
                   }

  inclusion_judge_left_paren: '(' | '['
  inclusion_judge_right_paren: ')' | ']'

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

  primary: parenthesis
         | unary_minus
         | number
         | dice_roll
         | range
  primary_without_unary_minus: parenthesis
                             | number
                             | dice_roll
                             | range
  primary_without_dice_roll_unary_minus: parenthesis
                                       | number
                                       | range

  parenthesis: '(' exp ')' {
                 result = ExpNode.new(val[1])
               }
  unary_minus: '-' primary_without_unary_minus =UNARY_MINUS {
                 result = UnaryMinusNode.new(val[1])
               }
  number: NUMBER {
            result = NumNode.new(val[0])
          }

  dice_roll: primary_without_unary_minus SYM_D primary_without_dice_roll_unary_minus =DICE_ROLL {
               result = DiceRollNode.new(val[0], val[2])
             }
           | SYM_D primary_without_dice_roll_unary_minus =SHORT_DICE_ROLL {
               result = DiceRollNode.new(NumNode.new(1), val[1])
             }

  range: '[' primary RANGE primary ']' =RANGE {
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
      when s.scan(/<=/)
        @q << [:LEQ, nil]
      when s.scan(/>=/)
        @q << [:GEQ, nil]
      when s.scan(/<>/)
        @q << [:NEQ, nil]
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


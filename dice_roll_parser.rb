#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require 'strscan'
require_relative 'node/all'

class DiceRollParser < Racc::Parser

module_eval(<<'...end dice_roll.y/module_eval...', 'dice_roll.y', 107)

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

...end dice_roll.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    12,    35,    12,    11,    16,    49,    50,    13,    12,    11,
    16,    11,    16,    13,    15,    13,    15,    11,    16,    12,
   -29,    13,    15,    64,    65,    12,    35,    12,    11,    16,
    27,    28,    13,    15,    11,    16,    11,    16,    13,    15,
    13,    15,    27,    28,    25,    26,    27,    28,    12,   -27,
    12,    11,    16,    17,    41,    13,    55,    11,    16,    11,
    16,    13,    15,    13,    15,    12,   -26,    12,    27,    28,
    25,    26,    60,    12,    11,    16,    11,    16,    13,    15,
    13,    15,    11,    16,    12,    61,    13,    15,    57,   -28,
    12,   nil,    12,    11,    16,   nil,   nil,    13,    15,    11,
    16,    11,    16,    13,    15,    13,    15,    12,   nil,    12,
    11,    16,   nil,   nil,    13,    15,    11,    16,    11,    16,
    13,    15,    13,    15,    27,    28,    25,    26,    18,    19,
    20,    21,    22,    23,    24,    27,    28,    25,    26,    27,
    28,    25,    26,    27,    28,    25,    26,    27,    28,    25,
    26,    27,    28,    25,    26 ]

racc_action_check = [
    23,    34,    60,    15,    15,    24,    24,    15,    22,    23,
    23,    60,    60,    23,    23,    60,    60,    22,    22,    25,
    10,    22,    22,    62,    62,    57,    14,    48,    25,    25,
    51,    51,    25,    25,    57,    57,    48,    48,    57,    57,
    48,    48,    29,    29,    29,    29,    52,    52,    28,     8,
    11,    35,    35,     1,    17,    35,    29,    28,    28,    11,
    11,    28,    28,    11,    11,    27,     6,     0,    43,    43,
    43,    43,    58,    16,    27,    27,     0,     0,    27,    27,
     0,     0,    16,    16,    26,    59,    16,    16,    40,     9,
    18,   nil,    19,    26,    26,   nil,   nil,    26,    26,    18,
    18,    19,    19,    18,    18,    19,    19,    20,   nil,    21,
    12,    12,   nil,   nil,    12,    12,    20,    20,    21,    21,
    20,    20,    21,    21,     3,     3,     3,     3,     3,     3,
     3,     3,     3,     3,     3,    42,    42,    42,    42,    46,
    46,    46,    46,    45,    45,    45,    45,    44,    44,    44,
    44,    47,    47,    47,    47 ]

racc_action_pointer = [
    58,    53,   nil,   118,   nil,   nil,    43,   nil,    26,    66,
    -3,    41,    92,   nil,     3,   -15,    64,    54,    81,    83,
    98,   100,    -1,    -9,   -13,    10,    75,    56,    39,    36,
   nil,   nil,   nil,   nil,   -22,    33,   nil,   nil,   nil,   nil,
    86,   nil,   129,    62,   141,   137,   133,   145,    18,   nil,
   nil,    24,    40,   nil,   nil,   nil,   nil,    16,    55,    64,
    -7,   nil,     3,   nil,   nil,   nil ]

racc_action_default = [
    -3,   -39,    -1,    -2,   -10,   -20,   -21,   -22,   -23,   -24,
   -25,   -39,   -39,   -35,   -39,   -39,   -39,   -39,   -39,   -39,
   -39,   -39,   -39,   -39,   -39,   -39,   -39,   -39,   -39,   -39,
   -26,   -27,   -28,   -29,   -34,   -39,   -30,   -31,   -32,   -37,
   -39,    66,    -4,    -5,    -6,    -7,    -8,    -9,   -39,   -12,
   -13,   -16,   -17,   -18,   -19,   -33,   -36,   -39,   -39,   -39,
   -39,   -38,   -39,   -11,   -14,   -15 ]

racc_goto_table = [
    40,     3,    30,    34,    63,    36,     2,    31,    33,     4,
    37,    38,    29,    39,    48,     1,    32,   nil,   nil,    42,
    43,    44,    45,    46,    47,    36,    51,    52,    53,    54,
    37,    38,    58,    56,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    59,   nil,   nil,    62 ]

racc_goto_check = [
     6,     3,     8,    13,     7,     8,     2,    10,    12,     4,
    10,    12,     3,    14,     5,     1,    11,   nil,   nil,     3,
     3,     3,     3,     3,     3,     8,     3,     3,     3,     3,
    10,    12,     6,    14,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     6,   nil,   nil,     6 ]

racc_goto_pointer = [
   nil,    15,     6,     1,     9,   -10,   -16,   -58,   -10,   nil,
    -5,     4,    -4,    -9,    -2 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,     5,   nil,     6,     7,
     8,     9,    10,    14,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 25, :_reduce_none,
  1, 25, :_reduce_none,
  0, 25, :_reduce_3,
  3, 26, :_reduce_4,
  3, 26, :_reduce_5,
  3, 26, :_reduce_6,
  3, 26, :_reduce_7,
  3, 26, :_reduce_8,
  3, 26, :_reduce_9,
  1, 26, :_reduce_none,
  7, 28, :_reduce_11,
  1, 29, :_reduce_none,
  1, 29, :_reduce_none,
  1, 31, :_reduce_none,
  1, 31, :_reduce_none,
  3, 27, :_reduce_16,
  3, 27, :_reduce_17,
  3, 27, :_reduce_18,
  3, 27, :_reduce_19,
  1, 27, :_reduce_none,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  1, 30, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  3, 32, :_reduce_33,
  2, 33, :_reduce_34,
  1, 34, :_reduce_35,
  3, 35, :_reduce_36,
  2, 35, :_reduce_37,
  5, 36, :_reduce_38 ]

racc_reduce_n = 39

racc_shift_n = 66

racc_token_table = {
  false => 0,
  :error => 1,
  :RANGE => 2,
  :DICE_ROLL => 3,
  :SHORT_DICE_ROLL => 4,
  :UNARY_MINUS => 5,
  "*" => 6,
  "/" => 7,
  "+" => 8,
  "-" => 9,
  "<" => 10,
  :LEQ => 11,
  ">" => 12,
  :GEQ => 13,
  "=" => 14,
  :NEQ => 15,
  "E" => 16,
  "," => 17,
  "(" => 18,
  "[" => 19,
  ")" => 20,
  "]" => 21,
  :NUMBER => 22,
  :SYM_D => 23 }

racc_nt_base = 24

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "RANGE",
  "DICE_ROLL",
  "SHORT_DICE_ROLL",
  "UNARY_MINUS",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\"<\"",
  "LEQ",
  "\">\"",
  "GEQ",
  "\"=\"",
  "NEQ",
  "\"E\"",
  "\",\"",
  "\"(\"",
  "\"[\"",
  "\")\"",
  "\"]\"",
  "NUMBER",
  "SYM_D",
  "$start",
  "target",
  "judge",
  "exp",
  "inclusion_judge",
  "inclusion_judge_left_paren",
  "primary",
  "inclusion_judge_right_paren",
  "parenthesis",
  "unary_minus",
  "number",
  "dice_roll",
  "range",
  "primary_without_unary_minus",
  "primary_without_dice_roll_unary_minus" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

module_eval(<<'.,.,', 'dice_roll.y', 15)
  def _reduce_3(val, _values, result)
                result = ExpNode.new(NumNode.new(0))
          
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 19)
  def _reduce_4(val, _values, result)
               result = JudgeNode.new(:<, val[0], val[2])
         
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 22)
  def _reduce_5(val, _values, result)
               result = JudgeNode.new(:<=, val[0], val[2])
         
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 25)
  def _reduce_6(val, _values, result)
               result = JudgeNode.new(:>, val[0], val[2])
         
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 28)
  def _reduce_7(val, _values, result)
               result = JudgeNode.new(:>=, val[0], val[2])
         
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 31)
  def _reduce_8(val, _values, result)
               result = JudgeNode.new(:==, val[0], val[2], op_for_display: :'=')
         
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 34)
  def _reduce_9(val, _values, result)
               result = JudgeNode.new(:!=, val[0], val[2], op_for_display: :'<>')
         
    result
  end
.,.,

# reduce 10 omitted

module_eval(<<'.,.,', 'dice_roll.y', 39)
  def _reduce_11(val, _values, result)
                         include_min = (val[2] == '[')
                     include_max = (val[6] == ']')

                     result = InclusionJudgeNode.new(val[0], val[3], val[5],
                                                     include_min: include_min,
                                                     include_max: include_max)
                   
    result
  end
.,.,

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

module_eval(<<'.,.,', 'dice_roll.y', 51)
  def _reduce_16(val, _values, result)
             result = BinaryOpNode.new(:+, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 54)
  def _reduce_17(val, _values, result)
             result = BinaryOpNode.new(:-, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 57)
  def _reduce_18(val, _values, result)
             result = BinaryOpNode.new(:*, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 60)
  def _reduce_19(val, _values, result)
             # Racc の問題により :/ の後に空白が必要
         result = BinaryOpNode.new(:/ , val[0], val[2])
       
    result
  end
.,.,

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

# reduce 24 omitted

# reduce 25 omitted

# reduce 26 omitted

# reduce 27 omitted

# reduce 28 omitted

# reduce 29 omitted

# reduce 30 omitted

# reduce 31 omitted

# reduce 32 omitted

module_eval(<<'.,.,', 'dice_roll.y', 79)
  def _reduce_33(val, _values, result)
                     result = ExpNode.new(val[1])
               
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 82)
  def _reduce_34(val, _values, result)
                     result = UnaryMinusNode.new(val[1])
               
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 85)
  def _reduce_35(val, _values, result)
                result = NumNode.new(val[0])
          
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 89)
  def _reduce_36(val, _values, result)
                   result = DiceRollNode.new(val[0], val[2])
             
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 92)
  def _reduce_37(val, _values, result)
                   result = DiceRollNode.new(NumNode.new(1), val[1])
             
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 96)
  def _reduce_38(val, _values, result)
               result = RangeNode.new(val[1], val[3])
         
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class DiceRollParser



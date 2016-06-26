#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require 'strscan'
require_relative 'node/all'

class DiceRollParser < Racc::Parser

module_eval(<<'...end dice_roll.y/module_eval...', 'dice_roll.y', 77)

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

...end dice_roll.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    10,     9,    41,    11,    13,    14,    10,     9,    15,    11,
    13,    14,    18,    19,    16,    17,   -13,    37,    10,     9,
   -14,    11,    13,    14,    10,     9,   -15,    11,    13,    14,
    10,     9,   -16,    11,    13,    14,    10,     9,    26,    11,
    13,    14,    10,     9,    32,    11,    13,    14,    10,     9,
    26,    11,    13,    14,     9,    39,    11,    13,    14,     9,
     9,    11,    11,    14,    14,    18,    19,    16,    17,    18,
    19,    18,    19 ]

racc_action_check = [
    18,    18,    40,    18,    18,    18,    19,    19,     1,    19,
    19,    19,    20,    20,    20,    20,     4,    20,    39,    39,
     6,    39,    39,    39,     0,     0,     7,     0,     0,     0,
    14,    14,     8,    14,    14,    14,     9,     9,    12,     9,
     9,     9,    16,    16,    15,    16,    16,    16,    17,    17,
    25,    17,    17,    17,    10,    31,    10,    10,    10,    26,
    13,    26,    13,    26,    13,     2,     2,     2,     2,    33,
    33,    34,    34 ]

racc_action_pointer = [
    15,     8,    59,   nil,     3,   nil,     7,    13,    19,    27,
    44,   nil,    25,    50,    21,    44,    33,    39,    -9,    -3,
     6,   nil,   nil,   nil,   nil,    37,    49,   nil,   nil,   nil,
   nil,    53,   nil,    63,    65,   nil,   nil,   nil,   nil,     9,
   -13,   nil ]

racc_action_default = [
    -2,   -26,    -1,    -7,    -8,    -9,   -10,   -11,   -12,   -26,
   -26,   -22,   -26,   -26,   -26,   -26,   -26,   -26,   -26,   -26,
   -26,   -13,   -14,   -15,   -16,   -21,   -26,   -17,   -18,   -19,
   -24,   -26,    42,    -3,    -4,    -5,    -6,   -20,   -23,   -26,
   -26,   -25 ]

racc_goto_table = [
    31,     2,    30,    23,    25,    24,    21,     1,    29,    27,
    20,    22,   nil,   nil,    28,    38,   nil,    33,    34,    35,
    36,    29,    27,   nil,   nil,    40,   nil,    28 ]

racc_goto_check = [
     3,     2,    10,     7,     9,     8,     4,     1,     8,     4,
     2,     6,   nil,   nil,     6,    10,   nil,     2,     2,     2,
     2,     8,     4,   nil,   nil,     3,   nil,     6 ]

racc_goto_pointer = [
   nil,     7,     1,   -14,    -4,   nil,     1,    -7,    -5,    -6,
   -11 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,    12,
   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 17, :_reduce_1,
  0, 17, :_reduce_2,
  3, 18, :_reduce_3,
  3, 18, :_reduce_4,
  3, 18, :_reduce_5,
  3, 18, :_reduce_6,
  1, 18, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 25, :_reduce_none,
  1, 25, :_reduce_none,
  1, 25, :_reduce_none,
  1, 25, :_reduce_none,
  1, 26, :_reduce_none,
  1, 26, :_reduce_none,
  1, 26, :_reduce_none,
  3, 20, :_reduce_20,
  2, 21, :_reduce_21,
  1, 22, :_reduce_22,
  3, 23, :_reduce_23,
  2, 23, :_reduce_24,
  5, 24, :_reduce_25 ]

racc_reduce_n = 26

racc_shift_n = 42

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
  "(" => 10,
  ")" => 11,
  :NUMBER => 12,
  :SYM_D => 13,
  "[" => 14,
  "]" => 15 }

racc_nt_base = 16

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
  "\"(\"",
  "\")\"",
  "NUMBER",
  "SYM_D",
  "\"[\"",
  "\"]\"",
  "$start",
  "target",
  "exp",
  "primary",
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

module_eval(<<'.,.,', 'dice_roll.y', 12)
  def _reduce_1(val, _values, result)
                unless val[0].kind_of?(ExpNode)
              result = ExpNode.new(val[0])
            end
          
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 17)
  def _reduce_2(val, _values, result)
                result = ExpNode.new(NumNode.new(0))
          
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 21)
  def _reduce_3(val, _values, result)
             result = BinaryOpNode.new(:+, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 24)
  def _reduce_4(val, _values, result)
             result = BinaryOpNode.new(:-, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 27)
  def _reduce_5(val, _values, result)
             result = BinaryOpNode.new(:*, val[0], val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 30)
  def _reduce_6(val, _values, result)
             # Racc の問題により :/ の後に空白が必要
         result = BinaryOpNode.new(:/ , val[0], val[2])
       
    result
  end
.,.,

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

module_eval(<<'.,.,', 'dice_roll.y', 49)
  def _reduce_20(val, _values, result)
                     result = ExpNode.new(val[1])
               
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 52)
  def _reduce_21(val, _values, result)
                     result = UnaryMinusNode.new(val[1])
               
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 55)
  def _reduce_22(val, _values, result)
                result = NumNode.new(val[0])
          
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 59)
  def _reduce_23(val, _values, result)
                   result = DiceRollNode.new(val[0], val[2])
             
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 62)
  def _reduce_24(val, _values, result)
                   result = DiceRollNode.new(NumNode.new(1), val[1])
             
    result
  end
.,.,

module_eval(<<'.,.,', 'dice_roll.y', 66)
  def _reduce_25(val, _values, result)
               result = RangeNode.new(val[1], val[3])
         
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class DiceRollParser



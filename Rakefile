require 'rake/clean'

DICE_ROLL_PARSER = 'dice_roll_parser.rb'
DICE_ROLL_PARSER_OUTPUT = DICE_ROLL_PARSER.sub(/\.rb$/, '.output')

CLEAN.include(DICE_ROLL_PARSER_OUTPUT)
CLOBBER.include(DICE_ROLL_PARSER)

task :default => DICE_ROLL_PARSER

desc 'Racc を利用してダイスロール構文解析器を生成する'
file DICE_ROLL_PARSER => 'dice_roll.y' do |t|
  sh 'racc', '--verbose', '-o', t.name, *t.prerequisites
end

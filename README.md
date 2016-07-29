# ダイスロール構文解析器

Racc を使い、どどんとふで使われている「[ボーンズ＆カーズ](https://github.com/torgtaitai/BCDice)」風の文法のダイスロール構文解析器を作ってみます。

## 準備

[bundler](http://bundler.io/) を入れてから以下を実行します。

```bash
bundle install --path=vendor/bundle
```

## 生成

rake タスクを利用します。dice\_roll.y を編集して以下を実行します。

```bash
rake
```

## 使用法

### 現在対応している文法
* 通常ロール
    * `nDf`：<var>n</var> 個、面数 <var>f</var>
    * `Df`：1 個、面数 <var>f</var>
    * `D` は小文字 `d` でも可。
    * 面数 <var>f</var> のダイスを <var>n</var> 個振って出た目の合計。
* 加減乗除
* 括弧
* ランダム数値の埋め込み
    * `[min..max]`（bash 風）
    * `[min...max]`（どどんとふ）
    * どちらでも <var>min</var> 以上 <var>max</var> 以下の整数乱数を返す。
* 判定
    * 成功 `:success` または失敗 `:failure` が返る。
    * `式 1 < 式 2`：未満
    * `式 1 <= 式 2`：以下
    * `式 1 > 式 2`：超過
    * `式 1 >= 式 2`：以上
    * `式 1 = 式 2`：等しい
    * `式 1 <> 式 2`：異なる

### 構文解析
構文木が生成されます。

```ruby
require './dice_roll_parser'

parser = DiceRollParser.new
expr = parser.parse('3 * ([1..3] * 2)d6 + [0..5]')
#=> #<Node::ExpNode #<Node::BinaryOpNode op=+ lhs=#<Node::BinaryOpNode op=* lhs=#<Node::NumNode 3> rhs=#<Node::DiceRollNode n=#<Node::ExpNode #<Node::BinaryOpNode op=* lhs=#<Node::RangeNode min=#<Node::NumNode 1> max=#<Node::NumNode 3>> rhs=#<Node::NumNode 2>>> faces=#<Node::NumNode 6>>> rhs=#<Node::RangeNode min=#<Node::NumNode 0> max=#<Node::NumNode 5>>>>
```

### 確定
ダイスロール、ランダム数値の埋め込みが含まれている場合、評価する前に値を確定させる必要があります。

```ruby
expr.determine!
#=> #<Node::ExpNode #<Node::BinaryOpNode op=+ lhs=#<Node::BinaryOpNode op=* lhs=#<Node::NumNode 3> rhs=#<Node::DiceRollResultNode n=#<Node::ExpNode #<Node::BinaryOpNode op=* lhs=#<Node::RangeResultNode min=#<Node::NumNode 1> max=#<Node::NumNode 3> = [1..3] => 2> rhs=#<Node::NumNode 2>>> faces=#<Node::NumNode 6> = 4d6 => [1, 3, 3, 5] = 12> rhs=#<Node::RangeResultNode min=#<Node::NumNode 0> max=#<Node::NumNode 5> = [0..5] => 3>>>
```

### 中置記法への変換
ダイスロール等の確定した結果を含む中置記法に変換します。

```ruby
expr.to_infix_notation
#=> "(3 * {{({[1..3] => 2} * 2)d6 = 4d6 => [1, 3, 3, 5] = 12}) + {[0..5] => 3}"
```

### 評価
Ruby の値に変換します。

```ruby
expr.evaluate
#=> 39
```

## ライセンス
MIT License

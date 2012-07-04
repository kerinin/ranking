# ranking

## Description

Extends `Set` to be ordered by a score.  Sort of like a set, in that there are 
no duplicates, but also sort of like an array, in that it's ordered.  

Create an instance, add some objects to it, and set the scores for those objects.
When you iterate or slice the instance it'll be sorted by score behind the 
scenes.

## Examples

``` ruby
require 'ranking'

ranking = Ranking.new
ranking << :foo
ranking << :bar

ranking.inc(:foo, 2)      # Incremente score of :foo by one
ranking.dec(:bar)         # Decrement, defaults to 1
ranking.score(:baz, 3)    # Set score explicitly, implicitly adds :baz to the set

ranking.to_a              # => [:baz, :foo, :bar]
ranking.scores[:foo]      # => 2
```

Or, if you wanted something more useful, here's a script I wrote to see
which commands in my `.bash_history` are the most common:

``` ruby
require 'ranking'

word_freq = Ranking.new

File.open(File.expand_path("~/.bash_history")).each_line do |line|
  words = line.chomp.split(" ")
  words.each_index do |i|
    word_freq.inc( words[0..i].join(" ") )
  end
end

puts "Top 50 commands in ~/.bash_history"
puts "-------"
word_freq[0..49].each_index do |i|
  word = word_freq[i]
  puts "#{"%2i" % [i+1]}) #{word} (#{word_freq.scores[word]})"
end
```

## Install

  $ gem install ranking

## Copyright

Copyright (c) 2012 Ryan Michael

See LICENSE.txt for details.

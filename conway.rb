#!/usr/bin/env ruby

require_relative 'lib/game'

game = Game.new [[5,5,true], [6,5,true], [6,6,true], [6,7,true]]

while true
  game.next_turn!
end

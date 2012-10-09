#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/cell'

game = Game.new [[5,5,Cell.new('live')], [6,5,Cell.new('live')], [6,6,Cell.new('live')], [6,7,Cell.new('live')]]

while true
  game.next_turn!
end

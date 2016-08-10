require'colorize'
require'pry'

module Slot
  class Slots
    def self.repeat_slots
      print 'enter $50 to play slots press "a" to continue "b" to quit: '
      player = gets.strip
      if player  == 'a'
        Slot::Slots.playing_slots
      else player == 'b'
        puts "Thank you for playing Slots!"
      end
    end

    def self.goodbye
      puts "Thank you for playing Slots!"
    end

    def self.playing_slots
      slot_options = ["grapes", "strawberries", "lemons", "avocado"]
      col_1 = slot_options.sample
      col_2 = slot_options.sample
      col_3 = slot_options.sample
      puts "#{col_1} #{col_2} #{col_3} "
      if $player.bank_roll <= 0
        puts 'ooooowwwww!!! your out of money'
        # Slots::Slots.goodbye
      end

      if col_1 == col_2 && col_1 == col_3
        puts 'you win $10,000'.colorize(:blue)
        # @bank_roll += 10000
        $player.update_balance('+', 10000)
        Slots.repeat_slots
      else
        puts 'you lose $50'.colorize(:red)
        $player.update_balance('-', 50)
        Slots.repeat_slots
        # binding.pry
        # @bank_roll -= 50
      end
      # binding.pry@p
    end
  end
end

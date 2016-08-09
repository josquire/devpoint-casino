require 'colorize'
#require_relative 'casino'
require 'pry'

class Player
  def update_balance(num)
    @bank_roll += num
  end
end

#will you bet on black or red
#do you want to pick a number y/n
#what number will you pick
#array of numbers pick sample of a number
#pick a random color
#compare bet with random number
#if win yay add to bank_roll
#if lose boo minus to bank_roll
#play again?


class Spin_num
  attr_accessor :color, :number
  def initialize(number, color)
    @number = number
    @color = color
  end
end

class Roulette
  def initialize
    @number_array =  %w(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)
    generate_number
  end


  def generate_number
    @number = @number_array.sample
      color = (@number % 2 == 0) ? 'Black' : 'Red'
      @wheel_num = Spin_num.new(@number, color)
      puts "#{@wheel_num.number} #{@wheel_num.color}"
  end
end


def start
  @new_game = Roulette.new
end

start

require 'colorize'
#require_relative 'casino'
require 'pry'

class Player
  def update_balance(num)
    @bank_roll += num
  end
end


class Roulette
  def initialize
    @number_array =  %w(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36)
    @red = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]
    @black = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35]
  end


  def generate_number
    @wheel_num = @number_array.sample
  end

  def roulette_menu
    generate_number
    puts "\nWelcome to Roulette, how much would you like bet?"
    @bet_amount = gets.strip.to_f
    puts "Pick your color, Red or Black?"
    player_color = gets.strip.downcase

    if player_color == "red"
      puts "Pick one of these numbers"
      puts "1, 3, 5, 7, 9, 12, 14, 16, 18,"
      puts "19, 21, 23, 25, 27, 30, 32, 34, 36"
      @player_input = gets.strip.to_i

      if @red.include?(@player_input)
        puts "You have picked #{@player_input} Red"
      else
        puts "Invalid Entry pick again."
        roulette_menu
      end

    elsif player_color == "black"
      puts "Pick one of these numbers"
      puts "2, 4, 6, 8, 10, 11, 13, 15, 17, 20,"
      puts "22, 24, 26, 28, 29, 31, 33, 35"
      @player_input = gets.strip.to_i

      if @black.include?(@player_input)
        puts "You have picked #{@player_input} Black"
      else
        puts "Invalid Entry pick again."
        roulette_menu
      end
    else
      puts "Invalid entry, try again."
      roulette_menu
    end

  def compare
    puts "\nDealer spinning the wheel..."
    puts " "
    puts "The ball has landed on #{@wheel_num}"
    @player_input = @player_input.to_s
    if @wheel_num == @player_input
      puts "You win!! #{@bet_amount * 35}".colorize(:green)
      #@player.update_balance('+', @bet_amount * 35)
    else
      puts "You lose! $#{@bet_amount}".colorize(:red)
      #@player.update_balance('-', @bet_amount)
    end
    play_again
  end
  compare
end

def play_again
  puts "Would you like to play again? (y/n)"
  again = gets.strip.downcase

  if again == 'y'
    start
  else
    exit
    #casino
  end
  end
end



def start
  @new_game = Roulette.new
  roulette_menu
end


@new_game = Roulette.new
@new_game.roulette_menu

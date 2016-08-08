require_relative 'player'

class Casino
  # make sure you use attr_accessor

  def initialize
    puts "Welcome to the Casino!"
    @player = Player.new

  end

end

Casino.new

require_relative "Board.rb"
require_relative "card.rb"
require_relative "HumanPlayer.rb"
require_relative "ComputerPlayer"


class Game
  TYPE_OF_CARD = (:A .. :Z).to_a
  def initialize()
    p "How many pair of cards do you wanna play with please TYPE an WHOLE number"
    num_of_cards = gets.chomp.to_i
    cards = Array.new(num_of_cards*2)
    i = 0
    while i < cards.length
        value = TYPE_OF_CARD.sample
        cards[i] = Card.new(value)
        cards[i+1] = Card.new(value)
      i+=2
    end
    @board = Board.new(cards)
    p "whom is gonna play this game? type 1 for human player any thing else for computer player"
    player_choice = gets.chomp.to_i
    if player_choice == 1
      @player = HumanPlayer.new
    else
      @player = ComputerPlayer.new(cards.length)
    end
  end

  def play()
    while !@board.won?
      @board.render
      previous_guess = @player.make_guess
      previous_card = @board.reveal(previous_guess)
      @board.render
      second_guess = @player.make_guess
      second_card = @board.reveal(second_guess)
      @board.render
      if !(previous_card == second_card)
        @board.hide_cards(previous_guess,second_guess)
      end
      @player.matching_result(previous_card,previous_guess,second_card,second_guess)
    end
    p "YAAAAAAAAAAY!!!!!!!!!!"
  end



end



if __FILE__ == $PROGRAM_NAME
  b = Game.new()
  b.play
end
